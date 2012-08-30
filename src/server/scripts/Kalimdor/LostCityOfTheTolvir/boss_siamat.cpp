/*
 * Copyright (C) 2011-2012 DarkCore <http://www.darkpeninsula.eu/>
 * Copyright (C) 2011-2012 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
 SDName: boss_siamat
 SD%Complete: 100%
 SDComment:
 SDCategory: Lost City of the Tol'vir
 EndScriptData */

#include "ScriptPCH.h"
#include "lost_city_of_the_tolvir.h"

enum Spells
{
    // Siamat
    SPELL_DEFLECTING_WINDS      = 84589,
    SPELL_STORM_BOLT_PHASE_1    = 73564,
    SPELL_WAILING_WINDS         = 83066,
    SPELL_STORM_BOLT_PHASE_2    = 95180,
    SPELL_ABSORB_STORMS         = 84982,
    
    // Servants
    SPELL_LIGHTNING_NOVA        = 65279,
    SPELL_THUNDER_CRASH         = 84522,
    SPELL_LIGHTNING_CHARGE      = 91872,
    
    // Minions
    SPELL_CHAIN_LIGHTNING       = 90027,
    SPELL_TEMPEST_STORM         = 90030,
    SPELL_DEPLETION             = 84550,
};

enum Yells
{
    SAY_AGGRO                   = -1812021,
    SAY_KILL                    = -1812022,
    SAY_DEATH                   = -1812023,
    SAY_STORM                   = -1812024,
};

enum Events
{
    EVENT_PHASE_STATIC          = 0,
    EVENT_PHASE_MOVE            = 1,
};

class boss_siamat : public CreatureScript
{
public:
    boss_siamat() : CreatureScript("boss_siamat") { }
    
    struct boss_siamatAI : public ScriptedAI
    {
        boss_siamatAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = me->GetInstanceScript();
            pCreature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
        }
        
        InstanceScript* pInstance;
        
        uint32 EventStep;
        uint32 NextEventTimer;
        uint32 PhaseOneTimer;
        uint32 DeflectingWindsTimer;
        uint32 StormBoltPhase1Timer;
        uint32 SummonServantTimer;
        uint32 SummonMinionTimer;
        uint32 WailingWindsTimer;
        uint32 StormBoltPhase2Timer;
        uint32 AbsorbStormsTimer;
        
        void NextStep(uint32 uiTime = 1000)
        {
            ++EventStep;
            NextEventTimer = uiTime;
        }
        
        void Reset()
        {
            me->RemoveAllAuras();
            
            EventStep            = 0;
            NextEventTimer       = 0;
            PhaseOneTimer        = 135000;
            DeflectingWindsTimer = 1000;
            StormBoltPhase1Timer = 3000;
            SummonServantTimer   = 5000;
            SummonMinionTimer    = 5000;
            WailingWindsTimer    = 1000;
            StormBoltPhase2Timer = 10000;
            AbsorbStormsTimer    = 5000;
        }
        
        void EnterCombat(Unit* pWho)
        {
            me->AddAura(SPELL_DEFLECTING_WINDS, me);
            
            DoScriptText(SAY_AGGRO, me);
        }
        
        void KilledUnit(Unit *victim)
        {
            DoScriptText(SAY_KILL, me);
        }
        
        void JustDied(Unit* /*Killer*/)
        {
            DoScriptText(SAY_DEATH, me);

            // Temp Fix In Wait for Correct Implementation on Database
            AchievementEntry const *AchievLcotTN = sAchievementStore.LookupEntry(ACHIEVEMENT_LCOTT_N);
            AchievementEntry const *AchievLcotTH = sAchievementStore.LookupEntry(ACHIEVEMENT_LCOTT_H);

            Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
            if (!PlayerList.isEmpty())
            {
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                {
                    if (me->GetMap()->IsHeroic())
                        i->getSource()->CompletedAchievement(AchievLcotTH);
                    else
                        i->getSource()->CompletedAchievement(AchievLcotTN);
                }
            }
        }
        
        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;
            
