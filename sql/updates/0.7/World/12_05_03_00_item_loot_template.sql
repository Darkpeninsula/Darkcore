-- Fix Abandoned Adventurer's Satchel item loot

DELETE FROM item_template_addon WHERE id = 44663;
DELETE FROM item_loot_template WHERE entry = 44663;
INSERT INTO item_template_addon VALUES (44663, 1, 0, 150000, 250000, 0);
INSERT INTO item_loot_template VALUES
(44663, 33470, 100, 1, 0, 20, 20),
(44663, 37700, 10, 1, 1, 3, 5),
(44663, 37701, 10, 1, 1, 3, 5),
(44663, 37702, 10, 1, 1, 3, 5),
(44663, 37703, 10, 1, 1, 3, 5),
(44663, 37704, 10, 1, 1, 3, 5),
(44663, 37705, 10, 1, 1, 3, 5);