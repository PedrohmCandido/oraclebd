CREATE OR REPLACE PROCEDURE get_cliente(
                    p_id_cliente IN tb_clientes.id_cliente%TYPE)
AS
v_nome        tb_clientes.nome%TYPE;
v_sobrenome     tb_clientes.sobrenome%TYPE;
v_controle  INTEGER;

BEGIN
  SELECT COUNT(*) INTO v_controle
  FROM tb_clientes
  WHERE id_cliente = p_id_cliente;
  
IF (v_controle = 1) THEN
    SELECT nome, sobrenome INTO v_nome, v_sobrenome
    FROM tb_clientes
    WHERE id_cliente = p_id_cliente;
    
    DBMS_OUTPUT.PUT_LINE('Cliente localizado: ' || v_nome || ' ' || v_sobrenome);
ELSE
    DBMS_OUTPUT.PUT_LINE('Cliente NÃO localizado');
END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro');
END get_cliente;        
  
CALL get_cliente(3);  

CREATE TABLE tb_promocao (
  id_promocao        INTEGER CONSTRAINT pk_promocao PRIMARY KEY,
  nome               VARCHAR2(30) NOT NULL,
  duracao            INTERVAL DAY(3) TO SECOND (4)
);

INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(1, '10% off Z Files', INTERVAL '3' DAY);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(2, '20% off Pop 3', INTERVAL '2' HOUR);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(3, '30% off Modern Science', INTERVAL '25' MINUTE);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(4, '20% off Tank War', INTERVAL '45' SECOND);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(5, '10% off Chemistry', INTERVAL '3 2:25' DAY TO MINUTE);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(6, '20% off Creative Yell', INTERVAL '3 2:25:45' DAY TO SECOND);
INSERT INTO tb_promocao (id_promocao, nome, duracao)
VALUES 
(7, '15% off My Front Line', INTERVAL '123 2:25:45.12' DAY(3) TO SECOND(2));
COMMIT;

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (5, 2, 'Rob', 'Green', 'Sales Person', 400000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (6, 4, 'Jane', 'Brown', 'Support Person', 450000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (7, 4, 'John', 'Grey', 'Support Manager', 300000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo) 
VALUES (8, 7, 'Jean', 'Blue', 'Support Person', 290000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (9, 6, 'Henry', 'Heyson', 'Support Person', 300000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (10, 1, 'Kevin', 'Black', 'Ops Manager', 100000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (11, 10, 'Keith', 'Long', 'Ops Person', 500000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (12, 10, 'Frank', 'Howard', 'Ops Person', 450000, 1);

INSERT INTO tb_funcionarios (id_funcionario, id_gerente, nome, sobrenome, cargo, salario, fg_ativo)  
VALUES (13, 10, 'Doreen', 'Penn', 'Ops Person', 470000, 1);

-- commit the transaction
COMMIT;

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (6, 2, 'Z Files', 'Series on mysterious activities', 49.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (7, 2, '2412: The Return', 'Aliens return', 14.95, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (8, 3, 'Space Force 9', 'Adventures of heroes', 13.49, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (9, 3, 'From Another Planet', 'Alien from another planet lands on Earth', 12.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (10, 4, 'Classical Music', 'The best classical music', 10.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (11, 4, 'Pop 3', 'The best popular music', 15.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (12, 4, 'Creative Yell', 'Debut album', 14.99, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo) 
VALUES (13, NULL, 'My Front Line', 'Their greatest hits', 13.49, 1);

-- commit the transaction
COMMIT;

SELECT id_cliente, nome, sobrenome, dt_nascimento, telefone
    FROM  tb_clientes;
    
SELECT *
    FROM tb_clientes
    WHERE id_cliente = 2;
    
SELECT ROWID, id_cliente
FROM tb_clientes;

DESCRIBE tb_clientes;

SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes;

SELECT ROWNUM, id_cliente, nome, sobrenome
FROM tb_clientes
WHERE id_cliente >=4 and id_cliente <=6;

SELECT 2 * 6
FROM dual;

SELECT 10 * (12 / 3-1)
FROM dual;

SELECT TO_DATE('22/JUN/2014') + 2
FROM dual;