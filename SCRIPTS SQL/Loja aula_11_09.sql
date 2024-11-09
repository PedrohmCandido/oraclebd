CREATE OR REPLACE PROCEDURE manipula_dados (
    p_id_cliente    IN  tb_cliente_teste.id_cliente%TYPE,
    p_descricao     IN tb_cliente_teste.ds_cliente%TYPE,
    p_nome      IN tb_cliente_teste.nm_cliente%TYPE,
    p_valor     IN tb_cliente_teste.valor%TYPE,
    p_fg_ativo  IN tb_cliente_teste.fg_ativo%TYPE,
    p_opcao     IN CHAR)
AS
    v_controle INTEGER;
    
BEGIN

SELECT COUNT (*) INTO v_controle
FROM tb_cliente_teste
WHERE id_cliente = p_id_cliente
AND fg_ativo = 1;



IF (p_opcao = 'I') THEN
    IF(v_controle != 1) THEN
    INSERT INTO tb_cliente_teste(id_cliente, ds_cliente, nm_cliente, valor, fg_ativo)
    VALUES (p_id_cliente, p_descricao, p_nome, p_valor, p_fg_ativo);
    COMMIT;
    dbms_output.put_line('Cliente inserido com sucesso');
    
    ELSE
    dbms_output.put_line('ID do cliente já existe');
    END IF;
END IF;



IF(p_opcao = 'U') THEN
    IF(v_controle = 1) THEN
    UPDATE tb_cliente_teste SET ds_cliente = p_descricao,
                                nm_cliente = p_nome,
                                valor      = p_valor,
                                fg_ativo   = p_fg_ativo
    WHERE id_cliente = p_id_cliente
    AND fg_ativo = 1;
    
    COMMIT;
    dbms_output.put_line('Cliente alterado com sucesso!');
    
    ELSE
    dbms_output.put_line('ID do cliente não existe');
    END IF;
END IF;



IF(p_opcao = 'D') THEN
    IF(v_controle = 1) THEN
    DELETE
    FROM tb_cliente_teste
    WHERE id_cliente = p_id_cliente
    AND fg_ativo = 1;
    
    COMMIT;
    dbms_output.put_line('Cliente excluido com sucesso!');
    
    ELSE 
    dbms_output.put_line ('ID do cliente não existe');
    END IF;
END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
    END manipula_dados;
    
CALL manipula_dados(1, 'Cliente 1', 'Novo Cliente 1', 22, 1, 'I');

SELECT *
FROM tb_cliente_teste;

CALL manipula_dados(2, 'Cliente 2', 'Novo Cliente 2', 99, 1, 'I');


CALL manipula_dados(2, 'Cliente - Alterado hoje', 'alterado', 110, 1, 'U');

CALL manipula_dados(2, NULL, NULL, NULL, NULL, 'D');

SELECT ASCII('P'), ASCII('e'), ASCII('d'), ASCII('r'), ASCII('o');

SELECT CHR(97), CHR(65), CHR(122), CHR(90), CHR(48) ;

SELECT id_produto, INITCAP(ds_produto)
FROM tb_produtos;

SELECT nm_produto, INSTR(nm_produto, 'Science')
FROM tb_produtos
WHERE id_produto = 1;

SELECT nm_produto, INSTR(nm_produto, 'e', 1,2)
FROM tb_produtos
WHERE id_produto = 1;

SELECT nm_produto, LENGTH(nm_produto)
FROM tb_produtos;

SELECT UPPER(nome) Maiusculo, LOWER(sobrenome) Minúsculo
FROM tb_funcionarios;

SELECT RPAD(nm_produto,30,'-'), LPAD(preco, 8, '*+')
FROM  tb_produtos
WHERE id_produto < 4;

SELECT
    LTRIM('  Olá pessoal tudo joia?'),
    RTRIM('Oi tudo bem!abcac', 'abc'),
    TRIM('0' FROM '000Treinamento em Oracle!00000')
FROM dual;

SELECT id_cliente, NVL(telefone, 'Telefone inexistente')
FROM tb_clientes
ORDER BY id_cliente DESC;

SELECT id_cliente, NVL2(telefone, 'Telefone existente', 'Telefone inexistente')
FROM tb_clientes
ORDER BY id_cliente DESC;