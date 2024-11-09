SELECT id_tipo_produto, ROUND(AVG(preco), 2)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

SELECT p.id_tipo_produto,
        tp.nm_tipo_produto,
        ROUND(AVG(p.preco), 2) "Média Preço"
FROM tb_produtos p
LEFT OUTER JOIN tb_tipos_produtos tp ON(p.id_tipo_produto = tp.id_tipo_produto)
GROUP BY p.id_tipo_produto, tp.nm_tipo_produto
ORDER BY p.id_tipo_produto;

SELECT id_tipo_produto, VARIANCE(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

SELECT VARIANCE(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY VARIANCE(preco);

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos;
//ORA-00937: não é uma função de grupo de grupo simples

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE AVG(preco) > 20.00
GROUP BY id_tipo_produto;

//ORA-00934: a função de grupo não é permitida aqui

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
HAVING AVG(preco) > 20.00;

CREATE TABLE tb_pessoas(
nm_pessoa   VARCHAR2(60)
);

INSERT INTO tb_pessoas
VALUES
('Eduardo');

INSERT INTO tb_pessoas
VALUES
('Rafael');

INSERT INTO tb_pessoas
VALUES
('Michelle');

INSERT INTO tb_pessoas
VALUES
('Pedro');

SELECT *
FROM tb_pessoas;

SELECT nm_pessoa
FROM tb_pessoas
GROUP BY nm_pessoa
HAVING COUNT(1) > 1;

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.00
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.00
GROUP BY id_tipo_produto
HAVING AVG(preco) > 13.00
ORDER BY id_tipo_produto;

INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (7, 'Steve', 'Purple', DATE '1972-10-25', '800-555-1215', 1);

SELECT *
FROM tb_clientes
ORDER BY id_cliente;

ROLLBACK;

SELECT id_cliente "humpty", TO_CHAR(dt_nascimento, 'MONTH DD, YYYY') "dumpty"
FROM tb_clientes;

SELECT TO_CHAR(SYSDATE, 'MONTH DD, YYYY, HH24:MI:SS')
FROM dual;

SELECT TO_CHAR(TO_DATE('05-FEV-1968'), 'MONTH DD, YYYY')
FROM dual;

SELECT TO_DATE('04-JUL-2013'), TO_DATE('04-JUL-13')
FROM dual;

SELECT TO_DATE('Jul 04, 2013', 'MONTH DD, YYYY')
FROM dual;

ALTER SESSION SET NLS_DATE_FORMAT = 'Mon/dd/yyyy';

SELECT TO_DATE('7.4.13', 'MM.DD.YY')
FROM dual;

INSERT INTO tb_clientes(id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES(10, 'Nome', 'Sobrenome', TO_DATE('jul 04, 2013 19:32:36', 'MONTH DD, YYYY HH24:MI:SS'), '800-555-1215', 1);

SELECT *
FROM tb_clientes;

SELECT id_cliente, TO_CHAR(dt_nascimento, 'DD-MON-YYY HH24:MI:SS')
FROM tb_clientes
ORDER BY id_cliente;

ROLLBACK;
