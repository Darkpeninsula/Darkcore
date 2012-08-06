-- Fix spawnMask of the Siamat Platform, now will appear on heroic mode too
UPDATE `gameobject` SET `spawnMask` = '3' WHERE `id` = 206667;