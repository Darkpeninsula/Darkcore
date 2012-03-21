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

enum Spells
{
    SPELL_FUNGAL_SPORES = 76001,
    SPELL_SHOCK_BLAST = 76008,
    SPELL_SUMMON_GEYSER = 75722,
    SPELL_GEYSER_ERRUPT = 91469,
    SPELL_WATERSPOUT = 75683,
    SPELL_WATERSPOUT_SUMMON = 90495,
    SPELL_WATERSPOUT_VISUAL = 90440,
    SPELL_WATERSPOUT_DOT = 90479,
    SPELL_VISUAL_INFIGHT_AURA = 91349,
};

enum Yells
{
    SAY_AGGRO = -1643001,
    SAY_66_PRECENT = -1643002,
    SAY_33_PRECENT = -1643003,
    SAY_DEATH = -1643004,
    SAY_KILL_1 = -1643005,
    SAY_KILL_2 = -1643006,
};

enum Phases
{
    PHASE_NORMAL_ONE = 0,
    PHASE_CLEAR_DREAMES_ONE = 1,
    PHASE_NORMAL_TWO = 2,
    PHASE_CLEAR_DREAMES_TWO = 3,
    PHASE_NORMAL_THREE = 4,
};

enum Events
{
    EVENT_GEYSER = 1,
    EVENT_GEYSER_ERRUPT,
    EVENT_FUNGAL_SPORES,
    EVENT_SHOCK_BLAST,
};

enum Points
{
    POINT_WATERSPOUT_FINISHED,
};

Position const SummonPos[3] =
{{174.41f, 802.323f, 808.368f, 0.014f},
{200.517f, 787.687f, 808.368f, 2.056f},
{200.558f, 817.046f, 808.368f, 4.141f}};

class boss_lady_nazjar : public CreatureScript
{
public:
    boss_lady_nazjar() : CreatureScript("boss_lady_nazjar") { }

    struct boss_lady_nazjarAI : public ScriptedAI
    {
        boss_lady_nazjarAI(Creature* creature) : ScriptedAI(creature)
        {
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, false);

            instance = creature->GetInstanceScript();
        }

        InstanceScript *instance;

        uint8 Phase;
        bool Phased;
        uint8 SpawnCount;

        EventMap events;

        void Reset()
        {
            DespawnMinions();

            Phase = PHASE_NORMAL_ONE;
            Phased = false;

            me->RemoveAllAuras();

            HandleCombatVisual(false);

            if (instance)
                instance->SetData(DATA_LADY_NAZJAR, NOT_STARTED);
        }

        void SummonedCreatureDespawn(Creature* summon)
        {
            summon->setFaction(me->getFaction());

            switch(summon->GetEntry())
            {
            case NPC_SUMMONED_WITCH:
            case NPC_SUMMONED_GUARD:
                SpawnCount--;
                break;

            }
        }

        void KilledUnit(Unit* /*victim*/)
        {
            DoScriptText(RAND(SAY_KILL_1,SAY_KILL_2), me);
        }

        void JustSummoned(Creature* summon)
        {
            summon->setFaction(me->getFaction());

            switch(summon->GetEntry())
            {
            case NPC_SUMMONED_WITCH:
            case NPC_SUMMONED_GUARD:
                summon->AI()->DoZoneInCombat(summon);
                break;
            case NPC_SUMMONED_WATERSPOUT:
            case NPC_SUMMONED_WATERSPOUT_HC:

                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                {
                    Position pos;
                    target->GetPosition(&pos);
                    summon->GetMotionMaster()->MovePoint(POINT_WATERSPOUT_FINISHED,pos);
                }
                break;
            case NPC_SUMMONED_GEYSER:
                summon->SetReactState(REACT_PASSIVE);
                break;

            }
        }

        void EnterCombat(Unit* /*who*/)
        {
            SpawnCount = 3;

            HandleCombatVisual(true);
            DoScriptText(SAY_AGGRO, me);

            if (instance)
                instance->SetData(DATA_LADY_NAZJAR, IN_PROGRESS);

            events.ScheduleEvent(EVENT_GEYSER, 11000);
            events.ScheduleEvent(EVENT_FUNGAL_SPORES, urand(3000,10000));
            events.ScheduleEvent(EVENT_SHOCK_BLAST, urand(6000,12000));
        }

