-- Criando as tabelas
CREATE TABLE obra
(cd_obra INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_titulo VARCHAR(100) UNIQUE,
ds_edicao VARCHAR(20),
dt_publicacao DATE,
ds_sinopse VARCHAR(255)
); 


CREATE TABLE situacao
(cd_situacao INTEGER PRIMARY KEY AUTO_INCREMENT,
ds_situacao VARCHAR(50)
);


CREATE TABLE categoria
(tp_categoria INTEGER PRIMARY KEY AUTO_INCREMENT,
ds_categoria VARCHAR(30),
nr_exemplares INTEGER
);


CREATE TABLE exemplar
(nr_exemplar INTEGER PRIMARY KEY AUTO_INCREMENT,
cd_obra INTEGER NOT NULL,
cd_situacao INTEGER NOT NULL,
cd_inclusao DATE,
CONSTRAINT cd_obra_ex_fk FOREIGN KEY (cd_obra) REFERENCES obra(cd_obra),
CONSTRAINT cd_situacao_ex_fk FOREIGN KEY (cd_situacao) REFERENCES situacao(cd_situacao)
);


CREATE TABLE usuario
(cd_usuario INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_usuario VARCHAR(50) NOT NULL,
dt_nascimento DATE,
ds_email VARCHAR(100),
ds_senha VARCHAR(100),
tp_categoria INTEGER NOT NULL,
CONSTRAINT tp_categoria_us_fk FOREIGN KEY (tp_categoria) REFERENCES categoria (tp_categoria)
);


CREATE TABLE emprestimo
(nr_emprestimo INTEGER PRIMARY KEY AUTO_INCREMENT,
cd_usuario INTEGER NOT NULL,
dt_emprestimo DATE,
CONSTRAINT cd_usuario_em_fk FOREIGN KEY (cd_usuario) REFERENCES usuario(cd_usuario)
);


CREATE TABLE emprestimo_exemplar
(nr_emprestimo INTEGER NOT NULL,
nr_exemplar INTEGER NOT NULL,
dt_prevista_devolucao DATE,
dt_devolucao DATE,
CONSTRAINT nr_emprestimo_emex_fk FOREIGN KEY (nr_emprestimo) REFERENCES emprestimo(nr_emprestimo),
CONSTRAINT nr_exemplar_emex_fk FOREIGN KEY (nr_exemplar) REFERENCES exemplar(nr_exemplar),
CONSTRAINT PRIMARY KEY (nr_emprestimo, nr_exemplar)
);


-- ----------------------------

-- Criar uma regra que não permita duplicidade de descrição de categoria
ALTER TABLE categoria
ADD CONSTRAINT cat_ds_unique UNIQUE (ds_categoria);

-- ----------------------------

-- Povoando as tabelas

INSERT INTO situacao (ds_situacao) 
VALUES 
('Emprestado'), 
('Disponível'), 
('Não localizado');

INSERT INTO categoria (ds_categoria, nr_exemplares) 
VALUES 
('Estudante', 7), 
('Idoso(a)', 5), 
('Comunidade Geral', 3);

INSERT INTO obra (nm_titulo, ds_edicao, dt_publicacao, ds_sinopse) 
VALUES 
('Livro 1', '1ª Edição', '2015-05-10', 'Sinopse 1'),
('Livro 2', '2ª Edição', '2018-03-20', 'Sinopse 2'),
('Livro 3', '3ª Edição', '1954-07-29', 'Sinopse 3'),
('Livro 4', '4ª Edição', '1899-01-01', 'Sinopse 4'),
('Livro 5', '5ª Edição', '2008-08-01', 'Sinopse 5');

INSERT INTO exemplar (cd_obra, cd_situacao, cd_inclusao) 
VALUES 
(1, 2, '2023-10-01'), 
(1, 2, '2023-10-01'),
(2, 2, '2023-10-05'), 
(2, 2, '2023-10-05'),
(3, 2, '2023-10-10'), 
(3, 2, '2023-10-10'),
(4, 2, '2023-10-15'), 
(4, 2, '2023-10-15'),
(5, 2, '2023-10-20'), 
(5, 2, '2023-10-20');

INSERT INTO usuario (nm_usuario, dt_nascimento, ds_email, ds_senha, tp_categoria) 
VALUES 
('João Silva', '2000-01-15', 'joao@email.com', '123', 1),
('Maria Souza', '1950-06-20', 'maria@email.com', '123', 2),
('Carlos Oliveira', '1990-11-10', 'carlos@email.com', '123', 3);

INSERT INTO emprestimo (cd_usuario, dt_emprestimo) 
VALUES 
(1, '2023-11-01'), 
(1, '2023-11-02'), 
(1, '2023-11-05'),
(2, '2023-11-10'), 
(2, '2023-11-12'), 
(2, '2023-11-15'),
(3, '2023-11-20'), 
(3, '2023-11-22'), 
(3, '2023-11-25'), 
(3, '2023-11-28');

INSERT INTO emprestimo_exemplar (nr_emprestimo, nr_exemplar, dt_prevista_devolucao, dt_devolucao) 
VALUES 
(1, 1, '2023-11-08', '2023-11-07'),
(2, 2, '2023-11-09', '2023-11-09'),
(3, 3, '2023-11-12', NULL),
(4, 4, '2023-11-17', '2023-11-16'),
(5, 5, '2023-11-19', NULL),
(6, 6, '2023-11-22', '2023-11-21'),
(7, 7, '2023-11-27', NULL),
(8, 8, '2023-11-29', '2023-11-29'),
(9, 9, '2023-12-02', NULL),
(10, 10, '2023-12-05', NULL);
