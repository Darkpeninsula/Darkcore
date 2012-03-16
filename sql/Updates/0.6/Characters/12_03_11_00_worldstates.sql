-- Guild Advancement Daily XP
DELETE FROM `worldstates` WHERE `entry` = '20005';
INSERT INTO `worldstates` VALUES (20005, 0, NULL);

-- Guild Activity Weekly
DELETE FROM `worldstates` WHERE `entry` = '20006';
INSERT INTO `worldstates` VALUES (20006, 0, NULL);

-- Guild Reputation Weekly
DELETE FROM `worldstates` WHERE `entry` = '20007';
INSERT INTO `worldstates` VALUES (20007, 0, NULL);