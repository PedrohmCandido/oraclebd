INSERT INTO tb_clientes (id_cliente,
                        nome,
                        sobrenome,
                        dt_nascimento,
                        telefone,
                        fg_ativo)
VALUES
(7, 'Joaquim', 'Silva', '26-FEV-1977', '800-666-2522', 1);

INSERT INTO tb_clientes
VALUES (8, 'Jane', 'Green', '01-JAN-1970', '800-5559999', 1);

INSERT INTO tb_clientes
VALUES (9, 'Sophie', 'White', NULL, NULL, 1);

SELECT *
FROM tb_clientes;

INSERT INTO tb_clientes
VALUES (10, 'Kyle','O''Malley', NULL, NULL, 1);

INSERT INTO tb_produtos (id_produto,
                        id_tipo_produto,
                        nm_produto,
                        ds_produto,
                        preco,
                        fg_ativo
)
VALUES
(14, 1, 'The "Great" Gatsby', NULL, 12.99, 1);

INSERT INTO tb_clientes (id_cliente,
                        nome,
                        sobrenome)
SELECT 11, nome, sobrenome
FROM tb_clientes
WHERE id_cliente = 1;

SELECT *
FROM tb_clientes;

UPDATE tb_clientes
SET sobrenome = 'Orange'
WHERE id_cliente= 2;

UPDATE tb_produtos
    SET
    preco = preco * 1.20,
    nm_produto = LOWER(nm_produto)
WHERE preco > 20.00;


SET SERVEROUTPUT ON;

DECLARE media_preco_produto NUMBER;

BEGIN  
    UPDATE tb_produtos
    SET preco = preco * 0.75
    RETURNING AVG(preco) INTO media_preco_produto;

DBMS_OUTPUT.PUT_LINE('Vlor da variável '  ||  media_preco_produto);
END;

DELETE
FROM tb_clientes
WHERE id_cliente = 10;

SELECT *
FROM tb_clientes;

ROLLBACK;

INSERT INTO tb_clientes (id_cliente,
                        nome,
                        sobrenome,
                        dt_nascimento, telefone,
                        fg_ativo)
VALUES
(1,'Jason', 'Price', '01-JAN-60', '800-555-1211', 1);

// ORA-00001: restrição exclusiva (LOJA.PK_TB_CLIENTES_ID_CLIENTE) violada na tabela LOJA.TB_CLIENTES colunas (ID_CLIENTE)

UPDATE tb_clientes
SET id_cliente = 1
WHERE id_cliente = 2;

//ORA-00001: restrição exclusiva (LOJA.PK_TB_CLIENTES_ID_CLIENTE) violada na tabela LOJA.TB_CLIENTES colunas (ID_CLIENTE)

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto,
                        ds_produto,
                        preco,
                        fg_ativo)
VALUES
(15, 6, 'Teste', 'Teste', null, 1);

//ORA-02291: restrição de integridade (LOJA.FK_TB_PRODUTOS_ID_TIPO_PRODUTO) violada - chave mãe não localizada

UPDATE tb_produtos
SET id_tipo_produto = 6
WHERE id_tipo_produto = 1;

//ORA-02291: restrição de integridade (LOJA.FK_TB_PRODUTOS_ID_TIPO_PRODUTO) violada - chave mãe não localizada

DELETE
FROM tb_tipos_produtos
WHERE id_tipo_produto = 1;

//ORA-02292: restrição de integridade (LOJA.SYS_C0013453) violada - registro filho localizado

CREATE TABLE tb_status_encomenda (
id_status_encomenda     INTEGER,
status                  VARCHAR2(100) DEFAULT 'Encomenda
                                    disponibilizada' NOT NULL,
ultima_modificacao      DATE DEFAULT SYSDATE,
PRIMARY KEY (id_status_encomenda)
);

INSERT INTO tb_status_encomenda(id_status_encomenda)
VALUES(1);

INSERT INTO tb_status_encomenda(id_status_encomenda,
                                status,
                                ultima_modificacao)
VALUES(2, 'Encomenda enviada', '01-MAI-2013');

SELECT *
FROM tb_status_encomenda;

UPDATE tb_status_encomenda
SET status = DEFAULT
WHERE id_status_encomenda = 2;

MERGE INTO tb_produtos p
USING tb_produtos_alterados pa ON (p.id_produto = pa.id_produto)
WHEN MATCHED THEN
 UPDATE
SET
 p.id_tipo_produto = pa.id_tipo_produto,
 p.nm_produto = pa.nm_produto,
 p.ds_produto = pa.ds_produto,
 p.preco = pa.preco,
 p.fg_ativo = pa.fg_ativo

WHEN NOT MATCHED THEN
    INSERT (
    p.id_produto, p.id_tipo_produto, p.nm_produto,
    p.ds_produto, p.preco, p.fg_ativo)
    VALUES (
    pa.id_produto, pa.id_tipo_produto, pa.nm_produto,
    pa.ds_produto, pa.preco, pa.fg_ativo);
    
    

CREATE TABLE tb_produtos_alterados(
id_produto          INTEGER,
id_tipo_produto     INTEGER,
nm_produto          VARCHAR2(30) NOT NULL,
ds_produto          VARCHAR2(50),
preco               NUMBER(5, 2),
fg_ativo            INTEGER,
PRIMARY KEY (id_produto),
FOREIGN KEY (id_tipo_produto) REFERENCES tb_tipos_produtos(id_tipo_produto)
);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(1, 1, 'Modern Science',40, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(2, 1, 'New Chemistry',35, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(3, 1, 'Super Nova',25.99, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(13, 2, 'Lunar Landing',15.99, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(14, 2, 'Submarine',15.99, 1);

INSERT INTO tb_produtos_alterados(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES 
(15, 2, 'Airplane',15.99, 1);

SELECT id_produto, id_tipo_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto IN (1, 2, 3, 13, 14, 15);


