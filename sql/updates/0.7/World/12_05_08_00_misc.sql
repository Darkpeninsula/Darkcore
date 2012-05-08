
UPDATE `creature_template` SET `ScriptName` = 'npc_shadowy_apparition' WHERE `entry` = 46954;

DELETE FROM `spell_script_names` WHERE `spell_id` = 52174;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (52174, 'spell_warr_heroic_leap');

DELETE FROM `spell_script_names` WHERE `spell_id` = 87212;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (87212, 'spell_shadowy_apparition_proc');

-- (78202) Shadowy Apparition (Rank 1)
DELETE FROM `spell_proc_event` WHERE `entry` IN (78202);
INSERT INTO `spell_proc_event` VALUES (78202, 0x20, 0x06, 0x00008000, 0x00000000, 0x00000000, 0x00040000, 0x00000000, 0, 100, 0);

-- (78203) Shadowy Apparition (Rank 2)
DELETE FROM `spell_proc_event` WHERE `entry` IN (78203);
INSERT INTO `spell_proc_event` VALUES (78203, 0x20, 0x06, 0x00008000, 0x00000000, 0x00000000, 0x00040000, 0x00000000, 0, 100, 0);
