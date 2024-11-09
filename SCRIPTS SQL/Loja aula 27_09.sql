SELECT AVG(preco)
FROM tb_produtos;

SELECT AVG(preco + 2)
FROM tb_produtos;

SELECT AVG(DISTINCT preco)
FROM tb_produtos;

SELECT COUNT(id_produto)
FROM tb_produtos;

SELECT COUNT(ROWID)
FROM tb_produtos;

SELECT COUNT(1)
FROM tb_produtos;

SELECT nm_produto, preco
FROM tb_produtos;
WHERE preco = (SELECT MAX(preco) FROM tb_produtos);

SELECT MAX(nm_produto), MIN(nm_produto)
FROM tb_produtos;

SELECT MAX(dt_nascimento), MIN(dt_nascimento)
FROM tb_clientes;
//MAX(data) -> data mais recente, MIN(data) - data mais antiga

SELECT STDDEV(preco)
FROM tb_produtos;

SELECT SUM(preco)
FROM tb_produtos;

SELECT VARIANCE(preco)
FROM tb_produtos;

SELECT id_tipo_produto
FROM tb_produtos
GROUP BY id_tipo_produto;

SELECT id_produto, id_cliente
FROM tb_compras
GROUP BY id_produto, id_cliente;

SELECT id_tipo_produto, COUNT(ROWID)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;
