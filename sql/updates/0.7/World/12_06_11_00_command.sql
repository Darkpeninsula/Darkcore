-- update reload string command name

DELETE FROM command WHERE NAME="reload skyfire_string" OR NAME="reload core_string";
INSERT INTO command VALUES ("reload core_string", 3, "Syntax: .reload core_string\nReload core_string table.");