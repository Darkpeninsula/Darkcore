-- Delete Double Spawn
DELETE FROM `creature` WHERE `id` = '36613';

-- Spell Script Name
DELETE FROM `spell_script_names` WHERE `spell_id` IN ('67682');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES (67682,'spell_kablooey_bombs');

-- Creature Script Name
UPDATE `creature_template` SET `flags_extra`='128', `ScriptName` = 'npc_fourth_and_goal_target' WHERE `entry` = '37203';

-- Insert Creature
DELETE FROM `creature` WHERE `id` = '37203';
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(37203, 648, 1, 1, 0, 37203, -8354.84, 1483.99, 47.3908, 6.10657, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);