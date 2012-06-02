-- Delete Double Spawn
DELETE FROM `creature` WHERE `id` = '36613';

-- Spell Script Name
DELETE FROM `spell_script_names` WHERE `spell_id` IN ('67682');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES (67682,'spell_kablooey_bombs');

-- Creature Script Name
UPDATE `creature_template` SET `flags_extra`='128', `ScriptName` = 'npc_fourth_and_goal_target' WHERE `entry` = '37203';
UPDATE `creature_template` SET `ScriptName` = 'npc_injured_soldier' WHERE `entry` = '12923';
UPDATE `creature_template` SET `ScriptName`='npc_lazy_peon' WHERE `entry`='10556';

-- Insert Creature
DELETE FROM `creature` WHERE `id` = '37203';
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (37203, 648, 1, 1, 0, 37203, -8354.84, 1483.99, 47.3908, 6.10657, 300, 0, 0, 42, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `ScriptName` = 'mob_valiona_gb' WHERE `entry` = 40320;
UPDATE `creature_template` SET `ScriptName` = 'mob_invoked_flame_spirit' WHERE `entry` = 40357;
UPDATE `creature_template` SET `ScriptName` = 'mob_faceless' WHERE `entry` = 48844;
UPDATE `creature_template` SET `ScriptName` = 'mob_alexstraszas_eggs' WHERE `entry` = 40486;
UPDATE `creature_template` SET `ScriptName` = 'mob_shadow_gale_stalker' WHERE `entry` = 39388;
UPDATE `creature_template` SET `ScriptName` = 'mob_twilight_archer' WHERE `entry` = 40197;
UPDATE `creature_template` SET `ScriptName` = 'npc_dweller' WHERE `entry` = 45467;
UPDATE `creature_template` SET `ScriptName` = 'npc_malveillant' WHERE `entry` = 39984;
UPDATE `creature_template` SET `ScriptName` = 'boss_mindbender_ghursha' WHERE `entry` = 40788;
UPDATE `creature_template` SET `ScriptName` = 'mob_waterspout' WHERE `entry` = 48571;
UPDATE `creature_template` SET `ScriptName` = 'mob_neptulon' WHERE `entry` = 40792;
UPDATE `creature_template` SET `ScriptName` = 'boss_umbriss' WHERE  `entry` = 39625;

UPDATE `gameobject_template` SET `ScriptName` = 'go_totd_defense_system' WHERE `entry` = 203199;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 122 AND `spell_effect` = 22645;

--  Fix PROC: improved steady shot, master marksman, arcane concentration(clearcasting),
--           rude interruption, Bloodsurge, invocation. 
REPLACE INTO `spell_proc_event` VALUES (34485, 0, 9, 0, 1, 0, 0, 0, 0, 20, 0);
REPLACE INTO `spell_proc_event` VALUES (34486, 0, 9, 0, 1, 0, 0, 0, 0, 40, 0);
REPLACE INTO `spell_proc_event` VALUES (34487, 0, 9, 0, 1, 0, 0, 0, 0, 60, 0);
REPLACE INTO `spell_proc_event` VALUES (46913, 0, 4, 0, 1024, 0, 0, 0, 0, 10, 0);
REPLACE INTO `spell_proc_event` VALUES (46914, 0, 4, 0, 1024, 0, 0, 0, 0, 20, 0);
REPLACE INTO `spell_proc_event` VALUES (46915, 0, 4, 0, 1024, 0, 0, 0, 0, 30, 0);
REPLACE INTO `spell_proc_event` VALUES (53221, 0, 9, 0, 1, 0, 0, 0, 0, 50, 0);
REPLACE INTO `spell_proc_event` VALUES (53222, 0, 9, 0, 1, 0, 0, 0, 0, 50, 0);
REPLACE INTO `spell_proc_event` VALUES (53224, 0, 9, 0, 1, 0, 0, 0, 0, 50, 0);
REPLACE INTO `spell_proc_event` VALUES (61216, 0, 4, 2056, 0, 0, 4112, 0, 0, 100, 0);
REPLACE INTO `spell_proc_event` VALUES (61221, 0, 4, 2056, 0, 0, 4112, 0, 0, 100, 0);
REPLACE INTO `spell_proc_event` VALUES (84722, 0, 3, 16384, 0, 0, 0, 0, 0, 100, 0);
REPLACE INTO `spell_proc_event` VALUES (84723, 0, 3, 16384, 0, 0, 0, 0, 0, 100, 0);
REPLACE INTO `spell_proc_event` VALUES (85285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30);

-- (56836) Glyph of Silencing Shot
DELETE FROM `spell_proc_event` WHERE `entry` IN (56836);
INSERT INTO `spell_proc_event` VALUES (56836, 0x00, 0x09, 0x00040000, 0x00000000, 0x00000000, 0x00000100, 0x00000000, 0, 0, 0);DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = '61336';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES ('61336', '50322', '1', 'Survival Instincts');-- (87099) Sin and Punishment (Rank 1)
DELETE FROM `spell_proc_event` WHERE `entry` IN (87099);
INSERT INTO `spell_proc_event` VALUES (87099, 0x01, 0x06, 0x00000000, 0x00000000, 0x00000000, 0x00040000, 0x00000002, 0, 100, 0);

-- (87100) Sin and Punishment (Rank 2)
DELETE FROM `spell_proc_event` WHERE `entry` IN (87100);
INSERT INTO `spell_proc_event` VALUES (87100, 0x01, 0x06, 0x00000000, 0x00000000, 0x00000000, 0x00040000, 0x00000002, 0, 100, 0);

/* Justice Point Reward Heroic System */

-- TODO - Missing Heroic Entry
-- | 23574 | Akil'zon |
-- | 23576 | Nalorakk |
-- | 23577 | Halazzi |
-- | 23578 | Jan'alai |
-- | 23863 | Zul'jin/Daakara |
-- | 24239 | Hex Lord Malacrass |
-- | 49045 | Augh |
-- | 23120 | Sky Sergeant Vanderlip |
-- | 29932 | Eck the Ferocious |

-- Set Heroic Entry
update `creature_template` set `difficulty_entry_1` = '48815' WHERE entry = '39378';
update `creature_template` set `difficulty_entry_1` = '49262' WHERE entry = '39425';
update `creature_template` set `difficulty_entry_1` = '48714' WHERE entry = '39428';
update `creature_template` set `difficulty_entry_1` = '48710' WHERE entry = '39587';
update `creature_template` set `difficulty_entry_1` = '39666' WHERE entry = '39665';
update `creature_template` set `difficulty_entry_1` = '39680' WHERE entry = '39679';
update `creature_template` set `difficulty_entry_1` = '39699' WHERE entry = '39698';
update `creature_template` set `difficulty_entry_1` = '39701' WHERE entry = '39700';
update `creature_template` set `difficulty_entry_1` = '39706' WHERE entry = '39705';
update `creature_template` set `difficulty_entry_1` = '48715' WHERE entry = '39731';
update `creature_template` set `difficulty_entry_1` = '48776' WHERE entry = '39732';
update `creature_template` set `difficulty_entry_1` = '48902' WHERE entry = '39788';
update `creature_template` set `difficulty_entry_1` = '48822' WHERE entry = '40484';
update `creature_template` set `difficulty_entry_1` = '49079' WHERE entry = '40586';
update `creature_template` set `difficulty_entry_1` = '49064' WHERE entry = '40765';
update `creature_template` set `difficulty_entry_1` = '49082' WHERE entry = '40788';
update `creature_template` set `difficulty_entry_1` = '49072' WHERE entry = '40825';
update `creature_template` set `difficulty_entry_1` = '49654' WHERE entry = '42188';
update `creature_template` set `difficulty_entry_1` = '49624' WHERE entry = '42333';
update `creature_template` set `difficulty_entry_1` = '49538' WHERE entry = '43214';
update `creature_template` set `difficulty_entry_1` = '49642' WHERE entry = '43438';
update `creature_template` set `difficulty_entry_1` = '48951' WHERE entry = '43612';
update `creature_template` set `difficulty_entry_1` = '49043' WHERE entry = '43614';
update `creature_template` set `difficulty_entry_1` = '43874' WHERE entry = '43873';
update `creature_template` set `difficulty_entry_1` = '43876' WHERE entry = '43875';
update `creature_template` set `difficulty_entry_1` = '43879' WHERE entry = '43878';
update `creature_template` set `difficulty_entry_1` = '48932' WHERE entry = '44577';
update `creature_template` set `difficulty_entry_1` = '51088' WHERE entry = '44819';

-- Set Reward
DELETE FROM `creature_onkill_reward` WHERE `CurrencyId1` = '395';
INSERT INTO `creature_onkill_reward` VALUES 
(48815, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48710, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48776, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49064, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49654, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(43874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(43876, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(43879, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(51088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(32313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36086, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36083, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(35517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(35518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(35490, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36091, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36090, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36089, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(37629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0);

UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30510';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30529';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30530';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30532';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30540';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30748';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30774';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30788';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30807';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30810';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31211';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31212';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31215';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31217';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31349';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31350';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31360';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31362';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31365';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31368';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31370';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31381';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31384';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31386';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31456';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31464';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31465';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31469';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31506';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31507';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31508';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31509';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31510';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31511';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31512';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31533';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31536';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31537';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31538';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31558';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31559';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31560';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31561';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31611';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31612';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31656';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31673';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31679';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '36498';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '36938';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '37613';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '37627';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '37677';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '38599';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '38603';

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = '1464';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
('1464', '-46916', '0', 'Slam -> Bloodsurge');

-- "Dual talent specialization" cost has been reduced since 4.x.x, from the original 1.000g to the new amount of 10g
UPDATE gossip_menu_option SET box_money=100000 WHERE option_id=18 AND npc_option_npcflag=16;

DELETE FROM `spell_script_names` WHERE `spell_id` = 77478;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(77478, 'spell_sha_earthquake');

DELETE FROM `spell_script_names` WHERE `spell_id` = 48707;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(48707, 'spell_dk_anti_magic_shell');
-- Blessing of Might
DELETE FROM `spell_script_names` WHERE `spell_id` = 19740;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(19740, 'spell_pall_bless_of_might');

-- Blessing of King
DELETE FROM `spell_script_names` WHERE `spell_id` = 20217;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(20217, 'spell_pall_bless_of_king');-- Death Coil
DELETE FROM `spell_script_names` WHERE `spell_id` = 47541;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(47541, 'spell_dk_death_coil');


DELETE FROM `gameobject` WHERE `id` = '208790';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(208790, 761, 1, 1, 1057.78, 1278.26, 3.1924, 1.86482, 0, 0, 0.101143, -0.994872, 300, 0, 1),
(208790, 761, 1, 1, 1251.01, 958.394, 5.68, 2.7698, 0, 0, 0.978702, 0.205288, 300, 0, 1),
(208790, 761, 1, 1, 980.183, 947.869, 14.1178, 5.9015, 0, 0, 0.189688, -0.981844, 300, 0, 1);

DELETE FROM  `gameobject_template` WHERE entry IN (208779, 208780, 208781, 208782, 208783, 208784, 208785, 208786, 208787, 208788, 208789, 208790);
INSERT INTO `gameobject_template` VALUES
(208779, 10, 6271, 'Lighthouse Banner', '', 'Capturing', '', 0, 4, 1, 0, 0, 0, 0, 0, 0, 1479, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 23932, 1, 0, 1, 37190, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1),
(208780, 10, 6271, 'Lighthouse Banner', '', 'Capturing', '', 0, 4, 1, 0, 0, 0, 0, 0, 0, 1479, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 23932, 1, 0, 1, 37190, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1),
(208781, 10, 6271, 'Lighthouse Banner', '', 'Capturing', '', 0, 4, 1, 0, 0, 0, 0, 0, 0, 1479, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 23932, 1, 0, 1, 37190, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1),
(208782, 10, 6271, 'Mine Banner', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 13623),
(208783, 10, 6271, 'Mine Banner', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 13623),
(208784, 10, 6271, 'Mine Banner', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 13623),
(208785, 10, 6271, 'Waterworks Banner', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 13623),
(208786, 10, 6271, 'Waterworks Banner', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 13623),
(208787, 10, 6271, 'Waterworks Banner', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 13623),
(208788, 10, 6271, 'Waterworks Banner', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 13623),
(208790, 1, 6271, 'Banner', '', 'Capturing', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1479, 0, 180102, 1, 1, 37190, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1);

DELETE FROM `gameobject_template` WHERE `entry`=207177;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`,`AIName`, `ScriptName`, `WDBVerified`) VALUES (207177,0,9062,"Alliance Door","","","",0,1,0.35,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"","","13623");

DELETE FROM `gameobject_template` WHERE `entry`=207178;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`,`AIName`, `ScriptName`, `WDBVerified`) VALUES (207178,0,10215,"Horde Gate","","","",0,1,1.0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"","","13623");

-- Fix min lvl and Min, Max players on the TP and BG
DELETE FROM `battleground_template` WHERE `id` IN (120,108);
INSERT INTO `battleground_template` VALUES
(108,10,10,81,85,1726,0,1727,0,1,'','Twin Peaks'),
(120,10,10,85,85,1740,0,1739,0,1,'','The Battle for Gilneas');

-- Alexstrasza's Egg
DELETE FROM `creature` WHERE `id` = '40486';
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(40486, 670, 3, 1, 0, 0, -717.229, -783.714, 232.589, 1.71965, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -717.068, -779.158, 232.589, 1.51702, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -720.979, -776.138, 232.589, 2.53489, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -723.098, -779.655, 232.57, 4.34445, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -726.778, -778.067, 232.581, 2.59301, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -731.179, -781.687, 232.537, 3.89913, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -725.62, -785.201, 232.51, 1.48482, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -736.727, -779.458, 233.234, 0.67337, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -759.719, -787.613, 233.233, 2.7751, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -760.504, -781.378, 233.233, 2.21039, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -754.77, -787.614, 233.233, 1.79099, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -752.464, -781.225, 233.233, 2.1884, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -752.716, -794.172, 232.958, 1.92372, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -749.424, -788.823, 233.224, 1.95357, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -748.307, -782.618, 233.233, 2.15856, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -745.262, -787.899, 233.233, 1.15639, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -743.479, -781.883, 233.233, 1.9033, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -737.272, -787.367, 233.083, 2.05332, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -712.951, -868.056, 233.233, 6.08758, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -710.36, -871.452, 233.233, 0.487687, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -709.689, -875.728, 233.233, 5.30925, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -714.731, -875.038, 232.784, 4.98252, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -722.655, -875.533, 232.565, 5.73729, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -720.525, -870.936, 232.525, 0.155461, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -719.207, -865.433, 232.527, 5.39721, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -719.112, -877.951, 232.589, 4.71705, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -728.938, -871.48, 232.51, 4.70841, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -727.86, -866.585, 232.466, 5.75378, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -726.635, -875.311, 232.552, 4.31571, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -734.638, -872.613, 232.556, 5.57313, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -733.116, -866.812, 232.459, 4.76732, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -739.585, -876.811, 232.967, 4.36205, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -739.534, -866.357, 233.226, 4.6715, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -743.071, -870.399, 233.233, 4.80816, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -745.857, -863.124, 232.526, 4.66679, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -748.124, -868.742, 233.232, 4.70292, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -751.46, -873.115, 233.233, 4.48065, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -754.244, -865.386, 233.231, 4.94796, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -756.438, -859.115, 232.571, 3.99763, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -760.649, -861.407, 233.231, 4.62202, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -760.098, -867.246, 233.232, 5.01315, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -760.79, -872.942, 233.233, 6.25958, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -716.612, -791.393, 232.558, 0.600786, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -711.059, -787.878, 233.111, 0.329824, 300, 0, 0, 49638, 0, 0, 0, 0, 0),
(40486, 670, 3, 1, 0, 0, -706.57, -781.956, 233.234, 1.28173, 300, 0, 0, 49638, 0, 0, 0, 0, 0);


-- Cleanup erroneus npcflag at startup for heroic entries
UPDATE creature_template SET npcflag=3 WHERE entry IN 
(39679, 39698, 39700, 39705, 40825, 42333, 39680, 39699, 39701, 39706, 49072, 49624);

-- << game_event` game event id (435)  have not existed holiday id 288. >>
-- not sure about id: 288 is obviously not valid: chance between 435 and 436
-- (call to arms in the calendar, missing only this IDs)
UPDATE game_event SET holiday=435 WHERE EventEntry=435;


-- Cleanup scriptname
UPDATE creature_template SET scriptname="boss_lady_nazjar" WHERE entry=40586;
UPDATE creature_template SET scriptname="mob_lady_nazjar_event" WHERE entry=42667;



-- general cleanup

DELETE FROM creature WHERE id IN (29975, 21838, 23068, 23066, 23067, 23161, 23165, 23163, 23204, 42465, 43116, 43010, 43012, 46327, 46785);
DELETE FROM gameobject WHERE id IN (204959, 204253, 205195, 205152, 205147, 205146, 205151, 204837, 204281);
DELETE FROM game_tele WHERE name IN ("TheRoom", "RuinsofUldum", "VolcanothsLair", "AbyssalDepths", "WorgenFinish", "NorthernStranglethorn", 
"OrgrimmarPortalTrainer", "TheBastionOfTwilight", "MountHyjal", "VortexPinnacleStart", "ArenaDalaran", "ArenaNagrand", "ArenaBladesEdgeMountains");


-- The Storm Peaks
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('29975','571','1','1','0','0','6917.44','-1537.96','835.06','4.47125','300','0','0','12175','0','0','0','0','0');


-- Terokkar Forest
UPDATE creature_template SET faction_A=14, faction_H=14 WHERE entry IN (23066, 23067, 23161);

insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('21838','530','1','1','0','0','-3786.22','3508.34','287.011','3.15176','300','0','0','221400','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('23066','530','1','1','0','0','-3827.51','3357.09','324.05','0.176674','300','0','0','5530','7332','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('23066','530','1','1','17865','0','-3818.79','3342.31','324.052','5.98741','300','5','0','5530','7332','1','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('23067','530','1','1','17877','0','-3947.14','3316.34','288.038','2.98152','300','5','0','5027','7332','1','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('23068','530','1','1','0','1796','-3678.46','3378.86','312.117','0.0376654','300','0','0','6032','7332','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('23068','530','1','1','20603','0','-3680.53','3294.17','312.271','1.85503','300','5','0','6032','7332','1','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('23161','530','1','1','0','0','-3991.52','3149.02','363.526','1.45364','300','0','0','47224','9927','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('23163','530','1','1','0','0','-4010.25','3139','362.53','5.53614','300','0','0','59040','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('23165','530','1','1','0','0','-3988.99','3157.54','362.56','1.25179','300','0','0','73800','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('23204','530','1','1','0','0','-4001.13','3120.47','362.359','0.281826','300','0','0','59040','0','0','0','0','0');


-- Deepholm
insert into `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('192012','204959','646','1','1','2080.63','-322.665','-159.705','5.17007','0','0','0.528266','-0.849079','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1395.36','54.4614','-88.0408','3.14161','0','0','1','-0.0000075539','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1452.62','103.602','-82.8822','3.97884','0','0','0.913649','-0.406504','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1408.75','71.4894','-84.9565','3.72516','0','0','0.957733','-0.287659','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1446.42','74.2513','-83.7044','5.14673','0','0','0.53814','-0.842856','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1412.22','38.9201','-88.6365','4.81843','0','0','0.668639','-0.743587','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1392.4','21.3141','-89.4617','5.46639','0','0','0.397141','-0.917758','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1323.21','-46.7355','-88.8321','4.08173','0','0','0.891536','-0.45295','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1308.47','-33.1003','-88.6499','2.42062','0','0','0.935725','0.352731','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1428.49','28.3574','-87.0427','0.0950475','0','0','0.0475059','0.998871','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1374.37','-18.0351','-89.4751','6.03345','0','0','0.124545','-0.992214','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1361.33','-50.1519','-88.9678','5.45775','0','0','0.4011','-0.916034','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1354.69','6.59705','-88.735','3.88067','0','0','0.932495','-0.361184','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1359.48','36.948','-87.7521','2.701','0','0','0.975833','0.21852','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1446.41','34.6305','-85.631','0.686453','0','0','0.336527','0.941674','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1456.51','58.471','-82.6349','1.27786','0','0','0.596336','0.802735','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1476.65','72.5769','-80.2608','0.270977','0','0','0.135074','0.990835','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204253','646','1','1','1476.33','138.598','-81.5992','4.07387','0','0','0.893309','-0.449442','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1928.31','190.587','-130.433','2.97973','0','0','0.996727','0.0808409','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1906.54','40.1179','-114.048','3.41955','0','0','0.990358','-0.138534','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','2035.1','145.791','-110.688','1.11755','0','0','0.53015','0.847904','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1990.16','38.9744','-73.1192','6.13232','0','0','0.0753616','-0.997156','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1866.2','170.393','-110.051','1.36574','0','0','0.631022','0.775765','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1851.84','144.004','-98.076','5.27702','0','0','0.482126','-0.876102','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1906.86','-1.13035','-57.2127','5.79617','0','0','0.24111','-0.970498','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1893.05','43.5501','-163.378','4.01881','0','0','0.905344','-0.424679','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1920.27','44.7286','-163.474','4.3314','0','0','0.828204','-0.560427','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','2004.71','130.156','-130.23','3.30409','0','0','0.996701','-0.0811604','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','2028.25','103.915','-103.712','0.620383','0','0','0.305241','0.952275','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1942.46','104.507','-155.292','3.44232','0','0','0.988716','-0.1498','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1910.14','-4.4641','-166.285','6.2085','0','0','0.037335','-0.999303','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1881.55','105.745','-111.996','4.39344','0','0','0.810421','-0.585848','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1868.54','81.7933','-98.5105','4.6432','0','0','0.731141','-0.682227','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1852.94','197.872','-88.5127','4.21202','0','0','0.860159','-0.510027','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1854.86','9.98404','-62.9289','4.33218','0','0','0.827983','-0.560753','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1936.03','135.783','-131.725','2.40717','0','0','0.933332','0.359013','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1859.14','121.041','-102.51','4.86312','0','0','0.651859','-0.758341','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1956.56','123.017','-156.108','2.03726','0','0','0.85139','0.524533','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205195','646','1','1','1955.82','71.2213','-150.533','2.35456','0','0','0.923567','0.383437','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205152','646','1','1','1479.23','-680.901','295.847','3.52968','0','0','0.981232','-0.19283','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205152','646','1','1','1521.71','-712.686','291.55','0.0974926','0','0','0.048727','0.998812','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205152','646','1','1','1580.03','-753.151','282.72','1.83479','0','0','0.794022','0.607889','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205152','646','1','1','1694.55','-643.061','281.22','1.67222','0','0','0.74204','0.670356','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205152','646','1','1','1625.09','-521.333','288.485','3.18804','0','0','0.99973','-0.0232196','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205152','646','1','1','1615.91','-447.693','278.067','1.73034','0','0','0.761204','0.648512','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205152','646','1','1','1549.27','-503.853','293.058','4.85072','0','0','0.656546','-0.754286','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205152','646','1','1','1449.5','-512.255','284.531','3.1574','0','0','0.999969','-0.00790592','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205151','646','1','1','1413.85','-551.45','281.627','1.77824','0','0','0.776519','0.630094','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205151','646','1','1','1446.09','-641.807','295.187','5.69503','0','0','0.289857','-0.95707','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205151','646','1','1','1431.94','-742.582','280.614','4.24204','0','0','0.852407','-0.522879','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205151','646','1','1','1519.94','-757.757','285.077','5.95499','0','0','0.16336','-0.986566','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205151','646','1','1','1614.5','-744.466','280.901','2.05863','0','0','0.856947','0.515404','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205151','646','1','1','1640.41','-677.554','287.341','2.82204','0','0','0.987263','0.159096','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205151','646','1','1','1682.78','-651.681','283.435','2.3351','0','0','0.919792','0.392407','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205147','646','1','1','1699.91','-637.894','280.524','3.24616','0','0','0.998634','-0.0522599','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205147','646','1','1','1678.01','-527.787','280.388','1.3023','0','0','0.606101','0.795388','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205147','646','1','1','1637.53','-464.143','279.188','1.95339','0','0','0.828653','0.559763','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205147','646','1','1','1518.09','-520.408','291.423','5.29212','0','0','0.475499','-0.879716','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205147','646','1','1','1439.36','-482.143','277.204','4.31509','0','0','0.832746','-0.553655','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205147','646','1','1','1445.24','-602.044','295.857','5.54109','0','0','0.36259','-0.931949','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205147','646','1','1','1416.83','-675.9','288.491','4.19885','0','0','0.8635','-0.504349','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205147','646','1','1','1525.66','-822.921','277.664','6.15606','0','0','0.0635193','-0.997981','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205147','646','1','1','1545.58','-686.742','306.13','0.850697','0','0','0.412638','0.910895','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205146','646','1','1','1623.33','-764.345','279.965','1.97932','0','0','0.835838','0.548976','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205146','646','1','1','1592.78','-663.293','306.721','2.81419','0','0','0.986631','0.162969','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205146','646','1','1','1679.44','-576.852','280.168','3.65771','0','0','0.966887','-0.255206','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205146','646','1','1','1641.34','-448.133','276.939','4.37636','0','0','0.815397','-0.578902','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205146','646','1','1','1602.02','-435.198','275.525','4.20357','0','0','0.862307','-0.506385','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205146','646','1','1','1571.36','-438.501','280.166','3.16684','0','0','0.99992','-0.0126241','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205146','646','1','1','1481.2','-495.468','282.251','4.94184','0','0','0.621512','-0.783405','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('205146','646','1','1','1397.37','-614.12','286.913','1.76177','0','0','0.771301','0.63647','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204837','646','1','1','1946.43','1382.74','181.262','0.00900334','0','0','0.00450166','0.99999','300','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8075.21','671.642','70.3323','2.23402','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8094','594.809','69.5074','-2.44346','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8187.11','754.599','69.1876','-2.02458','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8156.45','719.075','68.6385','-1.01229','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8257.42','742.142','70.8661','-1.83259','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8188.04','610.705','74.3691','0','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8199.96','644.168','67.7058','3.12412','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8117.18','714.309','68.3818','2.68781','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8062.16','621.564','73.4981','-2.02458','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8204.73','867.288','71.0869','-0.942477','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8167.92','810.203','67.5973','-2.26892','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8222.36','789.281','74.3298','0','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8235.52','696.712','67.2035','-1.309','0','0','0','1','180','100','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8188.96','735.515','69.0363','4.26428','0','0','0','1','180','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8221.25','767.88','71.3304','4.73866','0','0','0','1','180','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8257.66','733.196','71.2371','0.225767','0','0','0','1','180','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8126.25','709.627','69.7516','3.79933','0','0','0','1','180','0','1');
insert into `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('204281','0','1','1','-8077.95','681.952','70.9642','4.35225','0','0','0','1','180','0','1');

insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('42465','646','1','1','0','0','2385.81','176.275','182.273','3.24742','300','0','0','8400','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('43116','646','1','1','0','0','1916.13','779.92','73.3536','3.88102','300','0','0','42','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('43010','530','1','1','0','0','10368.1','-6389.02','38.5311','4.35758','300','0','0','42','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('43012','530','1','1','0','39591','9471.11','-6863.88','17.3929','1.77531','300','0','0','42','0','0','0','0','0');

-- Stormwind
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4890.62','-4606.37','317.865','0.564268','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4996.65','-4620.06','318.328','1.23576','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4945.22','-4645.48','318.779','0.537565','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4971.7','-4643.02','318.701','2.02354','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4970.78','-4536.6','318.789','3.82755','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4918.05','-4672.86','319.953','4.12056','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4973.26','-4553.58','317.719','5.20122','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4971.12','-4575.43','318.754','5.22792','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4906.71','-4701.15','325.627','2.23477','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4948.61','-4716.86','333.054','3.4404','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4872.45','-4541.96','322.29','1.96773','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4889.19','-4537.12','325.138','2.85994','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4906.62','-4546.72','319.232','2.85994','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4945.09','-4691.06','323.217','2.57568','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4947.82','-4538.5','318.156','4.20533','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4907.21','-4729.13','329.207','2.70208','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4961.59','-4592.93','324.213','5.03314','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4953.87','-4616.18','322.652','5.03314','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4937.75','-4623.48','324.232','6.25364','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4886.69','-4579.4','318.156','2.39268','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4922.31','-4620.55','322.05','0.283834','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4912.14','-4598.27','324.34','1.75253','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4914.46','-4573.23','323.807','2.22612','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4926.26','-4565.55','323.941','3.2063','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4934.12','-4553.51','318.472','2.02585','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4944.13','-4564.71','323.331','3.71524','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4957','-4579.11','325.036','4.14878','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4989.46','-4599.56','318.838','3.17017','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4979.42','-4630.64','317.951','5.14231','300','0','0','56568','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46327','0','1','1','0','0','-4925.59','-4710.15','329.65','2.13507','300','0','0','58564','0','0','0','0','0');
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('46785','0','1','1','0','0','-4935.36','-4586.45','325.035','3.54874','300','0','0','101859','0','0','0','0','0');


-- GM's tele
INSERT INTO game_tele (position_x, position_y, position_z, orientation, map, name) VALUES 
(16228, 16403.2, -64.3785, 0.0800602, 1, "TheRoom"),
(-9636.42, -2788.76, 22.259, 3.1455, 1, "RuinsofUldum"),
(1267.84, 1166.23, 117.798, 3.53519, 648, "VolcanothsLair"),
(-6513.82, 6625.62, -565.344, 4.83306, 0, "AbyssalDepths"),
(-1826.25, 2290.95, 42.0954, 3.15966, 654, "WorgenFinish"),
(-12229, -548.527, 28.7772, 1.09374, 0, "NorthernStranglethorn"),
(1687.8, -4131.16, 66.3397, 3.54215, 1, "OrgrimmarPortalTrainer"),
(-4884.16, -4251.82, 827.763, 2.07691, 0, "TheBastionOfTwilight" ),
(4977.06, -2657.86, 1424.5, 1.35005, 1, "MountHyjal" ),
(-339.959, 12.9507, 626.98, 3.85785, 657, "VortexPinnacleStart" ),
(5777.54, 607.558, 565.303, 4.71053, 571, "ArenaDalaran"),
(-2047.21, 6661.19, 13.0544, 5.28262, 530, "ArenaNagrand"),
(2839.83, 5927.53, 11.1416, 4.10059, 530, "ArenaBladesEdgeMountains");