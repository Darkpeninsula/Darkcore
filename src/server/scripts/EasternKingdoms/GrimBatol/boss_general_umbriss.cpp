/*
 * Copyright (C) 2011-2012 DarkCore <http://www.darkpeninsula.eu/>
 * Copyright (C) 2011-2012 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
 *
 * Copyright (C) 2011-2012 Naios <https://github.com/Naios/DeepshjirRepack>
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

#include "ScriptPCH.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"

#define SAY_AGGRO "A million more await my orders. What chance you do have?"
#define SAY_DIED "Vermin, your dinner awaits!"

enum CreatureIds
{
    BOSS_UMBRISS    = 39625,
    MOB_TROGG_MALICE   = 39984,
    MOB_TROGG_DWE   = 45467,
};

enum Spells
{
    //Umbriss
    SPELL_FRENZY = 74853,
    SPELL_GROUND_SIEGE = 74634,
    SPELL_BLITZ = 74670,
    SPELL_BLEENDING_WOUND = 74846,
    SPELL_SUMMON_SKARDYN = 74859,
    //Trogg Malveillant and Dweller
    SPELL_MALICE = 74699,
    SPELL_MALICE_EFFECT = 90170,
    SPELL_MODGUD = 74837,
    SPELL_PUNCTURE = 76507,
};

enum Events
{
    //Umbriss
    EVENT_GROUND_SIEGE  = 0,
    EVENT_BLITZ   = 1,
    EVENT_BLEENDING_WOUND    = 2,
    EVENT_SUMMON_SKARDYN   = 3,
    //Trogg
    EVENT_PUNCTURE   = 4,
    EVENT_MALICE      = 5,
    EVENT_MOGUD    = 6,
};

enum SummonIds
{
    NPC_TROGG_MALICE = 39984,
    NPC_TROGG_DWE = 45467,
};

const Position aSpawnLocations[3] =
{
    {-721.551697f, -439.109711f, 268.767456f, 0.814808f},
    {-700.411255f, -454.676971f, 268.767395f, 1.388150f},
    {-697.920105f, -435.002228f, 269.147583f, 1.470617f},
};

class boss_umbriss : public CreatureScript
{
    public:
        boss_umbriss() : CreatureScript("boss_umbriss") {}

        struct boss_umbrissAI : public ScriptedAI
        {
            boss_umbrissAI(Creature* pCreature) : ScriptedAI(pCreature), Summons(me)
            {
                pInstance = pCreature->GetInstanceScript();
            }

            InstanceScript* pInstance;
            EventMap events;
            SummonList Summons;

            bool isEnraged;

            void EnterCombat(Unit * /*who*/)
            {
                EnterPhaseGround();
                me->MonsterYell(SAY_AGGRO, 0, 0);
            }

            void JustDied(Unit* /*killer*/)
            {
                me->MonsterYell(SAY_DIED, 0, 0);
            }

            void JustSummoned(Creature *pSummoned)
            {
                pSummoned->SetInCombatWithZone();
                if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                pSummoned->AI()->AttackStart(pTarget);

                Summons.Summon(pSummoned);
            }

            void Reset()
            {
                events.Reset();
                Summons.DespawnAll();
                isEnraged = false;
            }

            void EnterPhaseGround()
            {
                events.ScheduleEvent(EVENT_GROUND_SIEGE, 6000);
                events.ScheduleEvent(EVENT_BLITZ, 13000);
                events.ScheduleEvent(EVENT_BLEENDING_WOUND, 20000);
                events.ScheduleEvent(EVENT_SUMMON_SKARDYN, 60000);
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                if (HealthBelowPct(30) && !isEnraged)
                {
                    DoCast(me, SPELL_FRENZY);
                    return;
                }
                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch(eventId)
                    {
                        case EVENT_GROUND_SIEGE:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                DoCast(target, SPELL_GROUND_SIEGE);
                            events.ScheduleEvent(EVENT_GROUND_SIEGE, 6000);
                            return;
                        case EVENT_BLITZ:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM,1,100,true))
                                DoCast(target, SPELL_BLITZ);
                            events.ScheduleEvent(EVENT_BLITZ, 13000);
                            return;
                        case EVENT_BLEENDING_WOUND:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                DoCast(target, SPELL_BLEENDING_WOUND);
                            events.ScheduleEvent(EVENT_BLEENDING_WOUND, 20000);
                            return;
                        case EVENT_SUMMON_SKARDYN:
                            me->SummonCreature(NPC_TROGG_MALICE, aSpawnLocations[0].GetPositionX(), aSpawnLocations[0].GetPositionY(), aSpawnLocations[0].GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN);
                            me->SummonCreature(NPC_TROGG_DWE, aSpawnLocations[1].GetPositionX(), aSpawnLocations[1].GetPositionY(), aSpawnLocations[1].GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_DESPAWN);
                            events.ScheduleEvent(EVENT_SUMMON_SKARDYN, 60000);
                            return;
                    }
                }
                DoMeleeAttackIfReady();
            }
        };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_umbrissAI(creature);
    }
};

