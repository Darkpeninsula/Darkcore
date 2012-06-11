-- Will of the Necropolis

DELETE FROM spell_proc_event WHERE entry=96171;
INSERT INTO spell_proc_event (entry, ppmRate, cooldown) VALUES (96171, 1, 45);

DELETE FROM spell_linked_spell WHERE spell_effect=-96171;
INSERT INTO spell_linked_spell VALUES (48982, -96171, 0, "Rune Tap - Will of the Necropolis");