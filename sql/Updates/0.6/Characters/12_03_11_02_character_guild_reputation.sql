DROP TABLE IF EXISTS `character_guild_reputation`;
CREATE TABLE `character_guild_reputation` (
 `guid` int(10) unsigned NOT NULL,
 `guildid` int(10) unsigned NOT NULL COMMENT 'Guild Identificator',
 `disband_time` int(10) unsigned NOT NULL DEFAULT '0',
 `weekly_rep` bigint(20) NOT NULL DEFAULT '0',
 UNIQUE KEY `guid_key` (`guid`),
 KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Characters Guild Reputation System';