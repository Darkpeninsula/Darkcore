REVOKE ALL PRIVILEGES ON * . * FROM 'darkcore'@'localhost';

REVOKE ALL PRIVILEGES ON `world` . * FROM 'darkcore'@'localhost';

REVOKE GRANT OPTION ON `world` . * FROM 'darkcore'@'localhost';

REVOKE ALL PRIVILEGES ON `characters` . * FROM 'darkcore'@'localhost';

REVOKE GRANT OPTION ON `characters` . * FROM 'darkcore'@'localhost';

REVOKE ALL PRIVILEGES ON `auth` . * FROM 'darkcore'@'localhost';

REVOKE GRANT OPTION ON `auth` . * FROM 'darkcore'@'localhost';

DROP USER 'darkcore'@'localhost';

DROP DATABASE IF EXISTS `world`;

DROP DATABASE IF EXISTS `characters`;

DROP DATABASE IF EXISTS `auth`;
