SELECT TO_CHAR(TO_DATE('Jul 04, 2013 19:32:36', 'MONTH DD, YYYY HH24:MI:SS'), 'HH24:MI:SS')
FROM dual;

SELECT *
FROM nls_session_parameters;

ALTER SESSION SET NLS_DATE_FORMAT = 'Mon/dd/yyyy';

SELECT 
    TO_CHAR(TO_DATE('Jul 04, 15', 'MONTH DD, YY'), 'MONTH DD, YYYY'),
    TO_CHAR(TO_DATE('Jul 04, 75', 'MONTH DD, YY'), 'MONTH DD, YYYY')
FROM dual;

SELECT 
    TO_CHAR(TO_DATE('Jul 04, 15', 'MONTH DD, RR'), 'MONTH DD, YYYY'),
    TO_CHAR(TO_DATE('Jul 04, 75', 'MONTH DD, RR'), 'MONTH DD, YYYY')
FROM dual;

SELECT ADD_MONTHS('Jul 01, 2013', 13)
FROM dual;

SELECT ADD_MONTHS(SYSDATE, 2)
FROM dual;

SELECT ADD_MONTHS('Jul 01, 2013', -13)
FROM dual;

SELECT ADD_MONTHS(SYSDATE, -13)
FROM dual;

SELECT LAST_DAY('Jul 01, 2013')
FROM dual;

SELECT LAST_DAY(SYSDATE)
FROM dual;

SELECT MONTHS_BETWEEN('Jul 01, 2013', 'Mai 01, 2011')
FROM dual;

SELECT NEXT_DAY('Jul 03, 2013', 1)
FROM dual;

SELECT NEXT_DAY(SYSDATE, 1)
FROM dual;

SELECT ROUND(TO_DATE('Jul 03, 2023'), 'YYYY')
FROM dual;

SELECT ROUND(TO_DATE('Mai 25, 2023'), 'MM')
FROM dual;

SELECT TO_CHAR
    (ROUND
        (TO_DATE('Jul 03, 2023 19:45:26', 'MONTH DD, YYYY HH24:MI:SS'),
            'HH24'),
            'MONTH DD, YYYY HH24:MI:SS')
FROM dual;

SELECT SYSDATE
FROM dual;

SELECT
    EXTRACT(YEAR FROM TO_DATE('Jul 03, 2023 19:56:26', 'MONTH DD, YYYY HH24:MI:SS')) AS YEAR,
    EXTRACT(MONTH FROM TO_DATE('Jul 03, 2023 19:56:26', 'MONTH DD, YYYY HH24:MI:SS')) AS MONTH,
    EXTRACT(DAY FROM TO_DATE('Jul 03, 2023 19:56:26', 'MONTH DD, YYYY HH24:MI:SS')) AS DAY
FROM dual;

SELECT
    EXTRACT(HOUR FROM TO_TIMESTAMP('Jul 03, 2023 19:56:26', 'MONTH DD, YYYY HH24:MI:SS')) AS HORA,
    EXTRACT(MINUTE FROM TO_TIMESTAMP('Jul 03, 2023 19:56:26', 'MONTH DD, YYYY HH24:MI:SS')) AS MINUTO,
    EXTRACT(SECOND FROM TO_TIMESTAMP('Jul 03, 2023 19:56:26', 'MONTH DD, YYYY HH24:MI:SS')) AS SEGUNDO
FROM dual;

SELECT *
FROM tb_promocao;

SELECT
    NUMTODSINTERVAL(1.5, 'DAY'),
    NUMTODSINTERVAL(3.25,'HOUR'),
    NUMTODSINTERVAL(5,  'MINUTE'),
    NUMTODSINTERVAL(10.12345678, 'SECOND')
FROM dual;

SELECT
    NUMTOYMINTERVAL(1.5, 'YEAR'),
    NUMTOYMINTERVAL(3.25, 'MONTH')
FROM dual;

SELECT nome, sobrenome
FROM tb_clientes
WHERE id_cliente = (SELECT id_cliente
                    FROM tb_clientes
                    WHERE sobrenome = 'Blue');
                    
//pergunta da prova qual dia da semana voce nasceu passando a data como parametro

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE preco > (SELECT AVG(preco)
                FROM tb_produtos);
                




