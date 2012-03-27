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
INSERT INTO `spell_proc_event` VALUES (56836, 0x00, 0x09, 0x00040000, 0x00000000, 0x00000000, 0x00000100, 0x00000000, 0, 0, 0);