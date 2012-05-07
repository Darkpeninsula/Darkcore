-- Cleanup Karazhan gates (should be one main and one backdoor, not four main and five backdoors -.-')
DELETE FROM gameobject WHERE guid IN (184563, 185073, 185886, 182097, 184300, 184883, 185372);