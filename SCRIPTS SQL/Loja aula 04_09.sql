SELECT f.nome || ' ' || f.sobrenome || ' trabalha para ' || g.nome
FROM tb_funcionarios f, tb_funcionarios g
WHERE f.id_gerente = g.id_funcionario
ORDER BY f.nome;

SELECT f.nome || ' ' || 'trabalha para ' || NVL(g.sobrenome, ' as acionistas')
FROM tb_funcionarios f, tb_funcionarios g
WHERE f.id_gerente = g.id_funcionario (+)
ORDER BY f.sobrenome DESC;

SELECT p.nm_produto AS PRODUTO, tp.nm_tipo_produto AS TIPO
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp ON p.id_tipo_produto = tp.id_tipo_produto
ORDER BY p.nm_produto;

SELECT f.nome, f.sobrenome, f.cargo, f.salario, gs.id_salario
FROM tb_funcionarios f
INNER JOIN tb_grades_salarios gs ON (f.salario BETWEEN gs.base_salario AND gs.teto_salario)
ORDER BY gs.id_salario;

SELECT p.nm_produto AS PRODUTO, tp.nm_tipo_produto AS TIPO
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING (id_tipo_produto);

SELECT p.nm_produto AS PRODUTO, tp.nm_tipo_produto AS TIPO, id_tipo_produto
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING (id_tipo_produto);

SELECT p.nm_produto AS PRODUTO, tp.nm_tipo_produto AS TIPO, id_tipo_produto
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING (p.id_tipo_produto);

SELECT c.nome, c.sobrenome, p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_clientes c
INNER JOIN tb_compras co USING (id_cliente)
INNER JOIN tb_produtos p USING (id_produto)
INNER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p
LEFT OUTER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p
RIGHT OUTER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

SELECT p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_produtos p
FULL OUTER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

SELECT f.nome || ' ' || f.sobrenome || ' trabalha para ' || g.nome
FROM tb_funcionarios f
INNER JOIN tb_funcionarios g ON (f.id_gerente = g.id_funcionario)
ORDER BY f.nome;

SELECT *
FROM tb_tipos_produtos
CROSS JOIN tb_produtos;

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &v_id_produto;

SELECT nm_produto, &v_coluna
FROM &v_tabela
WHERE &v_coluna = &v_id_produto;

SELECT nm_produto, &&v_coluna
FROM &v_tabela
WHERE &&v_coluna = &v_id_produto;

DEFINE v_id_produto = 7;

SELECT nm_produto, id_produto
FROM tb_produtos
WHERE id_produto = &v_id_produto;

ACCEPT v_id NUMBER FORMAT 99 PROMPT 'Entre com o id';

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto = &v_id;

DEFINE v_id_produto = 7;

SELECT nm_produto, id_produto
FROM tb_produtos
WHERE id_produto = &v_id_produto;

UNDEFINE v_id_produto;