class npc_malveillant: public CreatureScript
{
public:
 npc_malveillant() : CreatureScript("npc_malveillant") { }

 struct npc_malveillantAI : public ScriptedAI
    {
        npc_malveillantAI(Creature *c) : ScriptedAI(c) {}

        EventMap events;

        void EnterCombat(Unit * /*who*/)
        {
            EnterPhaseGround();
        }

        void EnterPhaseGround()
        {
            events.ScheduleEvent(EVENT_PUNCTURE, 2000);
            events.ScheduleEvent(EVENT_MALICE, 6000);
            events.ScheduleEvent(EVENT_MOGUD, 12000);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                    case EVENT_PUNCTURE:
                        DoCastVictim(SPELL_PUNCTURE);
                        events.ScheduleEvent(EVENT_PUNCTURE, 2000);
                        return;
                    case EVENT_MALICE:
                        DoCastVictim(SPELL_MALICE);
                        events.ScheduleEvent(EVENT_MALICE, 6000);
                        return;
                    case EVENT_MOGUD:
                        DoCastVictim(SPELL_MODGUD);
                        events.ScheduleEvent(EVENT_MOGUD, 12000);
                        return;
                }
            }

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_malveillantAI (pCreature);
    }

};

/****************
** Trogg Dweller
****************/
class npc_dweller: public CreatureScript
{
public:
 npc_dweller() : CreatureScript("npc_dweller") { }

 struct npc_dwellerAI : public ScriptedAI
    {
        npc_dwellerAI(Creature *c) : ScriptedAI(c) {}

        EventMap events;

        void EnterCombat(Unit * /*who*/)
        {
            EnterPhaseGround();
        }

        void EnterPhaseGround()
        {
            events.ScheduleEvent(EVENT_PUNCTURE, 5000);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                    case EVENT_PUNCTURE:
                        DoCastVictim(SPELL_PUNCTURE);
                        events.ScheduleEvent(EVENT_PUNCTURE, 5000);
                        return;
                }
            }

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_dwellerAI (pCreature);
    }

};

class spell_modgud_malice : public SpellScriptLoader
{
    public:
        spell_modgud_malice() :  SpellScriptLoader("spell_modgud_malice") { }

        class spell_modgud_malice_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_modgud_malice_AuraScript);

            bool Validate(SpellInfo const* /*spell*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MALADY))
                    return false;
                return true;
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if(GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_DEATH)
                    GetCaster()->CastSpell(me, SPELL_MALADY, true);
            }

            void Register()
            {
                AfterEffectRemove += AuraEffectRemoveFn(spell_modgud_malice_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_MOD_SCALE, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_modgud_malice_AuraScript();
        }
};

class ModgudMaladyTargetSelector
{
public:
    explicit ModgudMaladyTargetSelector(Unit* _caster) : caster(_caster) { }

    bool operator() (Unit* unit)
    {
        return !unit->IsWithinDist(caster, 8.0f);
    }

private:
    Unit* caster;
};

class spell_modgud_malady : public SpellScriptLoader
{
    public:
        spell_modgud_malady() : SpellScriptLoader("spell_modgud_malady") { }

        class spell_modgud_malady_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_modgud_malady_SpellScript);

            void FilterTargets(std::list<Unit*>& unitList)
            {
                unitList.remove_if(ModgudMaladyTargetSelector(GetCaster()));
            }

            void FilterTargetsExtended(std::list<Unit*>& unitList)
            {
                unitList.remove_if(ModgudMaladyTargetSelector(GetCaster()));

                if(InstanceScript* instance = GetCaster()->GetInstanceScript())
                {
                    for (std::list<Unit*>::iterator itr = unitList.begin(); itr != unitList.end();)
                    {
                        if((*itr)->GetTypeId() == TYPEID_UNIT)
                        {
                            if(Creature* target = (*itr)->ToCreature())
                            {
                                if(Creature* GeneralUmbriss = Unit::GetCreature(GetCaster(), instance->GetData64(DATA_GENERAL_UMBRISS)))
                                {
                                    if (target->GetCreatureTemplate()->Entry == GeneralUmbriss->GetCreatureTemplate()->Entry)
                                    {
                                        GetCaster()->CastSpell(GeneralUmbriss, SPELL_MALICE_EFFECT, true);
                                        unitList.erase(itr);
                                    }
                                }

                                if (target->GetCreatureTemplate()->Entry == NPC_TROGG_DWE)
                                {
                                    target->UpdateEntry(NPC_TROGG_MAL);
                                    unitList.erase(itr);
                                }
                            }
                        }
                    }
                }
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_modgud_malady_SpellScript::FilterTargetsExtended, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                OnUnitTargetSelect += SpellUnitTargetFn(spell_modgud_malady_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENTRY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_modgud_malady_SpellScript();
        }
};

void AddSC_boss_general_umbriss()
{
    new boss_umbriss();
    new npc_dweller();
    new npc_malveillant();
    new spell_modgud_malice();
    new spell_modgud_malady();
}