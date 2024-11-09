INSERT INTO tb_clientes
VALUES
(12, 'Geraldo', 'Henrique', '31-JUL-1977', '800-112233', 1);

COMMIT;

UPDATE tb_clientes
SET nome = 'José'
WHERE id_cliente = 1;

SELECT *
FROM tb_clientes
ORDER BY 1;

ROLLBACK;

SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4,6);

// original 4 -> 13,95
// original 6 -> 49,99

UPDATE tb_produtos
SET preco = preco * 1.20
WHERE id_produto = 4;
COMMIT;

SAVEPOINT save1;

//Todas as instruções DML executadas posteriormente podem ser revertidas para o savepoint e a alteração deita noproduto de n° 4 será mantida


UPDATE tb_produtos
SET preco = preco * 1.30
WHERE id_produto = 6;

SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4,6);

ROLLBACK TO SAVEPOINT save1;

SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4,6);

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto <= 5;

//1 -> 19,95
//2 -> 30
//3 -> 25,99
//4 -> 16,74

UPDATE tb_produtos
SET preco = preco * 0.75
WHERE id_produto <= 5;

COMMIT;

SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto <= 5;

//redução
//1 -> 14,96
//2 -> 22,5
//3 -> 19,49
//4 -> 12,56

EXECUTE DBMS_FLASHBACK.ENABLE_AT_TIME(SYSDATE - 10/1440);

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto <= 5;

EXECUTE DBMS_FLASHBACK.DISABLE();

SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto <= 5;

VARIABLE scn_atual NUMBER;

EXECUTE :scn_atual := DBMS_FLASHBACK.GET_SYSTEM_CHANGE_NUMBER();

PRINT scn_atual;

INSERT INTO tb_produtos (id_produto,
                            id_tipo_produto,
                            nm_produto,
                            ds_produto,
                            preco,
                            fg_ativo)
VALUES
(16, 1, 'Física', 'Livro sobre física', 39.95, 1);

COMMIT;

EXECUTE DBMS_FLASHBACK.ENABLE_AT_SYSTEM_CHANGE_NUMBER(:scn_atual);

SELECT *
FROM tb_produtos
WHERE id_produto = 16;

EXECUTE DBMS_FLASHBACK.DISABLE();

DROP TABLE tb_teste;

CREATE TABLE tb_teste(
id      INTEGER,
valor   VARCHAR2(100)
);

BEGIN

    FOR v_loop IN 1..100 LOOP
        INSERT INTO tb_teste (id, valor)
        VALUES (v_loop, 'DBA_' || v_loop);
    END LOOP;
END;

COMMIT;

SELECT *
FROM tb_teste;

DROP TABLE tb_teste;

FLASHBACK TABLE tb_teste TO BEFORE DROP;

