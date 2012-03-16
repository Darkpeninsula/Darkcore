-- Populate Table character_guild_reputation
INSERT INTO `character_guild_reputation` (`guid`, `guildid`) SELECT `guid`, `guildid` FROM `guild_member`;