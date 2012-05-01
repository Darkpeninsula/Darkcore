-- fix templates
UPDATE item_template SET quality = 3, flags = 4160, flagsextra = 8192, itemLevel = 83, requiredSkill = 755, requiredskillrank = 465, delay = 0, spellid_1 = 483, spellcharges_1 = -1, spelltrigger_2 = 6, bonding = 1, WDBVerified = 13329 WHERE entry IN (68359, 68360, 68361);
UPDATE item_template SET spellid_2 = 95754, description = "Teaches you how to cut a Willful Ember Topaz." WHERE entry = 68359;
UPDATE item_template SET spellid_2 = 95755, description = "Teaches you how to cut a Lucent Ember Topaz." WHERE entry = 68360;
UPDATE item_template SET spellid_2 = 95756, description = "Teaches you how to cut a Resplendent Ember Topaz." WHERE entry = 68361;

/* adding missing sockets into DB 
http://www.wowhead.com/item=68356
http://www.wowhead.com/item=68357
http://www.wowhead.com/item=68358
*/
DELETE FROM item_template WHERE entry IN (68356, 68357, 68358);
INSERT INTO item_template (entry, class, subclass, unk0, NAME, displayid, Quality, FlagsExtra, BuyPrice, SellPrice, AllowableClass, AllowableRace, ItemLevel, stackable, delay, spellcharges_1, spellcooldown_1, spellcategorycooldown_1, spellcharges_2, spellcooldown_2, spellcategorycooldown_2, spellcharges_3, spellcooldown_3, spellcategorycooldown_3, spellcharges_4, spellcooldown_4, spellcategorycooldown_4, spellcharges_5, spellcooldown_5, spellcategorycooldown_5, description, Material, BagFamily, GemProperties, WDBVerified )
VALUES (68356, 3, 5, -1, 'Willful Ember Topaz', 75776, 3, 8192, 150000, 37500, -1, -1, 85, 1, 0, 0, -1, -1, 0, -1,  -1, 0, -1, -1, 0, -1, -1, 0, -1, -1, "Matches a Red or Yellow Socket.", 4, 512, 1846, 13329 ),
(68357, 3, 5, -1, 'Lucent Ember Topaz', 75776, 3, 8192, 150000, 37500, -1, -1, 85, 1, 0, 0, -1, -1, 0, -1, -1, 0, -1, -1, 0, -1, -1, 0, -1, -1, "Matches a Red or Yellow Socket.", 4, 512, 1847, 13329),
(68358, 3, 5, -1, 'Resplendent Ember Topaz', 75776, 3, 8192, 150000, 37500, -1, -1, 85, 1, 0, 0, -1, -1, 0, -1, -1, 0, -1, -1, 0, -1, -1, 0, -1, -1, "Matches a Red or Yellow Socket.", 4, 512, 1848, 13329);
