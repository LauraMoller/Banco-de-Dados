-- Criando a tabela tipo_obra
CREATE TABLE tipo_obra
(tp_obra INTEGER PRIMARY KEY AUTO_INCREMENT,
ds_tipo VARCHAR(50) NOT NULL
);

-- Criando a tabela Editora
CREATE TABLE editora
(cd_editora INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_editora VARCHAR(100) NOT NULL
);

-- Criando a tabela autor
CREATE TABLE autor
(cd_autor INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_autor VARCHAR(100) NOT NULL UNIQUE
);

-- Criando a tabela obra
CREATE TABLE obra
(cd_obra INTEGER PRIMARY KEY AUTO_INCREMENT,
nm_titulo VARCHAR(100) NOT NULL,
ds_edicao VARCHAR(50),
dt_publicacao DATE,
ds_sinopse VARCHAR(255),
tp_obra INTEGER NOT NULL,
cd_editora INTEGER NOT NULL,
CONSTRAINT tp_obra_fk FOREIGN KEY (tp_obra) REFERENCES tipo_obra(tp_obra),
CONSTRAINT editora_fk FOREIGN KEY (cd_editora) REFERENCES editora (cd_editora)
);

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- populando a tabela autores com 10 autores
INSERT INTO autor (nm_autor)
VALUES
('Stephen King'),
('Agatha Christie'),
('J.R.R. Tolkien'),
('George R.R. Martin'),
('Isaac Asimov'),
('Ali Hazelwood'),
('Jane Austen'),
('Neil Gainman'),
('Margaret Atwood'),
('Clarice Lispector');

-- populando a tabela tipos de obra com 3 tipos
INSERT INTO tipo_obra (ds_tipo) VALUES ('livro'), ('monografia'), ('mapa');

-- populando a tabela editora com as editoras dos autores
INSERT INTO editora (nm_editora) 
VALUES
('Suma (Companhia de Letras)'),
('HarperCollins Brasil'),
('Aleph'),
('Record'),
('Zahar'),
('Intríseca'),
('Rocco');

-- populando a tabela obras com 10 obras
INSERT INTO obra (nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora)
VALUES
('Colaboração Estelar', NULL, '2023-05-15', NULL, 1, 3),
('Antologia de Terror Moderno', NULL, '2022-10-20', 'Coletânea de contos.', 1, 1),
('Avanços da Inteligência Artificial', '1ª Edição', '2023-01-10', NULL, 2, 5),
('Mapa Estelar de Andrômeda', NULL, '2023-11-30', NULL, 3, 3),
('O Guia do Mochileiro Revisitado', 'Edição Especial', '2023-03-25', 'Nova visão.', 1, 2),
('Crônicas do Esquecimento', NULL, '2021-06-12', NULL, 1, 7),
('Manual de Escrita Criativa', '2ª Edição', '2023-08-05', 'Dicas úteis.', 1, 6),
('Relatório Científico Alpha', NULL, '2020-02-14', NULL, 2, 4),
('Poesia Brasileira Contemporânea', '1ª Edição', '2023-12-01', NULL, 1, 7),
('O Mistério da Ilha', NULL, '2019-09-20', 'Suspense clássico.', 1, 2);

-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
-- Consulta: listar o nome dos autores em ordem alfabética
SELECT a.nm_autor
FROM autor a
ORDER BY a.nm_autor ASC;

-- Consulta: Listar os dados (título e edição) das obras que foram publicadas no ano de 2023 (dica: "2023-01-01" a "2023-12-31")
SELECT o.nm_titulo, o.ds_edicao
FROM obra o 
WHERE o.dt_publicacao BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY o.nm_titulo ASC;

-- Consulta: Listar o título da(s) obra(s) que não apresenta informação sobre a edição (ds_edicao)
SELECT o.nm_titulo
FROM obra o
WHERE o.ds_edicao IS NULL
ORDER BY o.nm_titulo ASC;

-- Consulta: Listar o título da(s) obra(s) que é (são) livros (tp_obra)
SELECT o.nm_titulo
FROM obra o
WHERE o.tp_obra = 1
ORDER BY o.nm_titulo ASC;

-- Consulta: Listar o título da(s) obra(s) que não apresenta(m) sinopse cadastrada e que apresenta(m) editora associada
SELECT o.nm_titulo
FROM obra o
WHERE o.ds_sinopse IS NULL AND o.cd_editora IS NOT NULL
ORDER BY o.nm_titulo ASC;

-- Consulta: Listar o(s) nome(s) do(s) autor(es) que apresenta(m) a palavra "Al" na sua composição (nm_ator).
SELECT a.nm_autor
FROM autor a
WHERE a.nm_autor LIKE '%Al%'
ORDER BY a.nm_autor ASC;

-- Consulta: Listar o(s) nome(s) da(s) obra(s) que contém as palavras "suspense" ou "contos" na sinopse.
-- Consulta: Listar o(s) nome(s) da(s) obra(s) que contém as palavras "suspense" ou "contos" na sinopse.
SELECT o.nm_titulo
FROM obra o
WHERE o.ds_sinopse LIKE '%Suspense%' 
   OR o.ds_sinopse LIKE '%contos%'
ORDER BY o.nm_titulo ASC;
