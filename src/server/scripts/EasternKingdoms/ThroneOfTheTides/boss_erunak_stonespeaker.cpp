/*
 * Copyright (C) 2011-2012 DarkCore <http://www.darkpeninsula.eu/>
 * Copyright (C) 2011-2012 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/> *
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

Creature* pErunak;
Creature* pMindbender;

enum Yells
{
    SAY_PHASE_1_END_MINDBENDER = -1643011,
    SAY_PHASE_1_END_ERUNAK = -1643012,
    SAY_MIND_CONTROL_1 = -1643013,
    SAY_MIND_CONTROL_2 = -1643014,
    SAY_MIND_CONTROL_3 = -1643015,
    SAY_MIND_FOG = -1643016,
    SAY_DEATH = -1643017,
    SAY_WIN_ERUNAK = -1643018,
};

enum Events
{
    // Erunak
    EVENT_EARTH_SHARDS = 1,
    EVENT_EMBERSTRIKE,
    EVENT_LAVA_BOLT,
    EVENT_MAGMA_SPLASH,

    // Ghursha
    EVENT_ENSLAVE,
    EVENT_ABSORB_MAGIC,
    EVENT_MIND_FOG,
    EVENT_UNRELENTING_AGONY,
};

enum Spells
{
    // Erunak Stonespeaker
    SPELL_EARTH_SHARDS = 84931,
    SPELL_EARTH_SHARD_AURA = 84935,
    SPELL_EARTH_SHARD_SUMMON = 84934,

    SPELL_EMBERSTRIKE = 76165,
    SPELL_LAVA_BOLT = 76171,
    SPELL_MAGMA_SPLASH = 76170,

    // Mindbender Ghur'sha
    SPELL_ENSLAVE = 76207,
    SPELL_ENSLAVE_BUFF = 76213,
    SPELL_ABSORB_MAGIC = 76307,
    SPELL_MIND_FOG_SUMMON = 76234,
    SPELL_MIND_FOG_AURA = 76230,
    SPELL_MIND_FOG_VISUAL = 76231,
    SPELL_UNRELENTING_AGONY = 76339,
};
class boss_erunak_stonespeaker : public CreatureScript
{
public:
    boss_erunak_stonespeaker() : CreatureScript("boss_erunak_stonespeaker") { }


    CreatureAI* GetAI(Creature *creature) const
    {
        return new boss_erunak_stonespeakerAI(creature);
    }

    struct boss_erunak_stonespeakerAI : public ScriptedAI
    {
        boss_erunak_stonespeakerAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
            pErunak = me;
        }

        InstanceScript* instance;
        EventMap events;
        bool isInGhurshaPhase;

        void Reset()
        {
            events.Reset();
            isInGhurshaPhase = false;

            if (instance)
                instance->SetData(DATA_MINDEBENDER_GHURSHA, NOT_STARTED);
        }

        void EnterCombat(Unit* /*who*/)
        {

            events.ScheduleEvent(EVENT_EARTH_SHARDS, 20000);
            events.ScheduleEvent(EVENT_EMBERSTRIKE, 11000);
            events.ScheduleEvent(EVENT_LAVA_BOLT, 6500);
            events.ScheduleEvent(EVENT_MAGMA_SPLASH, 17000);

            if (instance)
                instance->SetData(DATA_MINDEBENDER_GHURSHA, IN_PROGRESS);
        }

        void SummonedCreatureDespawn(Creature* summon)
        {
            if(instance && instance->GetData(DATA_MINDEBENDER_GHURSHA) != DONE)
            {
                me->setFaction(14);
                me->GetMotionMaster()->MoveTargetedHome();
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if(me->GetHealthPct() < 50 && !isInGhurshaPhase)
            {
                isInGhurshaPhase = true;
                me->setFaction(35);
                Position pos;
                me->GetPosition(&pos);

                me->SummonCreature(BOSS_MINDBENDER_GHURSHA,pos,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 2000);
            }

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {

                case EVENT_EARTH_SHARDS:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                        DoCast(target, SPELL_EARTH_SHARDS);

                    DoCast(me, SPELL_EARTH_SHARD_SUMMON);
                    events.ScheduleEvent(EVENT_EARTH_SHARDS, 20000);
                    break;
                case EVENT_EMBERSTRIKE:
                    DoCastVictim(SPELL_EMBERSTRIKE);
                    events.ScheduleEvent(EVENT_EMBERSTRIKE, 11000);
                    break;
                case EVENT_LAVA_BOLT:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                        DoCast(target, SPELL_LAVA_BOLT);

                    events.ScheduleEvent(EVENT_LAVA_BOLT, 6500);
                    break;
                case EVENT_MAGMA_SPLASH:
                    DoCastAOE(SPELL_MAGMA_SPLASH);
                    events.ScheduleEvent(EVENT_MAGMA_SPLASH, 17000);
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };
};

class boss_mindbender_ghursha : public CreatureScript
{
public:
    boss_mindbender_ghursha() : CreatureScript("boss_mindbender_ghursha") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_mindbender_ghurshaAI (creature);
    }

    struct boss_mindbender_ghurshaAI : public ScriptedAI
    {
        boss_mindbender_ghurshaAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
        }

        InstanceScript* instance;
        EventMap events;

        void Reset()
        {
            events.Reset();
        }

        void EnterCombat(Unit* /*who*/)
        {
            events.ScheduleEvent(EVENT_ABSORB_MAGIC, 20000);
            events.ScheduleEvent(EVENT_MIND_FOG, urand(6000,12000));
            events.ScheduleEvent(EVENT_UNRELENTING_AGONY, 10000);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim() || me->HasUnitState(UNIT_STATE_CASTING))
                return;

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {

                case EVENT_ENSLAVE:

                    events.ScheduleEvent(EVENT_ENSLAVE, 31000);
                    break;
                case EVENT_ABSORB_MAGIC:
                    DoCast(me, SPELL_ABSORB_MAGIC);
                    events.ScheduleEvent(EVENT_ABSORB_MAGIC, 20000);
                    break;
                case EVENT_MIND_FOG:
                    DoCast(me, SPELL_MIND_FOG_SUMMON);
                    events.ScheduleEvent(EVENT_MIND_FOG, urand(6000,12000));
                    break;
                case EVENT_UNRELENTING_AGONY:
                    DoCastAOE(SPELL_UNRELENTING_AGONY);
                    events.ScheduleEvent(EVENT_UNRELENTING_AGONY, 10000);
                    break;

                default:
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }

        void JustDied(Unit* /*killer*/)
        {
            instance->SetData(DATA_MINDEBENDER_GHURSHA, DONE);
        }
    };
};

void DespawnCreatures(uint32 entry, Unit* me)
{
    std::list<Creature*> creatures;
    GetCreatureListWithEntryInGrid(creatures, me, entry, 100.0f);

    if (creatures.empty())
        return;

    for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
        (*iter)->DespawnOrUnsummon();
}

void AddSC_boss_erunak_stonespeaker()
{
    new boss_erunak_stonespeaker();
    new boss_mindbender_ghursha();
}