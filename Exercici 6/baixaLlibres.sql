alter table exemplars 
add column databaixa date;

alter table exemplars
add column motiubaixa varchar(50);

alter table llibres
add column databaixa date;

DELIMITER $$
DROP function IF EXISTS exemplarsalta$$
CREATE function exemplarsalta(codiLlibre int) returns int
deterministic
Begin
return (select count(*) from exemplars where fk_idllib = codiLlibre && trim(databaixa) != '');
End$$

DROP procedure IF EXISTS baixaExemplar$$
CREATE procedure nombreFuncio2b(in numeroRegistre int, in motiubaixa varchar(50))
Begin
update exemplars set descripciobaixa = motiubaixa where numeroRegistre = exemplars.nreg; 
update exemplars set databaixa = curdate() where numeroRegistre = exemplars.nreg;
if(exemplarsalta((select fk_idllib from exemplars where nreg = numeroRegistre)) = 0)
then 
update llibres set databaixa = curdate() where id_llib = (select fk_idllib from exemplars where nreg = numeroRegistre);
end if;
End$$
