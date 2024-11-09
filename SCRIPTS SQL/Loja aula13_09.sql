SELECT REPLACE (nm_produto, 'Science', 'Physics')
FROM tb_produtos
WHERE id_produto = 1; // Troca o primeiro nome pelo segundo em uma string

SELECT sobrenome
FROM tb_clientes
WHERE SOUNDEX(sobrenome)= SONUDEX('whyte'); // seleciona o nome que possui a fonética(som) igual a da passada pelo SOUNDEX

SELECT nm_produto, SUBSTR(nm_produto, 2, 7) // extrai uma porção de uma string, onde o primeiro número é a posição que inicia, e o segundo é quantos caracteres ele pega
FROM tb_produtos
WHERE id_produto < 4;

SELECT nm_produto, UPPER(SUBSTR(nm_produto, 2, 8)) //combinando as funções UPPER (que deixa tudo em maiúsculo) e a SUBSTR
FROM tb_produtos
WHERE id_produto < 4;

SELECT id_produto, preco, preco - 30.00, ABS(preco - 30.00) // retorna o valor absoluto não importando se é positivo ou negativo
FROM tb_produtos
WHERE id_produto < 4;

SELECT CEIL(5.8), CEIL(-5.2) // retorna o menor inteiro maior ou igual a 'x'
FROM dual;

SELECT FLOOR(5.8), FLOOR(-5.6) //retorna o maior inteiro menor ou igual a 'x'
FROM dual;

SELECT MOD(8,3), MOD (8,4) //retorna o resto da divisao de 'x' por 'y'
FROM dual;

SELECT POWER(2,1), POWER(2,3) // retorna o resultado de 'x' elevado à potência de 'y'
FROM dual;

SELECT ROUND(5.75), ROUND(5.75, 1), ROUND(5.75, -1) // retorna o arredondamento de 5,75 com zero, 1 e -1 casa decimal
FROM dual;

SELECT SIGN(-5), SIGN(5), SIGN(0) //retorna -1 se 'x' for negativo, 1 se 'x' for positivo e 0 se 'x' for zero
FROM dual;

SELECT SQRT(25), SQRT(5) // obtém a raiz quadrada de 'x'
FROM dual;

SELECT TRUNC(5.75), TRUNC(5.75,1), TRUNC (5.75, -1) // realiza o truncamento de 5,75 com zero, 1 e -1 casas decimais
FROM dual;

SELECT TO_CHAR(12345.67) // realiza a conversão de um número em um string
FROM dual;

SELECT TO_CHAR (12345.67, '99,999.99') // passando um parâmetro de formatação para o to_char, sendo eles: '.', ',', '0', e '$' os mais famosos
FROM dual;

SELECT TO_CHAR (12345.67, '$99,999.99')
FROM dual;

SELECT TO_CHAR (00.67, 'B9.99') // Parâmetro B: se a parte inteira de um número de ponto fixo for zero, retorna espaços para os zeros
FROM dual;

SELECT TO_CHAR(12345.67, 'C99,999.99') //Parametro C: retorna o símbolo de moeda em uma posição específica
FROM dual;

SELECT TO_CHAR(12345.67, '99999.99EEEE') //Parametro C : notação científica
FROM dual;

SELECT TO_CHAR(0012345.67, 'FM99999.99') //Parametro FM: remove espaço a esquerda e direita
FROM dual;

SELECT TO_CHAR(12345.67, 'L99,999.99') // Parametro L: retorna o çifrão da moeda local
FROM dual;

SELECT TO_CHAR(-12345.67, '99,999.99mi') // Parametro MI: retorna um número negativo com um sinal de menos a direita
FROM dual;

SELECT TO_CHAR(-12345.67, '99,999.99PR')
FROM dual;

SELECT TO_CHAR(2013, 'RN') // Parâmetro RN: retorna em algarismos romanos
FROM dual;

SELECT TO_CHAR(12345.67, 'S99999.99')
FROM dual;

SELECT TO_CHAR(12345.67, 'U99,999.99') // Retorna o simbolo da moeda
FROM dual;

SELECT TO_CHAR(12345.67, '99999V99')
FROM dual;

SELECT id_produto, 'O preço do produto é: ' || TO_CHAR(preco, 'L99.99')
FROM tb_produtos
WHERE id_produto < 5;

SELECT TO_NUMBER('970,13') //converte a string para number
FROM dual;

SELECT TO_NUMBER('970,13') + 25.50
FROM dual;

SELECT //transforma valores não literais em valores literais
    CAST(12345.67 AS VARCHAR(10)),
    CAST('9A4F' AS RAW(2)),
    CAST('01-DEZ-2007' AS DATE),
    CAST(12345.678 AS NUMBER(10,2))
FROM dual;

SELECT
    CAST(preco AS VARCHAR2(10)),
    CAST(preco + 2 AS NUMBER(7,2)),
    CAST (preco AS BINARY_DOUBLE)
FROM tb_produtos
WHERE id_produto = 2;

//expressaões regulares que permitem encontrar um padrão de caracteres em um string

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE REGEXP_LIKE(TO_CHAR(dt_nascimento, 'YYYY'), '196[5-8]$'); -- encontra os anos entre 1965 e 1968

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE REGEXP_LIKE(nome, 'j', 'i'); -- todos os nomes que começam com 'j', o 'i' indica que é insensitive case, nao importando e o J é maiúsculo ou minúsculo

SELECT 
    REGEXP_INSTR('Teste de expressão regular', 'e', 6, 2) AS resultado
FROM dual; -- recupera a posição da segunda letra 'e' a partir da posição 6


