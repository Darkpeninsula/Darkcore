CREATE TABLE `character_cp_weekcap` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `source` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `maxWeekRating` int(11) unsigned NOT NULL DEFAULT '0',
  `weekCap` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;