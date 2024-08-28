SELECT TO_DATE('31/DEZ/2014') - TO_DATE('22/JUN/2014') FROM dual; -- apresenta a diferença de dias corridos entre as duas datas

SELECT nm_produto, preco, preco + 2.00 FROM tb_produtos; -- cria uma nova coluna na consulta onde o valor do preco é acrescido de dois

DESCRIBE dual; -- descreve a tabela dual

SELECT * FROM dual; -- mostra o valor da tabela dual

SELECT preco, preco * 2 DOBRO_PRECO FROM tb_produtos; -- O que vem depois do número converte no apelido da coluna

SELECT preco, preco * 2 AS "Dobro do Preço" FROM tb_produtos; -- mantem a formatação do texto entre aspas

SELECT nome|| ' ' || sobrenome AS "Nome do Cliente" FROM tb_clientes; -- a || serve para concatenar duas colunas

SELECT 'O funcinário ' || nome || ' ' || sobrenome || ' recebe o salário de R$' || salario || ', mas gostaria de receber R$' || salario * 4 
"Salário dos sonhos"
FROM tb_funcionarios;

SELECT * FROM tb_clientes

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE dt_nascimento IS NULL; -- seleciona somente onde o campo data nascimento tem o valor null

SELECT id_cliente, nome, sobrenome, telefone
FROM tb_clientes
WHERE telefone IS NULL;

SELECT id_cliente, nome, sobrenome, NVL(telefone, 'Número do telefone desconhecido') AS Número_Telefone FROM tb_clientes; -- funcao nvl retorna um valor quando encontra NULL em uma coluna

SELECT id_cliente, nome, sobrenome, NVL(dt_nascimento, '22/JUN/2013') AS "Data de Nascimento"
FROM tb_clientes

SELECT nome, LENGTH(nome) "expressao1",
       sobrenome, LENGTH(sobrenome) "expressao2",
       NULLIF(LENGTH(nome), LENGTH(sobrenome)) "resultado"
FROM tb_funcionarios;       -- A função NULLIF retorna null se o que foi passado dentro do parentesis se concretizar, nesse caso era se o cumprimento do nome e do sobrenome tivessem o mesmo numero de letra

SELECT nome, sobrenome,
        COALESCE(TO_CHAR(dt_nascimento), TO_CHAR('data inexistente')) "Exemplo COALESCE"
FROM tb_clientes;

SELECT nome, sobrenome,
        COALESCE (telefone, TO_CHAR('Telefone inexisente')) "Exemplo COALESCE"
FROM tb_clientes;        -- O coalesce funciona que nem a NULLIF porém com vários valores, onde se o primeiro nao for nulo, ele pula para o segundo

SELECT id_cliente
FROM tb_compras; -- vai mostrar id duplicados pois um mesmo cliente fez duas compras

SELECT DISTINCT id_cliente
FROM tb_compras; -- o distinct suprime as duplicatas

SELECT *
FROM tb_clientes
WHERE id_cliente <> 2; -- o <> é o operador de diferente

SELECT id_produto, nm_produto
FROM tb_produtos
WHERE id_produto > 2; -- operador de maior

SELECT ROWNUM id_produto, nm_produto
FROM tb_produtos
WHERE ROWNUM <= 3;

SELECT *
FROM tb_clientes
WHERE id_cliente > ANY (2, 3, 4); -- o any recupera o id_cliente que seja maior que 2, 3, ou 4, qualquer um dos tres, por isso o id 3 e 4 aparece, pois ele é mairo que dois

SELECT *
FROM tb_clientes
WHERE id_cliente > ALL (2, 3, 4); -- o all recupera o id_cliente que seja maior que 2, 3, 4

SELECT *
FROM tb_clientes
WHERE nome LIKE '_o%' -- nome onde a primeira letra é qualquer uma e a segunda é a vogal o

-- o _ corresponde a qualquer caractee
-- a % corresponde a qualquer caractere depois da letra

SELECT *
FROM tb_clientes
WHERE nome LIKE '%a'

SELECT *
FROM tb_clientes
WHERE nome LIKE 'J%'

SELECT *
FROM tb_clientes
WHERE nome LIKE '____'
