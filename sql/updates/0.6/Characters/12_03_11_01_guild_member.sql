-- Guild Member Activity Weekly
ALTER TABLE `guild_member` ADD `weekly_xp` bigint(20) NOT NULL DEFAULT '0' AFTER `achievementPoints`;
ALTER TABLE `guild_member` ADD `total_xp` bigint(20) NOT NULL DEFAULT '0' AFTER `weekly_xp`;