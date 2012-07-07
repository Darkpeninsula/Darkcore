-- Fix Surge of Light

DELETE FROM spell_linked_spell WHERE spell_trigger=2061;
INSERT INTO spell_linked_spell VALUES (2061, -88688, 0, "Flash Heal - Surge of Light");