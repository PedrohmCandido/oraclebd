SELECT *
FROM user_tab_privs_recd;

SELECT *
FROM user_col_privs_recd;

SELECT *
FROM loja.tb_clientes;

SELECT *
FROM loja.tb_compras;

//ORA-00942: a tabela ou view  "LOJA"."TB_COMPRAS" não existe

CREATE SYNONYM clientes FOR loja.tb_clientes;

SELECT *
FROM clientes;