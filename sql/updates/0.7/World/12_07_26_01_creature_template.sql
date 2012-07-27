-- SIAMAT

-- Blizzlike stats of Siamat (Normal mode)
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `minlevel` = '87', `maxlevel` = '87', `Health_Mod` = '34.19', `exp` = '3', `AIName` = '', `dmg_multiplier` = '10', `difficulty_entry_1` = '51088', `ScriptName` = 'boss_siamat' WHERE `entry` = 44819;

-- Blizzlike stats of Siamat (Heroic mode)
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1200', `maxdmg` = '1300', `dmg_multiplier` = '18', `minlevel` = '87', `maxlevel` = '87', `Health_Mod` = '41.03', `exp` = '3', `lootid` = '51088', `flags_extra` = '1' WHERE `entry` = 51088;

-- Blizzlike stats of Siamat Servant (Normal and heroic mode)
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1000', `maxdmg` = '1300', `dmg_multiplier` = '6', `minlevel` = '85', `maxlevel` = '85', `Health_Mod` = '5.28', `exp` = '3', `difficulty_entry_1` = '49256' WHERE `entry` = 45269;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1000', `maxdmg` = '1300', `dmg_multiplier` = '12', `minlevel` = '85', `maxlevel` = '85', `Health_Mod` = '7.92', `exp` = '3' WHERE `entry` = 49256;

-- Blizzlike stats of Siamat Minion (Normal and heroic mode)
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1000', `maxdmg` = '1300', `dmg_multiplier` = '4', `minlevel` = '85', `maxlevel` = '85', `Health_Mod` = '1.82', `exp` = '3', `difficulty_entry_1` = '49260' WHERE `entry` = 44704;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1000', `maxdmg` = '1300', `dmg_multiplier` = '8', `minlevel` = '85', `maxlevel` = '85', `Health_Mod` = '3.65', `exp` = '3' WHERE `entry` = 49260;

-- Siamat Servant and Minion scriptnames
UPDATE `creature_template` SET `ScriptName` = 'mob_siamat_servant' WHERE `entry` = 45269;
UPDATE `creature_template` SET `ScriptName` = 'mob_siamat_minion' WHERE `entry` = 44704;

-- Siamat Yells
DELETE FROM `script_texts` WHERE `npc_entry` = '44819';
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(44819, -1812020, 'I. AM. UNLEASHED!', 20231, 1, 0, 0, 'Intro1'),
(44819, -1812021, 'Winds of the south, rise and come to your masters aid!', 20227, 1, 0, 0, 'Engage'),
(44819, -1812022, 'Nothing more than dust in the wind.', 20232, 1, 0, 0, 'Kill'),
(44819, -1812023, 'The sky... Beckons...', 20226, 1, 0, 0, 'Death'),
(44819, -1812024, 'Cower before the tempest storm!', 20228, 1, 0, 0, 'Death');

-- Temp Disable Achievement (Normal and Heroic) in wait for correct Fix (Now is Assigned with Core Script)
-- Normal
UPDATE `achievement_criteria_data` SET `type` = '11' WHERE `criteria_id` = '13572';
-- Heroic 
UPDATE `achievement_criteria_data` SET `type` = '11' WHERE `criteria_id` = '14353';

-- Siamant Platform Position
DELETE FROM `gameobject` WHERE `id` = '206667';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
('206667','755','1','1','-10953.2','-1390.1','10.3857','5.20227','1.1911e-43','0','0.514529','-0.857473','300','255','1');

-- Siamant Correct Spawn Position
DELETE FROM `creature` WHERE `id` = '44819';
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('44819','755','3','1','0','0','-10948.3','-1400.35','35.5715','3.2844','86400','10','0','1','0','1','0','0','0');