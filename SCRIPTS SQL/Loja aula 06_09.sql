// exercicio 1, realizar 100000 inserções em uma tabela e depois deletando todas com o truncate, que retorna uma tabela vazia logo em seguida
CREATE TABLE tb_teste (
    id INTEGER,
    valor VARCHAR2(100)
);

BEGIN
    
    FOR v_loop IN 1.. 100000 LOOP
        INSERT INTO tb_teste(ID, valor)
        VALUES (v_loop, 'DBA_' || v_loop);
    END LOOP;
    
END;

SELECT *
FROM tb_teste
ORDER BY 1 DESC;

TRUNCATE TABLE tb_teste;

// exercicio 2, criando um procedure de inserção, alteração e deleção

CREATE TABLE tb_cliente_teste(
    id_cliente  INTEGER,
    ds_cliente  VARCHAR2(40),
    nm_cliente  VARCHAR2(40),
    valor   NUMERIC,
    fg_ativo    INTEGER,
    PRIMARY KEY(id_cliente)
);


