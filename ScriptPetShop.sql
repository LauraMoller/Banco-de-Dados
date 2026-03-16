-- criando a tabela especie
CREATE TABLE especie
(cd_especie INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_especie VARCHAR(30) NOT NULL
);

-- criando a tabela categoria
CREATE TABLE categoria
(cd_categoria INTEGER PRIMARY KEY AUTO_INCREMENT,
ds_categoria VARCHAR(50) NOT NULL
);

-- criando a tabela municipio
CREATE TABLE municipio
(cd_municipio INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_municipio VARCHAR(50) NOT NULL,
sg_uf CHAR(2)
);

-- criando a tabela servico
CREATE TABLE servico
(cd_servico INTEGER PRIMARY KEY AUTO_INCREMENT,
ds_servico VARCHAR(50) NOT NULL,
vl_servico DECIMAL (6,2)
);

-- criando a tabela endereco
CREATE TABLE endereco
(cd_endereco INTEGER PRIMARY KEY AUTO_INCREMENT,
ds_logradouro VARCHAR(50),
ds_complemento VARCHAR(50),
nm_bairro VARCHAR(30),
nr_cep CHAR(8),
cd_municipio INTEGER,
CONSTRAINT municipio_fk FOREIGN KEY (cd_municipio) REFERENCES municipio (cd_municipio)
);

-- criando a tabela produto
CREATE TABLE produto
(cd_produto INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_produto VARCHAR(50) NOT NULL,
ds_produto VARCHAR(50),
vl_produto DECIMAL(6,2),
vl_venda DECIMAL(8,2),
qt_estoque INTEGER,
cd_categoria INTEGER,
CONSTRAINT categoria_fk FOREIGN KEY (cd_categoria) REFERENCES categoria(cd_categoria)
);

-- criando a tabela cliente
CREATE TABLE cliente
(cd_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_cleinte VARCHAR(50) NOT NULL, 
nr_telefone VARCHAR(15),
ds_email VARCHAR(50),
dt_nascimento DATE,
cd_endereco INTEGER,
CONSTRAINT endereco_fk FOREIGN KEY (cd_endereco) REFERENCES endereco(cd_endereco)
);

-- criando a tabela raca
CREATE TABLE raca
(cd_raca INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_raca VARCHAR(50) NOT NULL,
cd_especie INTEGER,
CONSTRAINT especie_fk FOREIGN KEY (cd_especie) REFERENCES especie(cd_especie)
);

-- criando a tabela animal
CREATE TABLE animal
(cd_animal INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_animal VARCHAR(50) NOT NULL,
ds_animal VARCHAR(50),
dt_nascimento DATE,
tp_porte CHAR(1),
cd_raca INTEGER,
cd_cliente INTEGER,
CONSTRAINT raca_fk FOREIGN KEY (cd_raca) REFERENCES raca(cd_raca),
CONSTRAINT cleinte_fk FOREIGN KEY (cd_cliente) REFERENCES cliente(cd_cliente)
);

-- criando a tabela nota_fiscal
CREATE TABLE nota_fiscal
(cd_nota_fiscal INTEGER PRIMARY KEY AUTO_INCREMENT,
dt_emissao DATE,
vl_total DECIMAL(8,2),
cd_cliente INTEGER,
CONSTRAINT cliente_fk FOREIGN KEY (cd_cliente) REFERENCES cliente (cd_cliente)
);

-- criando a tabela item_nota_fiscal
CREATE TABLE item_nota_fiscal
(nr_nota_fiscal INTEGER NOT NULL,
cd_produto INTEGER NOT NULL,
qt_produto INTEGER,
vl_produto DECIMAL (8,2),
CONSTRAINT item_nota_fiscal_fk FOREIGN KEY (nr_nota_fiscal) REFERENCES nota_fiscal (cd_nota_fiscal),
CONSTRAINT item_produto_fk FOREIGN KEY (cd_produto) REFERENCES produto(cd_produto), 
CONSTRAINT chave_pk PRIMARY KEY (nr_nota_fiscal, cd_produto)
);

-- criando a tabela prestador_servico
CREATE TABLE prestador_servico
(cd_prestador INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_prestador VARCHAR(50) NOT NULL,
nr_telefone VARCHAR(15),
ds_email VARCHAR(50),
cd_endereco INTEGER,
CONSTRAINT prestador_endereco_fk FOREIGN KEY (cd_endereco) REFERENCES endereco (cd_endereco) 
);

-- criando a tabela servico_prestador
CREATE TABLE servico_prestador
(cd_prestador INTEGER NOT NULL,
cd_servico INTEGER NOT NULL,
CONSTRAINT prestador_serv_fk FOREIGN KEY (cd_prestador) REFERENCES prestador_servico(cd_prestador),
CONSTRAINT servico_prest_fk FOREIGN KEY (cd_servico) REFERENCES servico(cd_servico), 
CONSTRAINT servico_prestador_pk PRIMARY KEY (cd_prestador, cd_servico)
);

-- criando a tabela agendamento
CREATE TABLE agendamento
(nr_agendamento INTEGER PRIMARY KEY AUTO_INCREMENT,
dt_agendamento DATE,
hr_agendamento TIME,
cd_prestador INTEGER,
CONSTRAINT prestador_fk FOREIGN KEY (cd_prestador) REFERENCES prestador_servico(cd_prestador)
);

-- criando a tabela agendamento_servico
CREATE TABLE agendamento_servico
(nr_agendamento INTEGER NOT NULL,
cd_servico INTEGER NOT NULL,
qt_servico INTEGER,
vl_servico DECIMAL (6,2),
CONSTRAINT nr_agendamento_fk FOREIGN KEY (nr_agendamento) REFERENCES agendamento (nr_agendamento),
CONSTRAINT servico_fk FOREIGN KEY (cd_servico) REFERENCES servico (cd_servico),
CONSTRAINT chave_primaria PRIMARY KEY (nr_agendamento, cd_servico)
);
