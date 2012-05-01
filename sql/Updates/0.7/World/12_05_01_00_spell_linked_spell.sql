-- fix Mastery (thx Nevan)

DELETE FROM spell_linked_spell where spell_trigger IN (86467, 87491, 87492, 87493, 87494, 87495, 87496, 87497, 87498, 87500);
INSERT INTO spell_linked_spell VALUES 
(86467, 86473, 3, "Mastery Mage"),
(87491, 86470, 3, "Mastery Druid"),
(87492, 86471, 3, "Mastery DeathKnight"),
(87493, 86472, 3, "Mastery Hunter"),
(87494, 86474, 3, "Mastery Paladin"),
(87495, 86475, 3, "Mastery Priest"),
(87496, 86476, 3, "Mastery Rogue"),
(87497, 86477, 3, "Mastery Shaman"),
(87498, 86478, 3, "Mastery Warlock"),
(87500, 86479, 3, "Mastery Warrior");