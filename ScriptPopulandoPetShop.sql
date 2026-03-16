-- Populando tabela espécie
INSERT INTO especie (nm_especie) 
VALUES ('Canis lupus familiaris');

INSERT INTO especie (nm_especie)
VALUES ('Felis silvestris catus');

INSERT INTO especie (nm_especie)
VALUES ('Equus caballus');

INSERT INTO especie (nm_especie)
VALUES ('Gallus gallus domesticus');

INSERT INTO especie (nm_especie)
VALUES ('Oryctolagus cuniculus');

-- Populando tabelas raças
INSERT INTO raca (nm_raca)
VALUES ('Pastor Alemão');

INSERT INTO raca (nm_raca)
VALUES ('Golden Retriever');

INSERT INTO raca (nm_raca)
VALUES ('Shih Tzu');

INSERT INTO raca (nm_raca)
VALUES ('Yorkshire terrier');

INSERT INTO raca (nm_raca)
VALUES ('Husky Siberiano');

-- populando a tabela municipio
INSERT INTO municipio (nm_municipio, sg_uf)
VALUES ('Blumenau' , 'SC');

INSERT INTO municipio (nm_municipio, sg_uf)
VALUES ('Curitiba' , 'PR');

INSERT INTO municipio (nm_municipio, sg_uf)
VALUES ('Bento Gonçalves' , 'RS');

INSERT INTO municipio (nm_municipio, sg_uf)
VALUES ('São Paula' , 'SP');

INSERT INTO municipio (nm_municipio, sg_uf)
VALUES ('Rio de Janeiro' , 'RJ');

-- populando a tabela endereco
INSERT INTO endereco (ds_logradouro, ds_complemento, nm_bairro, nr_cep, cd_municipio)
VALUES 
('Rua XV de Novembro', 'Apt 202', 'Centro', '89010000', 1), -- Blumenau
('Avenida Sete de Setembro', 'Casa', 'Batel', '80230010', 2), -- Curitiba
('Via Trento', 'Vinícola', 'Vale dos Vinhedos', '95700000', 3), -- Bento Gonçalves
('Avenida Paulista', 'Conjunto 51', 'Bela Vista', '01311000', 4), -- São Paulo
('Avenida Atlântica', 'Bloco B', 'Copacabana', '22070000', 5); -- Rio de Janeiro

-- populando a tabela cliente
INSERT INTO cliente (nm_cliente, nr_telefone, ds_email, dt_nascimento, cd_endereco)
VALUES
('Maria Rosa', '47999999999', 'maria@hotmail.com', '1980-11-05', '1'),
('Alexandre Silva', '41999999999', 'alexandre@hotmail.com', '1998-01-05', '2'),
('Elisa Soares', '54999999999', 'elisa@hotmail.com', '2001-04-22', '3'),
('Marcus Altof', '11999999999', 'marcus@hotmail.com', '2000-12-15', '4'),
('Ana Vivaz', '21999999999', 'ana@hotmail.com', '2000-12-15', '5');


-- populando a tabela animal
INSERT INTO animal (nm_animal, ds_animal, dt_nascimento, tp_porte, cd_raca, cd_cliente)
VALUES 
('Rex', 'Cão muito dócil', '2020-05-10', 'G', 1, 1),
('Thor', 'Agitado e brincalhão', '2021-08-15', 'M', 2, 2),
('Mel', 'Pequena e late muito', '2022-01-20', 'P', 3, 3),
('Luna', 'Gosta de correr', '2019-11-30', 'P', 4, 4),
('Bidu', 'Olhos azuis', '2023-03-12', 'G', 5, 5);

-- populando a tabela prestador_servico
INSERT INTO prestador_servico (nm_prestador, nr_telefone, ds_email, cd_endereco)
VALUES 
('Dr. Carlos Pets', '4733334444', 'carlos@petshop.com', 1),
('Clínica Veterinária Silva', '4133332222', 'contato@silvavet.com', 2),
('Banho e Tosa Bento', '5433221100', 'bento@tosa.com', 3),
('Dog Walker SP', '11988887777', 'walker@sp.com', 4),
('Groomer Rio', '21977776666', 'rio@groomer.com', 5);

-- populando a tabela servico
INSERT INTO servico (ds_servico, vl_servico)
VALUES 
('Consulta Geral', 150.00),
('Banho e Tosa', 85.00),
('Vacinação Antirrábica', 60.00),
('Limpeza de Tártaro', 200.00),
('Hospedagem Diária', 120.00);

-- populando a tabela categoria
INSERT INTO categoria (ds_categoria) VALUES ('Ração'), ('Brinquedos'), ('Medicamentos'), ('Higiene'), ('Acessórios');

-- populando a tabela produto
INSERT INTO produto (nm_produto, ds_produto, vl_produto, vl_venda, qt_estoque, cd_categoria)
VALUES 
('Ração Premium 10kg', 'Sabor Carne', 120.00, 180.00, 50, 1),
('Bolinha de Borracha', 'Resistente', 5.00, 15.00, 100, 2),
('Shampoo Neutro', '500ml', 10.00, 25.00, 30, 4),
('Coleira Guia', 'Couro sintético', 15.00, 45.00, 20, 5),
('Vermífugo Plus', 'Caixa com 4 comp', 20.00, 55.00, 80, 3);

-- populando a tabela agendamento
INSERT INTO agendamento (dt_agendamento, hr_agendamento, cd_prestador)
VALUES 
('2024-06-01', '09:00:00', 1),
('2024-06-01', '10:30:00', 1),
('2024-06-02', '14:00:00', 2),
('2024-06-03', '08:00:00', 3),
('2024-06-03', '16:00:00', 5);
