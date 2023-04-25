DELIMITER $$
DROP PROCEDURE IF EXISTS altaUsuari$$
CREATE PROCEDURE altaUsuari(in username varchar(20))
Begin
declare id int;
use biblioteca;
set @id = (select sum((select max(id_aut) from autors)+1));
insert into autors (id_aut, nom_aut, DNAIX_AUT,FK_NACIONALITAT, IMG_AUT) values (@id, username, null,null,null);
End$$