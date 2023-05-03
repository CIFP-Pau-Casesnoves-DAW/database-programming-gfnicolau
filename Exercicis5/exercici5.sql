DELIMITER $$
DROP function IF EXISTS nombreAutors$$
CREATE function nombreAutors(codiLlibre int) returns int
deterministic
Begin
return (select count(*) from lli_aut where fk_idllib = codiLlibre);
End$$

DROP function IF EXISTS nombreExemplars$$
CREATE function nombreExemplars(codiLlibre int) returns int
deterministic
Begin
return (select count(*) from exemplars where fk_idllib = codiLlibre);
End$$


DROP procedure IF EXISTS nombreFuncio2b$$
CREATE procedure nombreFuncio2b(in codiLlibre int, out numEx int, out numAut int)
Begin
declare numEx int;
declare numAut int;
set numEx = (select nombreExemplars(codiLlibre));
set numAut = (select nombreAutors(codiLlibre));
End$$
