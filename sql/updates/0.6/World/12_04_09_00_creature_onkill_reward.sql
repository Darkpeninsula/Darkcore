/* Justice Point Reward Heroic System */

-- TODO - Missing Heroic Entry
-- | 23574 | Akil'zon |
-- | 23576 | Nalorakk |
-- | 23577 | Halazzi |
-- | 23578 | Jan'alai |
-- | 23863 | Zul'jin/Daakara |
-- | 24239 | Hex Lord Malacrass |
-- | 49045 | Augh |
-- | 23120 | Sky Sergeant Vanderlip |
-- | 29932 | Eck the Ferocious |

-- Set Heroic Entry
update `creature_template` set `difficulty_entry_1` = '48815' WHERE entry = '39378';
update `creature_template` set `difficulty_entry_1` = '49262' WHERE entry = '39425';
update `creature_template` set `difficulty_entry_1` = '48714' WHERE entry = '39428';
update `creature_template` set `difficulty_entry_1` = '48710' WHERE entry = '39587';
update `creature_template` set `difficulty_entry_1` = '39666' WHERE entry = '39665';
update `creature_template` set `difficulty_entry_1` = '39680' WHERE entry = '39679';
update `creature_template` set `difficulty_entry_1` = '39699' WHERE entry = '39698';
update `creature_template` set `difficulty_entry_1` = '39701' WHERE entry = '39700';
update `creature_template` set `difficulty_entry_1` = '39706' WHERE entry = '39705';
update `creature_template` set `difficulty_entry_1` = '48715' WHERE entry = '39731';
update `creature_template` set `difficulty_entry_1` = '48776' WHERE entry = '39732';
update `creature_template` set `difficulty_entry_1` = '48902' WHERE entry = '39788';
update `creature_template` set `difficulty_entry_1` = '48822' WHERE entry = '40484';
update `creature_template` set `difficulty_entry_1` = '49079' WHERE entry = '40586';
update `creature_template` set `difficulty_entry_1` = '49064' WHERE entry = '40765';
update `creature_template` set `difficulty_entry_1` = '49082' WHERE entry = '40788';
update `creature_template` set `difficulty_entry_1` = '49072' WHERE entry = '40825';
update `creature_template` set `difficulty_entry_1` = '49654' WHERE entry = '42188';
update `creature_template` set `difficulty_entry_1` = '49624' WHERE entry = '42333';
update `creature_template` set `difficulty_entry_1` = '49538' WHERE entry = '43214';
update `creature_template` set `difficulty_entry_1` = '49642' WHERE entry = '43438';
update `creature_template` set `difficulty_entry_1` = '48951' WHERE entry = '43612';
update `creature_template` set `difficulty_entry_1` = '49043' WHERE entry = '43614';
update `creature_template` set `difficulty_entry_1` = '43874' WHERE entry = '43873';
update `creature_template` set `difficulty_entry_1` = '43876' WHERE entry = '43875';
update `creature_template` set `difficulty_entry_1` = '43879' WHERE entry = '43878';
update `creature_template` set `difficulty_entry_1` = '48932' WHERE entry = '44577';
update `creature_template` set `difficulty_entry_1` = '51088' WHERE entry = '44819';

-- Set Reward
DELETE FROM `creature_onkill_reward` WHERE `CurrencyId1` = '395';
INSERT INTO `creature_onkill_reward` VALUES 
(48815, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48710, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39699, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(39706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48776, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49064, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49654, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(49043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(43874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(43876, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(43879, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(48932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(51088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 7000, 0, 0),
(32313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36086, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36083, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(35517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(35518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(35490, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36091, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36090, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36089, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(36084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0),
(37629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 395, 0, 0, 1600, 0, 0);

UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30510';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30529';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30530';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30532';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30540';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30748';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30774';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30788';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30807';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '30810';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31211';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31212';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31215';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31217';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31349';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31350';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31360';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31362';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31365';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31368';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31370';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31381';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31384';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31386';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31456';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31464';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31465';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31469';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31506';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31507';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31508';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31509';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31510';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31511';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31512';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31533';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31536';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31537';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31538';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31558';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31559';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31560';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31561';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31611';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31612';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31656';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31673';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '31679';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '36498';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '36938';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '37613';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '37627';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '37677';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '38599';
UPDATE `creature_onkill_reward` SET `CurrencyId1` = '395', `CurrencyCount1` = '1600' WHERE `creature_id` = '38603';