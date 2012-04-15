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


#include "Creature.h"
#include "MapManager.h"
#include "RandomMovementGenerator.h"
#include "ObjectAccessor.h"
#include "Map.h"
#include "Util.h"
#include "CreatureGroups.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"

#define RUNNING_CHANCE_RANDOMMV 20                                  //will be "1 / RUNNING_CHANCE_RANDOMMV"

#ifdef MAP_BASED_RAND_GEN
#define rand_norm() creature.rand_norm()
#endif

template<>
void RandomMovementGenerator<Creature>::SetRandomLocation(Creature &creature)
{
    float dist = 0.f;
    float X, Y, Z, ori;
    creature.GetHomePosition(X, Y, Z, ori);

    const float angle = rand_norm_f() * (M_PI_F*2.0f);
    const float range = rand_norm_f() * dist;

    // For 2D/3D system selection
    float destX = X + range * cos(angle);
    float destY = Y + range * sin(angle);
    float destZ = creature.GetPositionZ();
    creature.UpdateAllowedPositionZ(X, Y, Z);

    Movement::MoveSplineInit init(creature);
    init.MoveTo(X, Y, Z, true);
    init.SetWalk(true);
    init.Launch();

    if (creature.canFly())
        _nextMoveTime.Reset(0);
    else
        _nextMoveTime.Reset(urand(500, 10000));

    creature.AddUnitState(UNIT_STATE_ROAMING_MOVE);

    //Call for creature group update
    if (creature.GetFormation() && creature.GetFormation()->getLeader() == &creature)
        creature.GetFormation()->LeaderMoveTo(destX, destY, destZ);
}

template<>
void RandomMovementGenerator<Creature>::Initialize(Creature &creature)
{
    if (!creature.isAlive())
        return;

    if (!_wanderDistance)
        _wanderDistance = creature.GetRespawnRadius();

    creature.AddUnitState(UNIT_STATE_ROAMING | UNIT_STATE_ROAMING_MOVE);
    SetRandomLocation(creature);
}

template<>
void
RandomMovementGenerator<Creature>::Reset(Creature &creature)
{
    Initialize(creature);
}

template<>
void RandomMovementGenerator<Creature>::Interrupt(Creature &creature)
{
    creature.ClearUnitState(UNIT_STATE_ROAMING | UNIT_STATE_ROAMING_MOVE);
    creature.SetWalk(false);
}

template<>
void RandomMovementGenerator<Creature>::Finalize(Creature &creature)
{
    creature.ClearUnitState(UNIT_STATE_ROAMING | UNIT_STATE_ROAMING_MOVE);
    creature.SetWalk(false);
}

template<>
bool
RandomMovementGenerator<Creature>::Update(Creature &creature, uint32 const diff)
{
    if (creature.HasUnitState(UNIT_STATE_ROOT | UNIT_STATE_STUNNED | UNIT_STATE_DISTRACTED))
    {
        _nextMoveTime.Reset(0);  // Expire the timer
        creature.ClearUnitState(UNIT_STATE_ROAMING_MOVE);
        return true;
    }

    if (creature.movespline->Finalized())
    {
        _nextMoveTime.Update(diff);
        if (_nextMoveTime.Passed())
            SetRandomLocation(creature);
    }
    return true;
}

template<>
bool RandomMovementGenerator<Creature>::GetResetPosition(Creature &creature, float& x, float& y, float& z)
{
    float radius;
    creature.GetRespawnPosition(x, y, z, NULL, &radius);

    // use current if in range
    if (creature.IsWithinDist2d(x, y, radius))
        creature.GetPosition(x, y, z);

    return true;
}
