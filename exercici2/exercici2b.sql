DELIMITER $$
DROP PROCEDURE IF EXISTS ex2b$$
CREATE PROCEDURE ex2b(in codiLlibre int, out par1 int, out par2 int)
Begin
use biblioteca;
select count(*) into par1 from lli_aut where fk_idllib = codiLlibre;
select count(*) into par2 from exemplars where fk_idllib = codiLlibre;
End$$