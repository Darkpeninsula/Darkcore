-- fix Mastery (thx Nevan)

DELETE FROM spell_linked_spell where spell_trigger IN (86497, 86491, 86492, 86493, 86494, 86495, 86496, 86497, 86498, 86500);
INSERT INTO spell_linked_spell VALUES 
(86467, 86473, 3, "Mastery Mage"),
(86491, 86470, 3, "Mastery Druid"),
(86492, 86471, 3, "Mastery DeathKnight"),
(86493, 86472, 3, "Mastery Hunter"),
(86494, 86474, 3, "Mastery Paladin"),
(86495, 86475, 3, "Mastery Priest"),
(86496, 86476, 3, "Mastery Rogue"),
(86497, 86477, 3, "Mastery Shaman"),
(86498, 86478, 3, "Mastery Warlock"),
(86500, 86479, 3, "Mastery Warrior");