        void JustDied(Unit* /*pKiller*/)
        {
            DoScriptText(SAY_DEATH, me);

            HandleCombatVisual(false);
            DespawnMinions();
            
            if (instance)
                instance->SetData(DATA_LADY_NAZJAR, DONE);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (SpawnCount == 0)
            {
                LeaveClearDreamesPhase();
            }

            if ((me->HealthBelowPct(67) && Phase == PHASE_NORMAL_ONE) || (me->HealthBelowPct(34) && Phase == PHASE_NORMAL_TWO))
            {
                EnterClearDreamesPhase();
            }

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            if(!Phased)
            { // If Nazjar is in a normal phase

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                    case EVENT_GEYSER:
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                            DoCast(target, SPELL_SUMMON_GEYSER);

                        events.ScheduleEvent(EVENT_GEYSER_ERRUPT, 3500);
                        events.ScheduleEvent(EVENT_GEYSER, urand(14000,17000));
                        break;
                    case EVENT_GEYSER_ERRUPT:
                        if (Creature* geyser = me->FindNearestCreature(NPC_SUMMONED_GEYSER, 150.0f, true))
                            geyser->CastSpell(geyser, SPELL_GEYSER_ERRUPT, true);

                        break;
                    case EVENT_FUNGAL_SPORES:
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                            DoCast(target,SPELL_FUNGAL_SPORES);
                        events.ScheduleEvent(EVENT_FUNGAL_SPORES, urand(12000,14000));
                        break;
                    case EVENT_SHOCK_BLAST:
                        DoCastVictim(SPELL_SHOCK_BLAST);
                        events.ScheduleEvent(EVENT_SHOCK_BLAST, urand(15000,18000));
                        break;
                    }
                }
            }

            DoMeleeAttackIfReady();
        }

    private:
        inline void EnterClearDreamesPhase()
        {
            DoScriptText(SAY_66_PRECENT, me);

            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, true);
            Phase++;
            Phased = true;

            SetCombatMovement(false);

            DoTeleportTo(192.056f, 802.527f, 807.638f, me->GetOrientation());

            DoCast(me, SPELL_WATERSPOUT, true);
            me->AddAura(SPELL_WATERSPOUT_SUMMON, me);

            for(uint8 i = 0; i<=2;i++)
                me->SummonCreature((i!=0) ? NPC_SUMMONED_WITCH : NPC_SUMMONED_GUARD, SummonPos[i], TEMPSUMMON_CORPSE_DESPAWN, 1000);

        }

        inline void LeaveClearDreamesPhase()
        {    
            me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, false);
            Phase++;
            Phased = false;

            SetCombatMovement(true);
            SpawnCount = 3;

            me->CastStop(0);

            me->RemoveAurasDueToSpell(SPELL_WATERSPOUT);
            me->RemoveAurasDueToSpell(SPELL_WATERSPOUT_SUMMON);
        }

        inline void DespawnMinions()
        {
            DespawnCreatures(NPC_SUMMONED_WITCH);
            DespawnCreatures(NPC_SUMMONED_GUARD);
            DespawnCreatures(NPC_SUMMONED_WATERSPOUT);
            DespawnCreatures(NPC_SUMMONED_GEYSER);
        }

        void DespawnCreatures(uint32 entry)
        {
            std::list<Creature*> creatures;
            GetCreatureListWithEntryInGrid(creatures, me, entry, 100.0f);

            if (creatures.empty())
                return;

            for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
                (*iter)->DespawnOrUnsummon();
        }

        void HandleCombatVisual(bool activate)
        {
            std::list<Creature*> creatures;
            GetCreatureListWithEntryInGrid(creatures, me, NPC_NAZJAR_COMBAT_TRIGGER, 200.0f);

            if (creatures.empty())
                return;

            for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
                if(activate)
                    me->AddAura(SPELL_VISUAL_INFIGHT_AURA, (*iter));
                else
                    (*iter)->RemoveAllAuras();
        }
    };

    CreatureAI* GetAI(Creature *creature) const
    {
        return new boss_lady_nazjarAI (creature);
    }
};

class mob_waterspout : public CreatureScript
{
public:
    mob_waterspout() : CreatureScript("mob_waterspout") { }

    struct mob_waterspoutAI : public ScriptedAI
    {
        mob_waterspoutAI(Creature* creature) : ScriptedAI(creature)
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
            me->SetReactState(REACT_PASSIVE);

            DoCast(me, SPELL_WATERSPOUT_VISUAL, true);
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type == POINT_MOTION_TYPE && id == POINT_WATERSPOUT_FINISHED)
                me->DespawnOrUnsummon();
        }

        void UpdateAI(const uint32 diff)
        {
            if(Unit* target = GetPlayerAtMinimumRange(0))
                if (me->GetDistance(target) < 1.5f)
                    DoCast(target,SPELL_WATERSPOUT_DOT, true);
        }
    };

    CreatureAI* GetAI(Creature *creature) const
    {
        return new mob_waterspoutAI (creature);
    }
};

void AddSC_boss_nazjar()
{
    new boss_lady_nazjar();
    new mob_waterspout();
}