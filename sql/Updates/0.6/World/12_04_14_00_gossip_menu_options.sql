
-- "Dual talent specialization" cost has been reduced since 4.x.x, from the original 1.000g to the new amount of 10g
UPDATE gossip_menu_option SET box_money=100000 WHERE option_id=18 AND npc_option_npcflag=16;