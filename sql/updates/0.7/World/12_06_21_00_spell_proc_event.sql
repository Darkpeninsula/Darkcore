-- (79683) Arcane Missiles!
DELETE FROM `spell_proc_event` WHERE `entry` IN (79683);
INSERT INTO `spell_proc_event` VALUES (79683, 0x55, 0x03, 0x21EA5AF7, 0x00009050, 0x00005900, 0x00010000, 0x00000000, 0, 40, 0);

-- (79683) Arcane Missiles! is aura-linked with (79808) Arcane Missiles aurastate
DELETE FROM spell_linked_spell WHERE spell_effect=79808;
INSERT INTO spell_linked_spell VALUES (79683, 79808, 2, "Arcane Missiles aurastate");