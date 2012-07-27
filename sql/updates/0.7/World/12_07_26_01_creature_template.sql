-- Siamat

-- Blizzlike stats of Siamat (Normal mode)
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `minlevel` = '87', `maxlevel` = '87', `Health_Mod` = '34.19', `exp` = '3', `AIName` = '', `dmg_multiplier` = '10', `difficulty_entry_1` = '51088', `ScriptName` = 'boss_siamat' WHERE `entry` = 44819;

-- Blizzlike stats of Siamat (Heroic mode)
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1200', `maxdmg` = '1300', `dmg_multiplier` = '18', `minlevel` = '87', `maxlevel` = '87', `Health_Mod` = '41.03', `exp` = '3', `lootid` = '51088', `flags_extra` = '1' WHERE `entry` = 51088;

-- Blizzlike stats of Siamat Servant (Normal and heroic mode)
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1000', `maxdmg` = '1300', `dmg_multiplier` = '6', `minlevel` = '85', `maxlevel` = '85', `Health_Mod` = '5.28', `exp` = '3', `difficulty_entry_1` = '49256' WHERE `entry` = 45269;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1000', `maxdmg` = '1300', `dmg_multiplier` = '12', `minlevel` = '85', `maxlevel` = '85', `Health_Mod` = '7.92', `exp` = '3' WHERE `entry` = 49256;

-- Blizzlike stats of Siamat Minion (Normal and heroic mode)
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1000', `maxdmg` = '1300', `dmg_multiplier` = '4', `minlevel` = '85', `maxlevel` = '85', `Health_Mod` = '1.82', `exp` = '3', `difficulty_entry_1` = '49260' WHERE `entry` = 44704;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '1000', `maxdmg` = '1300', `dmg_multiplier` = '8', `minlevel` = '85', `maxlevel` = '85', `Health_Mod` = '3.65', `exp` = '3' WHERE `entry` = 49260;

-- Siamat Servant and Minion scriptnames
UPDATE `creature_template` SET `ScriptName` = 'mob_siamat_servant' WHERE `entry` = 45269;
UPDATE `creature_template` SET `ScriptName` = 'mob_siamat_minion' WHERE `entry` = 44704;

-- Siamat Yells
REPLACE INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc6`, `content_loc7`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(44819, -1812020, 'I. AM. UNLEASHED!', 'SOY. LIBRE.', 'SOY. LIBRE.', 20231, 1, 0, 0, 'Intro1'),
(44819, -1812021, 'Winds of the south, rise and come to your masters aid!', '¡Vientos del sur, alzaos y acudid en ayuda de vuestro amo!', '¡Vientos del sur, vengan en ayuda de su amo!', 20227, 1, 0, 0, 'Engage'),
(44819, -1812022, 'Nothing more than dust in the wind.', 'Solo polvo en el viento.', 'Sólo son polvo en el viento.', 20232, 1, 0, 0, 'Kill'),
(44819, -1812023, 'The sky... Beckons...', 'El cielo... llama...', 'El cielo... llama...', 20226, 1, 0, 0, 'Death'),
(44819, -1812024, 'Cower before the tempest storm!', '¡Temblad ante la tormenta tempestuosa!', '¡Témanle a la tempestad!', 20228, 1, 0, 0, 'Death');