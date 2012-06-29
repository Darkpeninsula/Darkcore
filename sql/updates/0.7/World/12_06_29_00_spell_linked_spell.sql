-- Mobile Baking (Guild spell)

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 83958;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
	(83958, 88306, 0, 'Guild - Mobile Banking');
