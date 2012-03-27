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

enum Factions
{
    FACTION_FRIENDLY = 35
};

class instance_throne_of_the_tides : public InstanceMapScript
{
public:
    instance_throne_of_the_tides() : InstanceMapScript("instance_throne_of_the_tides", 643) { }

    InstanceScript* GetInstanceScript(InstanceMap* map) const
    {
        return new instance_throne_of_the_tides_InstanceMapScript(map);
    }

    struct instance_throne_of_the_tides_InstanceMapScript : public InstanceScript
    {
        instance_throne_of_the_tides_InstanceMapScript(Map* map) : InstanceScript(map)
        {
            SetBossNumber(MAX_ENCOUNTER);
        }

        uint64 uiLadyNazjar;
        uint64 uiCommanderUlthok;
        uint64 uiErunakStonespeaker;
        uint64 uiMindbenderGhursha;
        uint64 uiOzumat;
        uint64 uiNeptulon;

        uint64 uiCorales;
        uint64 uiLadyNazjarDoor;
        uint64 uiCommanderUlthokDoor;
        uint64 uiMindebenderGhurshaDoor;
        uint64 uiOzumatDoor;
        uint64 uiControlSystem;

        uint64 uiTentacleRight;
        uint64 uiTentacleLeft;

        uint32 encounter[MAX_ENCOUNTER];

        uint8 isCinematicInProgress;
        uint32 cinematicTimer;

        std::string str_data;

        void Initialize()
        {
            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                encounter[i] = NOT_STARTED;

            uiLadyNazjar = 0;
            uiCommanderUlthok = 0;
            uiErunakStonespeaker = 0;
            uiMindbenderGhursha = 0;
            uiOzumat = 0;
            uiNeptulon = 0;

            uiCorales = 0,
                uiLadyNazjarDoor = 0;
            uiCommanderUlthokDoor = 0;
            uiMindebenderGhurshaDoor = 0;
            uiOzumatDoor = 0;
            uiControlSystem = 0;

            uiTentacleRight = 0;
            uiTentacleLeft = 0;

            isCinematicInProgress = 0;
            cinematicTimer = 0;
        }

        bool IsEncounterInProgress() const
        {
            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                if (encounter[i] == IN_PROGRESS) return true;

            return false;
        }

        void OnCreatureCreate(Creature* creature, bool add)
        {
            Map::PlayerList const &players = instance->GetPlayers();
            uint32 TeamInInstance = 0;

            if (!players.isEmpty())
            {
                if (Player* player = players.begin()->getSource())
                    TeamInInstance = player->GetTeam();
            }
            switch(creature->GetEntry())
            {
            case BOSS_LADY_NAZJAR:
                uiLadyNazjar = creature->GetGUID();
                break;
            case BOSS_COMMANDER_ULTHOK:
                if(encounter[0] == DONE)
                    creature->SetPhaseMask(PHASEMASK_NORMAL, true);
                uiCommanderUlthok = creature->GetGUID();
                break;
            case NPC_ERUNAK_STONESPEAKER:
                uiErunakStonespeaker = creature->GetGUID();
                break;
            case BOSS_MINDBENDER_GHURSHA:
                uiMindbenderGhursha = creature->GetGUID();
                break;
            case BOSS_OZUMAT:
                uiOzumat = creature->GetGUID();
                break;
            case NPC_NEPTULON:
                uiNeptulon = creature->GetGUID();
                break;
            case 50272:
                {
                    if (ServerAllowsTwoSideGroups())
                        creature->setFaction(FACTION_FRIENDLY);
                    if (TeamInInstance == ALLIANCE)
                        creature->UpdateEntry(50270, ALLIANCE);
                    break;
                }
            }
        }

        void OnGameObjectCreate(GameObject* go, bool add)
        {
            switch(go->GetEntry())
            {
            case GO_CORALES:
                uiCorales = go->GetGUID();
                if(encounter[0] == DONE)
                    go->SetPhaseMask(2,true);
                break;
            case GO_LADY_NAZJAR_DOOR:
                uiLadyNazjarDoor = go->GetGUID();
                HandleGameObject(uiLadyNazjarDoor, true);
                break;
            case GO_COMMANDER_ULTHOK_DOOR:
                uiCommanderUlthokDoor = go->GetGUID();
                HandleGameObject(uiCommanderUlthokDoor, true);
                break;
            case GO_ERUNAK_STONESPEAKER_DOOR:
                uiMindebenderGhurshaDoor = go->GetGUID();
                HandleGameObject(0, encounter[DATA_COMMANDER_ULTHOK] == DONE, go);
                break;
            case GO_OZUMAT_DOOR:
                uiOzumatDoor = go->GetGUID();
                HandleGameObject(0, encounter[DATA_MINDEBENDER_GHURSHA] == DONE, go);
                break;
            case GO_CONTROL_SYSTEM:
                uiControlSystem = go->GetGUID();
                break;
            case GO_TENTACLE_RIGHT:
                uiTentacleRight = go->GetGUID();
                break;
            case GO_TENTACLE_LEFT:
                uiTentacleLeft = go->GetGUID();
                break;
            }
        }

