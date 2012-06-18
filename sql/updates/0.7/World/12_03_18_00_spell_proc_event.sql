
-- Add proc event for Critical Mass (3 ranks)

DELETE FROM spell_proc_event WHERE `entry` IN (11095, 12872, 12873);

INSERT INTO spell_proc_event VALUES
(11095, 0, 3, 4194320, 0, 0, 0, 0, 0, 0, 0), -- (Rk 1)
(12872, 0, 3, 4194320, 0, 0, 0, 0, 0, 0, 0), -- (Rk 2)
(12873, 0, 3, 4194320, 0, 0, 0, 0, 0, 0, 0); -- (Rk 3)