UPDATE quest_template SET RequiredSkillValue=325 WHERE entry IN (13265, 13268, 13269, 13270, 13272);
UPDATE quest_template SET RequiredSkillValue=325 WHERE entry IN (29067, 29481, 29482);



/*

 ###########################################
 # Pre-made cleanups for chars' spell table#
 ###########################################


-- [197] TAILORING -> Northern Cloth Scavenging (spell 59390)
DELETE FROM character_spell WHERE spell=59390;
DELETE FROM character_queststatus_rewarded WHERE quest IN (13265, 13268, 13269, 13270, 13272);

-- [171] ALCHEMY -> Potion/Elixir/Transmutation Master (spells 28675, 28677, 28672) 
DELETE FROM character_spell WHERE spell IN (28675, 28677, 28672);
DELETE FROM character_queststatus_rewarded WHERE quest IN (29067, 29481, 29482);

-- [182] HERBALISM -> Lifeblood rank (graphical override due to rank mismatch) -- FIXED 

-- FIXME: select * from quest_template where SkillOrClassMask<>0 and RequiredSkillValue=0;  <-- should return 0 rows, need to fix SkillValues.

*/




