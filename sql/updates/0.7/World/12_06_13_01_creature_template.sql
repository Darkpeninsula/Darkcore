
-- Redridge
UPDATE creature_template SET minlevel=17, maxlevel=17, faction_A=72, faction_H=72 WHERE entry IN (43461, 43459, 43508, 43607, 43462);
UPDATE creature_template SET minlevel=17, maxlevel=25, faction_A=72, faction_H=72 WHERE entry IN (43458, 43611);
UPDATE creature_template SET minlevel=35, maxlevel=35, faction_A=72, faction_H=72 WHERE entry=43733;
UPDATE creature_template SET minlevel=85, maxlevel=85, faction_A=72, faction_H=72 WHERE entry=43072;

-- Mount Hyjal
UPDATE creature_template SET minlevel=88, maxlevel=88, faction_A=35, faction_H=35 WHERE entry IN (40772, 40773);
UPDATE creature_template SET minlevel=80, maxlevel=80, faction_A=1158, faction_H=1158 WHERE entry=40816;