        void SetData(uint32 type, uint32 data)
        {
            encounter[type] = data;

            switch(type)
            {
            case DATA_LADY_NAZJAR:
                if (data == DONE)
                {
                    if(Creature* commanderUlthok = instance->GetCreature(uiCommanderUlthok))
                    {
                        commanderUlthok->SetPhaseMask(PHASEMASK_NORMAL, true);
                        commanderUlthok->CastSpell(commanderUlthok, SPELL_ULTHOK_INTRO, true);
                    }

                    if(Creature* ozumat = instance->GetCreature(uiOzumat))
                        ozumat->AI()->DoAction(ACTION_OZUMAT_PREPARE_EVENT);

                    if(GameObject* controlSystem = instance->GetGameObject(uiControlSystem))
                        controlSystem->SetPhaseMask(PHASEMASK_NORMAL, true);

                    HandleGameObject(uiCommanderUlthokDoor, false);

                    if(GameObject* corales = instance->GetGameObject(uiCorales))
                        corales->SetPhaseMask(2,true);

                    }else if (data == IN_PROGRESS)
                {
                    HandleGameObject(uiLadyNazjarDoor, false);
                }else
                {
                    if(Creature* commanderUlthok = instance->GetCreature(uiCommanderUlthok))
                        commanderUlthok->SetPhaseMask(2, true);

                    HandleGameObject(uiLadyNazjarDoor, true);

                    if(GameObject* corales = instance->GetGameObject(uiCorales))
                        corales->SetPhaseMask(1,true);
                }
                break;
            case DATA_COMMANDER_ULTHOK:
                if (data == DONE)
                {
                    HandleGameObject(uiLadyNazjarDoor, true);
                    HandleGameObject(uiCommanderUlthokDoor, true);
                    HandleGameObject(uiMindebenderGhurshaDoor, true);


                    HandleGameObject(uiOzumatDoor, true);

                }else if (data == IN_PROGRESS)
                {
                    HandleGameObject(uiCommanderUlthokDoor, false);
                    HandleGameObject(uiLadyNazjarDoor, false);

                }else if (encounter[DATA_LADY_NAZJAR] == DONE)
                {
                    HandleGameObject(uiLadyNazjarDoor, true);
                    HandleGameObject(uiCommanderUlthokDoor, true);
                }

                break;
            case DATA_MINDEBENDER_GHURSHA:
                if(data == DONE)
                {
                    HandleGameObject(uiMindebenderGhurshaDoor, true);
                    HandleGameObject(uiOzumatDoor, true);
                }else if (data == IN_PROGRESS)
                    HandleGameObject(uiMindebenderGhurshaDoor, false);
                else if (encounter[DATA_COMMANDER_ULTHOK] == DONE)
                    HandleGameObject(uiCommanderUlthokDoor, true);
                else
                    HandleGameObject(uiCommanderUlthokDoor, false);

                break;
            case DATA_OZUMAT:
                if(data == DONE)
                    HandleGameObject(uiOzumatDoor, true);
                else if (data == IN_PROGRESS)
                    HandleGameObject(uiOzumatDoor, false);
                else if (encounter[DATA_COMMANDER_ULTHOK] == DONE)
                    HandleGameObject(uiCommanderUlthokDoor, true);
            }

            if (data == DONE)
                SaveToDB();
        }

        uint32 GetData(uint32 type)
        {
            if(type < MAX_ENCOUNTER)
                return encounter[type];

            return NULL;
        }

        uint64 GetData64(uint32 identifier)
        {
            switch(identifier)
            {
            case BOSS_LADY_NAZJAR:
                return uiLadyNazjar;

            case BOSS_COMMANDER_ULTHOK:
                return uiCommanderUlthok;
            case NPC_ERUNAK_STONESPEAKER:
                return uiErunakStonespeaker;
            case BOSS_MINDBENDER_GHURSHA:
                return uiMindbenderGhursha;
            case BOSS_OZUMAT:
                return uiOzumat;
            case NPC_NEPTULON:
                return uiNeptulon;
            }

            return 0;
        }

        std::string GetSaveData()
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            saveStream << "T o t T " << encounter[0] << " " << encounter[1] << " "
                << encounter[2] << " " << encounter[3];

            str_data = saveStream.str();

            OUT_SAVE_INST_DATA_COMPLETE;
            return str_data;
        }

        void Load(const char* in)
        {
            if (!in)
            {
                OUT_LOAD_INST_DATA_FAIL;
                return;
            }

            OUT_LOAD_INST_DATA(in);

            char dataHead1, dataHead2, dataHead3, dataHead4;
            uint16 data0, data1, data2, data3;

            std::istringstream loadStream(in);
            loadStream >> dataHead1 >> dataHead2 >> dataHead3 >> dataHead4 >> data0 >> data1 >> data2 >> data3;

            if (dataHead1 == 'T' && dataHead2 == 'o' && dataHead3 == 't' && dataHead4 == 'T')
            {
                encounter[0] = data0;
                encounter[1] = data1;
                encounter[2] = data2;
                encounter[3] = data3;

                for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                    if (encounter[i] == IN_PROGRESS)
                        encounter[i] = NOT_STARTED;

            } else OUT_LOAD_INST_DATA_FAIL;

            OUT_LOAD_INST_DATA_COMPLETE;
        }

        void Update(uint32 diff)
        {
            if(isCinematicInProgress == 0)
                return;
        }
    };
};

void AddSC_instance_throne_of_the_tides()
{
    new instance_throne_of_the_tides();
}