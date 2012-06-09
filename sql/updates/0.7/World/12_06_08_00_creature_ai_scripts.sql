
-- terrible hack-fix to avoid erroneus Arcane Shot cast from many NPC in the world (spell ID 71116)
UPDATE creature_ai_scripts SET action1_param1=16877 WHERE action1_type=11 AND action1_param1=71116 AND creature_id NOT IN (6144, 37144, 37146);