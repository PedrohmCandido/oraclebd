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

// Se você revoga um privilégio qualquer a um usuário, e o mesmo passou esse privilégio para outro usuário, o privilégio desse usuário se mantém

GRANT CREATE SYNONYM TO fernando;

GRANT CREATE PUBLIC SYNONYM TO loja;