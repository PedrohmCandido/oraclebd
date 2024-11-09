SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
UNION ALL
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
UNION
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
INTERSECT
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
MINUS
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
UNION
(SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos
INTERSECT
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_alteracoes_produtos);

SELECT TRANSLATE ('MENSAGEM SECRETA', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','EFGHIJKLMNOPQRSTUVWXYZABCD');

SELECT id_produto,
        TRANSLATE(nm_produto,
'ABCDEFGHIJKLMNOPQRSTUVWXYZAbcdefghijklmnopqrstuvwxyz',
'EFGHIJKLMNOPQRSTUVWXYZABCDefghijklmnopqrstuvwxyzabcd')
FROM tb_produtos;

SELECT TRANSLATE(12345,
                54321,
                67890)
FROM dual;

SELECT DECODE(1, 1, 2, 3)
FROM dual;

SELECT id_produto, disponivel,
                    DECODE(disponivel, 'Y', 'Produto está disponível',
                                                'Produto não está disponível')
FROM tb_ti

SELECT id_produto, id_tipo_produto,
        DECODE(id_tipo_produto,
                1, 'Book',
                2, 'Video',
                3, 'DVD',
                4, 'CD',
                        'Magazine')
FROM tb_produtos;

SELECT id_produto, id_tipo_produto,
                    CASE id_tipo_produto
                        WHEN 1 THEN 'Book'
                        WHEN 2 THEN 'Video'
                        WHEN 3 THEN 'DVD'
                        WHEN 4 THEN 'CD'
                        ELSE 'Magazine'
                        END
FROM tb_produtos;

SELECT id_produto, id_tipo_produto,
                    CASE
                        WHEN id_tipo_produto =  1 THEN 'Book'
                        WHEN id_tipo_produto = 2 THEN 'Video'
                        WHEN id_tipo_produto = 3 THEN 'DVD'
                        WHEN id_tipo_produto = 4 THEN 'CD'
                        ELSE 'Magazine'
                        END
FROM tb_produtos;

SELECT id_produto, preco,
    CASE
            WHEN preco > 15.00 THEN 'Caro1'
            ELSE 'Barato'
        END
FROM tb_produtos;

SELECT id_funcionario, id_gerente, nome, sobrenome
FROM tb_mais_funcionarios
START WITH id_funcionario = 1
CONNECT BY PRIOR id_funcionario = id_gerente
ORDER BY 1;

SELECT LEVEL, id_funcionario, id_gerente, nome, sobrenome
FROM tb_mais_funcionarios
START WITH id_funcionario = 1
CONNECT BY PRIOR id_funcionario = id_gerente
ORDER BY LEVEL;

SELECT id_divisao, SUM(salario)
FROM tb_funcionarios_2
GROUP BY id_divisao
ORDER BY id_divisao;

SELECT id_divisao, SUM(salario)
FROM tb_funcionarios_2
GROUP BY  ROLLUP (id_divisao)
ORDER BY id_divisao;

SELECT id_divisao, id_cargo, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP (id_divisao, id_cargo)
ORDER BY id_divisao, id_cargo;

SELECT id_divisao, id_cargo, SUM(salario)
FROM tb_funcionarios_2
GROUP BY CUBE(id_divisao, id_cargo)
ORDER BY id_divisao, id_cargo;

SELECT
    CASE GROUPING(id_divisao)
        WHEN 1 THEN 'Todas as Divisões'
        ELSE id_divisao
    END AS DIV, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP(id_divisao)
ORDER BY id_divisao;



