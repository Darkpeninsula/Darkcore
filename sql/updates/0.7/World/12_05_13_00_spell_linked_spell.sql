-- Fix Mage's "Pyroblast!" Istant cast
DELETE FROM spell_linked_spell WHERE spell_trigger=92315;
INSERT INTO spell_linked_spell VALUES
(92315, -48108, 0, "Pyroblast! & Hot Streak");