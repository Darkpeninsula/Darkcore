-- Alter GM's NameAnnounce System Message string to prevent mistakes

UPDATE core_string SET content_default="|cffffff00[|c1f40af20GM Message by|r |cffff0000%s|cffffff00]:|r %s|r" WHERE entry=6615;