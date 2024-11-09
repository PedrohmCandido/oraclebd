CREATE USER jean IDENTIFIED BY master;

CREATE USER henrique IDENTIFIED BY 0800
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

GRANT CREATE SESSION TO jean;


CREATE USER fernando IDENTIFIED BY fernando1234;
CREATE USER sonia IDENTIFIED BY sonia1234;
GRANT CREATE SESSION TO fernando, sonia;

ALTER USER jean IDENTIFIED BY senha123alterada;

DROP USER jean;

GRANT CREATE SESSION,
CREATE USER,
CREATE TABLE TO fernando;

GRANT EXECUTE ANY PROCEDURE TO fernando WITH ADMIN OPTION;

GRANT EXECUTE ANY PROCEDURE TO PUBLIC;

REVOKE CREATE TABLE FROM fernando;

// Se voc� revoga um privil�gio qualquer a um usu�rio, e o mesmo passou esse privil�gio para outro usu�rio, o privil�gio desse usu�rio se mant�m

GRANT CREATE SYNONYM TO fernando;

GRANT CREATE PUBLIC SYNONYM TO loja;