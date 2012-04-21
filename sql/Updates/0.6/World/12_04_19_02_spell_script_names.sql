-- Death Coil
DELETE FROM `spell_script_names` WHERE `spell_id` = 47541;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(47541, 'spell_dk_death_coil');
