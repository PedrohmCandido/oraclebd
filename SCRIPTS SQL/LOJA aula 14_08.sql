CREATE TABLE tb_clientes(
    id_cliente INTEGER,
    nome VARCHAR(10) NOT NULL,
    sobrenome VARCHAR(10) NOT NULL,
    dt_nascimento DATE,
    telefone VARCHAR(12),
    fg_ativo INTEGER,
    CONSTRAINT pk_tb_clientes_id_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE tb_tipos_produtos (
    id_tipo_produto INTEGER,
    nm_tipo_produto VARCHAR(10)NOT NULL,
    fg_ativo INTEGER,
    CONSTRAINT pk_tb_tipos_produtos_id_tipo_produto PRIMARY KEY (id_tipo_produto)
);

CREATE TABLE tb_produtos (
    id_produto INTEGER,
    id_tipo_produto INTEGER,
    nm_produto VARCHAR(30) NOT NULL,
    ds_produto VARCHAR(50),
    preco NUMBER(5,2),
    fg_ativo INTEGER,
    CONSTRAINT pk_tb_produtos_id_produto PRIMARY KEY (id_produto),
    CONSTRAINT fk_tb_produtos_id_tipo_produto FOREIGN KEY (id_tipo_produto) REFERENCES tb_tipos_produtos (id_tipo_produto)
);

CREATE TABLE tb_compras (
    id_produto INTEGER,
    id_cliente INTEGER,
    quantidade INTEGER,
    fg_ativo INTEGER,
    CONSTRAINT fk_tb_compras_id_produto FOREIGN KEY(id_produto) REFERENCES tb_produtos (id_produto),
    CONSTRAINT fk_tb_compras_id_cliente FOREIGN KEY (id_cliente) REFERENCES tb_clientes (id_cliente),
    CONSTRAINT pk_tb_compras_id_produto_id_cliente PRIMARY KEY (id_produto, id_cliente)
);

CREATE TABLE tb_funcionarios (
    id_funcionario INTEGER,
    id_gerente INTEGER,
    nome VARCHAR2(10) NOT NULL,
    sobrenome VARCHAR2(10) NOT NULL,
    cargo VARCHAR2(20),
    salario NUMBER(8,2),
    fg_ativo INTEGER,
    CONSTRAINT pk_tb_funcionario_id_func PRIMARY KEY (id_funcionario),
    CONSTRAINT fk_tb_funcionarios_id_gerente FOREIGN KEY (id_gerente) REFERENCES tb_funcionarios (id_funcionario)
)

CREATE TABLE tb_grades_salarios(
    id_salario INTEGER,
    base_salario NUMBER(8,2),
    teto_salario NUMBER(8,2),
    fg_ativo INTEGER,
    CONSTRAINT pk_tb_grades_salarios_id_salario PRIMARY KEY (id_salario)
)

INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo) VALUES (1, 'John', 'Brown', '01/Jan/1965', '800-555-1211', 1); 
INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo) VALUES (2, 'Cynthia', 'Green', '05/Fev/1968', '800-555-1212', 1);
INSERT INTO tb_clientes VALUES (3, 'Steve', 'White', '16/Mar/1965', '800-555-1213', 3)

INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo) VALUES (4, 'Gail', 'Black', '','800-555-1214', 1);
INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo) VALUES (5, 'Doreen', 'Blue', '20/Mai/1970','NULL', 1);
INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo) VALUES (6, 'Fred', 'Brown', '01/Jan/1970','800-555-1215', 1);
COMMIT;
SELECT * FROM tb_clientes

INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo) VALUES (1, 'Book', 1);
INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo) VALUES (2, 'Video', 1);
INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo) VALUES (3, 'DVD', 1);
INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo) VALUES (4, 'CD', 1);
INSERT INTO tb_tipos_produtos (id_tipo_produto, nm_tipo_produto, fg_ativo) VALUES (5, 'MAGAZINE', 1);
COMMIT;

SELECT * from tb_tipos_produtos
