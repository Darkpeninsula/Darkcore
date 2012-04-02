/*
 * Copyright (C) 2011-2012 DarkCore <http://www.darkpeninsula.eu/>
 * Copyright (C) 2011-2012 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
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
#include "throne_of_the_tides.h"

#define GOSSIP_READY "We are ready!"

#define SAY_1 "As I purify these waters, the servants of filth will surely be stirred. Beware!"
#define SAY_2 "Patience guests. The waters are nearly cleansed."
#define SAY_3 "The beast has returned! It must not pollute my waters!"
#define SAY_DEATH "Your kind... cannot be... trusted..."
#define SAY_CLEANSED "My waters are cleansed! Drink in their power!"

Position const SpawnPositions[] =
{
    {-155.955f, 952.67f, 230.456f, 1.1f},
    {-105.204f, 979.93f, 229.862f, 2.9f},
    {-172.205f, 1012.91f, 231.33f, 5.5f},
    {-137.0736f, 973.488f, 230.355f, 2.0832f},
    {-143.2496f, 1005.569f, 229.8465f, 4.4472f},
    {-163.4171f, 978.427f, 229.31f, 0.4833f},
};

Position const OzumatPosition[2] =
{
    {-154.037f, 960.586f, 314.759f, 1.2f},
    {-187.9f, 939.332f, 254.46f, 3.7f},
};

enum Spells
{
    SPELL_GROUND_EFFECT = 83607,
    SPELL_ENTANGLING_GRASP = 83463,
    SPELL_NEPTULON_BEAM_VISUAL = 79511,
    SPELL_TIDAL_SURGE = 76133,
    SPELL_BLIGHT_OF_OZUMAT_VISUAL = 83672,
    SPELL_BLIGHT_OF_OZUMAT_VISUAL_GROUND_EFFECT = 83525,
    SPELL_SUMMON_BLIGHT_OF_OZUMAT = 83524,

    // Voidzone Damage
    SPELL_BLIGHT_OF_OZUMAT_DAMAGE_ZONE = 83608, // HC: 91494

    // Phase 3 AOE
    SPELL_BLIGHT_OF_OZUMAT_DAMAGE_AOE = 83561, // HC: 91495
};

class mob_neptulon : public CreatureScript
{
public:
    mob_neptulon() : CreatureScript("mob_neptulon") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_neptulonAI (creature);
    }

    struct mob_neptulonAI : public ScriptedAI
    {
        mob_neptulonAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
        }

        InstanceScript* instance;

        uint8 waveCount;
        uint32 generalTimer;
        uint32 playerAliveChecker;
        uint8 nextStep;

        void Reset()
        {
            if (instance)
                instance->SetData(DATA_OZUMAT, NOT_STARTED);

            if (instance && instance->GetData(DATA_LADY_NAZJAR) == DONE)
                if (Creature* ozumat = ObjectAccessor::GetCreature(*me, instance->GetData64(BOSS_OZUMAT)))
                    ozumat->AI()->DoAction(ACTION_OZUMAT_PREPARE_EVENT);

            me->RemoveAllAuras();
            me->CastStop();

            waveCount = 0;
            nextStep = 3;
            generalTimer = 10000;
            playerAliveChecker = 1500;
            me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            DespawnCreatures(NPC_BLIGHT_OF_OZUMAT);
            DespawnCreatures(NPC_OZUMAT_VISUAL_TRIGGER);
        }

        void UpdateAI(const uint32 diff)
        {
            if(waveCount == 0)
                return;

            if (playerAliveChecker <= diff)
            {
                if(!isPlayerAlive())
                    Reset();

                playerAliveChecker = 1500;
            } else playerAliveChecker -= diff;

            if (generalTimer <= diff)
            {
                HandleWave();

                generalTimer = 10000;
            } else generalTimer -= diff;
        }

        void SummonedCreatureDies(Creature* summon, Unit* /*killer*/)
        {
            if(summon->GetEntry() == NPC_FACELESS_SAPPER && nextStep > 0)
                nextStep--;

            if(nextStep == 0)
            {
                waveCount=8;
                HandleWave();
            }
        }

        void HandleWave()
        {
            if(waveCount < 6)
            { // Phase 1

                waveCount++;

                uint32 summonEntry;
                uint8 p = urand(0,2);

                if(waveCount == 1)
                {
                    me->MonsterSay(SAY_1,0,0);
                    DoCastAOE(SPELL_NEPTULON_BEAM_VISUAL,true);
                    DoZoneInCombat(me);

                    if (Creature* ozumat = ObjectAccessor::GetCreature(*me,instance->GetData64(BOSS_OZUMAT)))
                        ozumat->AI()->DoAction(ACTION_OZUMAT_PREPARE_EVENT);

                }else if (waveCount == 6)
                {
                    for(uint8 i = 3; i <= 5; i++)
                        if(Creature* summon = me->SummonCreature(NPC_FACELESS_SAPPER, SpawnPositions[i],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                        {
                            summon->AI()->DoZoneInCombat(summon);
                            summon->SetReactState(REACT_PASSIVE);
                            summon->SetFacingToObject(me);
                            summon->CastSpell(me, SPELL_ENTANGLING_GRASP, true);
                        }

                        if (Creature* ozumat = ObjectAccessor::GetCreature(*me, instance->GetData64(BOSS_OZUMAT)))
                            ozumat->AI()->DoAction(ACTION_OZUMAT_START_EVENT);

                        Position myPos;
                        me->GetPosition(&myPos);
                        me->SummonCreature(NPC_OZUMAT_VISUAL_TRIGGER, myPos, TEMPSUMMON_MANUAL_DESPAWN);

                        waveCount=7;
                        return;
                }

                switch(urand(0,2))
                {

                case 0:
                    summonEntry = NPC_DEEP_MURLOC_INVADER;
                    break;
                case 1:
                    summonEntry = NPC_UNYIELDING_BEHEMOTH;
                    break;
                case 2:
                    summonEntry = NPC_VICIOUS_MINDLASHER;
                    break;
                }

                for(uint8 i = 0; i <= (summonEntry == NPC_DEEP_MURLOC_INVADER ? 2 : 0); i++)
                    if(Creature* summon = me->SummonCreature(summonEntry, SpawnPositions[p],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                    {
                        summon->AI()->DoZoneInCombat(summon);
                    }

            }else if(waveCount == 7)
            { // Phase 2

                if(Creature* summon = me->SummonCreature(NPC_BLIGHT_BEAST, SpawnPositions[urand(0,2)],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000))
                    summon->AI()->DoZoneInCombat(summon);

            }else if(waveCount == 8)
            { // Phase 3

                if (Creature* ozumat = ObjectAccessor::GetCreature(*me, instance->GetData64(BOSS_OZUMAT)))
                    ozumat->AI()->DoAction(ACTION_OZUMAT_FINAL_PHASE);

                DespawnCreatures(NPC_BLIGHT_OF_OZUMAT);
                instance->DoCastSpellOnPlayers(SPELL_TIDAL_SURGE);
                waveCount= 9;

            }else if(waveCount == 9)
            { // End encounter and Spawn Chest
                DespawnCreatures(NPC_OZUMAT_VISUAL_TRIGGER);
            }
        }

        bool isPlayerAlive()
        {
            Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();

            if (!PlayerList.isEmpty())
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                    if(i->getSource()->isAlive() && !i->getSource()->isGameMaster())
                        return true;

            return false;
        };

        void DespawnCreatures(uint32 entry)
        {
            std::list<Creature*> creatures;
            GetCreatureListWithEntryInGrid(creatures, me, entry, 100.0f);

            if (creatures.empty())
                return;

            for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
                (*iter)->DespawnOrUnsummon();
        }
    };

    bool OnGossipHello(Player* pPlayer, Creature* creature)
    {

        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_READY, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->SEND_GOSSIP_MENU(1,creature->GetGUID());

        return true;
    }

    bool OnGossipSelect(Player* pPlayer, Creature* creature, uint32 uiSender, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();

        pPlayer->CLOSE_GOSSIP_MENU();

        creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

        if (InstanceScript* instance = creature->GetInstanceScript())
            instance->SetData(DATA_OZUMAT, IN_PROGRESS);

        CAST_AI(mob_neptulon::mob_neptulonAI, creature->AI())->HandleWave();

        return true;
    }
};

class boss_ozumat : public CreatureScript
{
public:
    boss_ozumat() : CreatureScript("boss_ozumat") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_ozumatAI (creature);
    }

    struct boss_ozumatAI : public ScriptedAI
    {
        boss_ozumatAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
            creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
            creature->SetReactState(REACT_PASSIVE);
        }

        InstanceScript* instance;
        uint32 abilityTimer;
        uint8 phase;

        void Reset()
        {
            phase = 0;
        };

        void UpdateAI(const uint32 diff)
        {
            if (phase == 0)
                return;

            if(me->GetHealthPct() < 5)
                EndEncounter();

            if (abilityTimer <= diff)
            {
                if(phase == 1)
                {
                    if(Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 200, true))
                        target->CastSpell(target, SPELL_SUMMON_BLIGHT_OF_OZUMAT, true);

                    abilityTimer = 15000;
                } else if (phase == 2)
                {
                    Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
                    if (!PlayerList.isEmpty())
                        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                            me->AddAura(SPELL_BLIGHT_OF_OZUMAT_DAMAGE_AOE,  i->getSource());

                    if (Creature* neptulon = ObjectAccessor::GetCreature(*me, instance->GetData64(NPC_NEPTULON)))
                        me->SetFacingToObject(neptulon);

                    abilityTimer = 6000;
                }

            } else abilityTimer -= diff;
        }

        void DoAction(const int32 action)
        {
            switch(action)
            {
            case ACTION_OZUMAT_PREPARE_EVENT:
                me->RemoveAllAuras();
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
                me->SetReactState(REACT_PASSIVE);
                me->GetMotionMaster()->MovePoint(0, OzumatPosition[0]);
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_CUSTOM_SPELL_01);
                phase = 0;
                break;

            case ACTION_OZUMAT_START_EVENT:
                DoCastAOE(SPELL_BLIGHT_OF_OZUMAT_VISUAL);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
                DoZoneInCombat(me);
                abilityTimer = 3000;
                phase = 1;
                break;

            case ACTION_OZUMAT_FINAL_PHASE:
                me->RemoveAllAuras();
                me->GetMotionMaster()->MovePoint(0, OzumatPosition[1]);
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
                phase = 2;
                break;
            }
        }

        void JustDied(Unit* killer)
        {
            EndEncounter();
        };

        void EndEncounter()
        {
            me->SummonGameObject(RAID_MODE(GO_OZUMAT_CHEST_NORMAL, GO_OZUMAT_CHEST_NORMAL), -161.932f, 984.396f, 229.421f, 0.006f,0,0,0,0,0);

            Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
            if (!PlayerList.isEmpty())
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                    i->getSource()->RemoveAura(SPELL_TIDAL_SURGE);

            if (Creature* neptulon = ObjectAccessor::GetCreature(*me, instance->GetData64(NPC_NEPTULON)))
                neptulon->DisappearAndDie();

            if (instance)
                instance->SetData(DATA_OZUMAT, DONE);

            me->DisappearAndDie();
        }
    };
};

void AddSC_boss_ozumat()
{
    new mob_neptulon();
    new boss_ozumat();
}