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
#include "throne_of_the_tides.h"

#define SPELL_DARK_FISSURE          DUNGEON_MODE(76047,96311)
#define SPELL_DARK_FISSURE_AURA     DUNGEON_MODE(76066,91371)
#define SPELL_SQUEEZE               DUNGEON_MODE(76026,95463)

enum Spells
{
    SPELL_ENRAGE                = 76100,
    SPELL_CURSE_OF_FATIGUE      = 76094,
    SPELL_PULL_TARGET           = 67357,
    SPELL_DARK_FISSURE_GROW     = 91375,
};

enum Yells
{
    SAY_AGGRO                   = -1643007,
    SAY_AGGRO_WHISP             = -1643008,
    SAY_DEATH                   = -1643009,
    SAY_DEATH_WHISP             = -1643010,
};

class boss_commander_ulthok : public CreatureScript
{
public:
    boss_commander_ulthok() : CreatureScript("boss_commander_ulthok") { }

    struct boss_commander_ulthokAI : public ScriptedAI
    {
        boss_commander_ulthokAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
        }

        uint32 DarkFissureTimer;
        uint32 EnrageTimer;
        uint32 SqueezeTimer;
        uint32 CurseTimer;
        uint32 TargetTimer;
        Unit* SqueezeTarget;

        InstanceScript *instance;
        Vehicle* vehicle;

        void Reset()
        {
            DespawnDarkFissures();

            DarkFissureTimer = 22500;
            EnrageTimer = urand(12000,18000);
            SqueezeTimer = 25500;
            CurseTimer = 32000;
            TargetTimer = 20000;

            me->GetMotionMaster()->MoveTargetedHome();

            if (instance)
                instance->SetData(DATA_COMMANDER_ULTHOK, NOT_STARTED);
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->RemoveAllAuras();

            DoScriptText(SAY_AGGRO, me);
            DoScriptText(SAY_AGGRO_WHISP, me);

            if (instance)
                instance->SetData(DATA_COMMANDER_ULTHOK, IN_PROGRESS);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (TargetTimer <= diff)
            {
                SqueezeTarget = SelectTarget(SELECT_TARGET_RANDOM, 0);
                TargetTimer = 22500;
            } else TargetTimer -= diff;

            if (DarkFissureTimer <= diff)
            {
                DoCastVictim(SPELL_DARK_FISSURE);
                DarkFissureTimer = 22500;
            } else DarkFissureTimer -= diff;

            if (EnrageTimer <= diff)
            {
                DoCast(me, SPELL_ENRAGE);
                EnrageTimer = urand(12000,15000);
            } else EnrageTimer -= diff;

            if (SqueezeTimer <= diff)
            {
                DoCast(SqueezeTarget, SPELL_PULL_TARGET, true);
                DoCast(SqueezeTarget, SPELL_SQUEEZE, true);

                SqueezeTimer = 22500;
            } else SqueezeTimer -= diff;

            if (CurseTimer <= diff)
            {
                DoCast(SqueezeTarget, SPELL_CURSE_OF_FATIGUE, true);
                CurseTimer = 22500;
            } else CurseTimer -= diff;

            DoMeleeAttackIfReady();
        }

        void JustDied(Unit* /*pKiller*/)
        {
            DespawnDarkFissures();

            DoScriptText(SAY_DEATH, me);
            DoScriptText(SAY_DEATH_WHISP, me);

            if (instance)
            {
                instance->SetData(DATA_COMMANDER_ULTHOK, DONE);
                Map* map = me->GetMap();

                if(IsHeroic())
                {
                    Map::PlayerList const& PlayerList = map->GetPlayers();
                    for (Map::PlayerList::const_iterator itr = PlayerList.begin(); itr != PlayerList.end(); ++itr)
						if (Player* player = itr->getSource())
							player->ModifyCurrency(CURRENCY_TYPE_JUSTICE_POINTS, 7000);
                }
            }
        }

    private:
        void DespawnDarkFissures()
        {
            std::list<Creature*> creatures;
            GetCreatureListWithEntryInGrid(creatures, me, NPC_DARK_FISSURE, 150.0f);

            if (creatures.empty())
                return;

            for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
                (*iter)->DespawnOrUnsummon();
        }
    };

    CreatureAI* GetAI(Creature *pCreature) const
    {
        return new boss_commander_ulthokAI (pCreature);
    }
};

void AddSC_boss_ulthok()
{
    new boss_commander_ulthok();
}