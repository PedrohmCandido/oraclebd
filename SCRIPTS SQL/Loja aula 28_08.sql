SELECT nome
FROM tb_promocao
WHERE nome LIKE '%*%%' ESCAPE '*';

SELECT *
FROM tb_clientes
WHERE id_cliente IN (2, 3, 4);

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5, NULL); -- não retorna nenhuma linha, pois um valor nulo esta incluido a lista

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5, NVL(NULL, 0));

SELECT *
FROM tb_clientes
WHERE id_cliente BETWEEN 1 AND 3;

select *
from TB_CLIENTES 
WHERE id_clientes NOT BETWEEN 1 AND 3;

SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/70'AND 
        id_cliente > 3;
        
SELECT * 
FROM tb_clientes 
WHERE dt_nascimento > '01/JAN/70' OR
            id_cliente > 3;
            
SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/70' OR
        id_cliente< 2 AND
        telefone LIKE '%1211';
        
SELECT *
FROM tb_clientes
ORDER BY sobrenome DESC;

SELECT *
FROM tb_clientes
ORDER BY nome ASC, sobrenome DESC;

UPDATE tb_clientes SET FG_ATIVO = 1 WHERE id_cliente = 3;

SELECT id_cliente, nome, sobrenome
FROM tb_clientes
ORDER BY 1;

SELECT nm_produto, id_tipo_produto
FROM tb_produtos
WHERE id_produto = 3;

SELECT *
FROM tb_produtos;

SELECT tb_produtos.nm_produto,
        tb_tipos_produtos.nm_tipo_produto
FROM tb_produtos, tb_tipos_produtos
WHERE tb_produtos.id_tipo_produto = tb_tipos_produtos.id_tipo_produto
AND tb_produtos.id_produto = 3;

SELECT tb_produtos.nm_produto,
        tb_tipos_produtos.nm_tipo_produto
FROM tb_produtos, tb_tipos_produtos
WHERE tb_produtos.id_tipo_produto = tb_tipos_produtos.id_tipo_produto;

SELECT p.nm_produto,
        b.nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos b
WHERE p.id_tipo_produto = b.id_tipo_produto;