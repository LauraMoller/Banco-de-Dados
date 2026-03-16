-- criando a tabela ator
CREATE TABLE ator
(cd_ator INTEGER AUTO_INCREMENT PRIMARY KEY,
nm_ator VARCHAR(50)
);

-- criando a tabela genero
CREATE TABLE genero
(cd_genero INTEGER AUTO_INCREMENT PRIMARY KEY,
ds_genero VARCHAR(30)
);

-- criando a tabela censura
CREATE TABLE censura
(cd_censura INTEGER AUTO_INCREMENT PRIMARY KEY,
ds_censura VARCHAR(30)
);

-- criando a tabela filme
CREATE TABLE filme
(cd_filme INTEGER PRIMARY KEY AUTO_INCREMENT,
cd_censura INTEGER,
cd_genero INTEGER,
nm_filme VARCHAR(50),
ds_sinopse VARCHAR(250),
nr_duracao VARCHAR(20),
dt_lancamento DATE,
fl_dublado CHAR(1),
CONSTRAINT fk_censura FOREIGN KEY (cd_censura) REFERENCES censura(cd_censura),
CONSTRAINT fl_genero FOREIGN KEY (cd_genero) REFERENCES genero(cd_genero)
);

-- criando a tabela filme_ator
CREATE TABLE filme_ator
(cd_filme INTEGER,
cd_ator INTEGER,
CONSTRAINT fk_filme FOREIGN KEY (cd_filme) REFERENCES filme(cd_filme),
CONSTRAINT fk_ator FOREIGN KEY (cd_ator) REFERENCES ator(cd_ator),
PRIMARY KEY (cd_filme, cd_ator)
);
