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

#ifndef DEF_THRONEOFTHETIDES_H
#define DEF_THRONEOFTHETIDES_H

enum Defines
{
    ACTION_OZUMAT_PREPARE_EVENT,
    ACTION_OZUMAT_START_EVENT,
    ACTION_OZUMAT_FINAL_PHASE,

    // Event
    NPC_NAZJAR_INVADER = 39616,
    NPC_NAZJAR_SPIRITMENDER = 41139,
    NPC_DEEP_MURLOC_DRUDGE = 39960,
    NPC_TEMPEST_WITCH = 40634,

    // Lady Naz'jar
    BOSS_LADY_NAZJAR = 40586,
    NPC_SUMMONED_WITCH = 40634, // 2 of them
    NPC_SUMMONED_GUARD = 40633,
    NPC_SUMMONED_WATERSPOUT = 48571,
    NPC_SUMMONED_WATERSPOUT_HC = 49108,
    NPC_SUMMONED_GEYSER = 40597,
    NPC_NAZJAR_COMBAT_TRIGGER = 40568,

    // Commander Ulthok
    BOSS_COMMANDER_ULTHOK = 40765,
    NPC_DARK_FISSURE = 40784,

    // Erunak Stonespeaker & Mindbender Ghur'sha
    NPC_ERUNAK_STONESPEAKER = 40825,
    BOSS_MINDBENDER_GHURSHA = 40788,
    NPC_EARTH_SHARD = 45469,
    NPC_MIND_FOG = 40861,

    // Ozumat
    BOSS_OZUMAT = 42172,
    NPC_NEPTULON = 40792,
    NPC_DEEP_MURLOC_INVADER = 44658,
    NPC_VICIOUS_MINDLASHER = 44715,
    NPC_UNYIELDING_BEHEMOTH = 44648,
    NPC_FACELESS_SAPPER = 44752,
    NPC_BLIGHT_BEAST = 44841,
    NPC_BLIGHT_OF_OZUMAT = 44801,
    NPC_OZUMAT_VISUAL_TRIGGER = 44809,

    // Mob
    GO_COMMANDER_ULTHOK_DOOR = 204338,
    GO_CORALES = 205542,
    GO_LADY_NAZJAR_DOOR = 204339,
    GO_ERUNAK_STONESPEAKER_DOOR = 204340,
    GO_OZUMAT_DOOR = 204341,
    GO_OZUMAT_CHEST_NORMAL = 205216,
    GO_OZUMAT_CHEST_HEROIC = 0,
    GO_TENTACLE_RIGHT = 402012,
    GO_TENTACLE_LEFT = 208301,
    GO_CONTROL_SYSTEM = 203199,

    SPELL_ULTHOK_INTRO = 82960,
};

enum Data
{
    DATA_LADY_NAZJAR,
    DATA_COMMANDER_ULTHOK,
    DATA_MINDEBENDER_GHURSHA,
    DATA_OZUMAT,
};

#define MAX_ENCOUNTER 4

#endif