            if (NextEventTimer <= diff)
            {
                switch (EventStep)
                {
                    case EVENT_PHASE_STATIC:
                    {
                        if (PhaseOneTimer <= diff)
                        {
                            DoScriptText(SAY_STORM, me);
                            me->RemoveAura(SPELL_DEFLECTING_WINDS);
                            me->SetSpeed(MOVE_RUN, 1.0f);
                            me->SetSpeed(MOVE_WALK, 1.0f);
                            NextStep();
                            PhaseOneTimer = 200000;
                        }
                        else
                            PhaseOneTimer -= diff;
                        
                        if (StormBoltPhase1Timer <= diff)
                        {
                            if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                                DoCast(pTarget, SPELL_STORM_BOLT_PHASE_1);
                                
                            StormBoltPhase1Timer = 3000;
                        }
                        else
                            StormBoltPhase1Timer -= diff;
                        
                        if (SummonServantTimer <= diff)
                        {
                            Position myPos;
                            me->GetPosition(&myPos);
                            
                            if (Creature* summon = me->SummonCreature(NPC_SIAMAT_SERVANT, myPos, TEMPSUMMON_TIMED_DESPAWN, 300000))
                                DoZoneInCombat(summon);
                            
                            SummonServantTimer = 45000;
                        }
                        else
                            SummonServantTimer -= diff;
                        
                        if (SummonMinionTimer <= diff)
                        {
                            Position myPos;
                            me->GetPosition(&myPos);
                            
                            if (Creature* summon = me->SummonCreature(NPC_SIAMAT_MINION, myPos, TEMPSUMMON_TIMED_DESPAWN, 300000))
                                DoZoneInCombat(summon);
                            
                            SummonMinionTimer = 30000;
                        }
                        else
                            SummonMinionTimer -= diff;
                        
                        break;
                    }
                    case EVENT_PHASE_MOVE:
                    {
                        if (WailingWindsTimer <= diff)
                        {
                            DoCast(me, SPELL_WAILING_WINDS);
                            WailingWindsTimer = 200000;
                        }
                        else
                            WailingWindsTimer -= diff;
                        
                        if (AbsorbStormsTimer <= diff)
                        {
                            me->AddAura(SPELL_ABSORB_STORMS, me);
                            AbsorbStormsTimer = 5000;
                        }
                        else
                            AbsorbStormsTimer -= diff;
                        
                        if (StormBoltPhase2Timer <= diff)
                        {
                            if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                                DoCast(pTarget, SPELL_STORM_BOLT_PHASE_2);
                            
                            StormBoltPhase2Timer = 10000;
                        }
                        else
                            StormBoltPhase2Timer -= diff;

                        break;
                    }
                }
            }
            else
                NextEventTimer -= diff;
            
            DoMeleeAttackIfReady();
        }
    };
    
    CreatureAI* GetAI(Creature *pCreature) const
    {
        return new boss_siamatAI (pCreature);
    }
};

class mob_siamat_servant : public CreatureScript
{
public:
    mob_siamat_servant() : CreatureScript("mob_siamat_servant") { }
    
    struct mob_siamat_servantAI : public ScriptedAI
    {
        mob_siamat_servantAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = me->GetInstanceScript();
        }
        
        InstanceScript* pInstance;
        
        bool Charge;
        uint32 LightningNovaTimer;
        uint32 ThunderCrashTimer;
        
        void Reset()
        {            
            Charge                 = false;
            LightningNovaTimer     = 5000;
            ThunderCrashTimer      = 10000;
        }
        
        void EnterCombat(Unit* pWho){}
        
        void JustReachedHome()
        {            
            me->DespawnOrUnsummon();
        }
        
        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;
            
            if (LightningNovaTimer <= diff)
            {
                DoCast(me, SPELL_LIGHTNING_NOVA);
                LightningNovaTimer = 10000;
            }
            else
                LightningNovaTimer -= diff;
            
            if (ThunderCrashTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_THUNDER_CRASH);
                ThunderCrashTimer = 10000;
            }
            else
                ThunderCrashTimer -= diff;
            
            if (me->HealthBelowPct(4) && !Charge)
            {
                DoCast(me, SPELL_LIGHTNING_CHARGE);
                Charge = true;
            }

            DoMeleeAttackIfReady();
        }
    };
    
    CreatureAI* GetAI(Creature *pCreature) const
    {
        return new mob_siamat_servantAI (pCreature);
    }
};

class mob_siamat_minion : public CreatureScript
{
public:
    mob_siamat_minion() : CreatureScript("mob_siamat_minion") { }
    
    struct mob_siamat_minionAI : public ScriptedAI
    {
        mob_siamat_minionAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = me->GetInstanceScript();
        }
        
        InstanceScript* pInstance;
        
        bool Charge;
        uint32 ChainLightningTimer;
        uint32 TempestStormTimer;
        uint32 DepletionTimer;
        
        void Reset()
        {            
            Charge                  = false;
            ChainLightningTimer     = 5000;
            TempestStormTimer       = 10000;
            DepletionTimer          = 45000;
        }
        
        void EnterCombat(Unit* pWho){}
        
        void JustReachedHome()
        {            
            me->DespawnOrUnsummon();
        }
        
        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;
            
            if (ChainLightningTimer <= diff)
            {
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                    DoCast(pTarget, SPELL_CHAIN_LIGHTNING);
                
                ChainLightningTimer = 5000;
            }
            else
                ChainLightningTimer -= diff;
            
            if (me->HealthBelowPct(5) && !Charge)
            {
                DoCast(me, SPELL_TEMPEST_STORM);
                Charge = true;
            }
            
            DoMeleeAttackIfReady();
        }
    };
    
    CreatureAI* GetAI(Creature *pCreature) const
    {
        return new mob_siamat_minionAI (pCreature);
    }
};

void AddSC_boss_siamat()
{
    new boss_siamat();
    new mob_siamat_servant();
    new mob_siamat_minion();
}