-- Listar todos os produtos com preço de venda acima de R$ 100,00.
SELECT p.nm_produto AS 'Produto', p.vl_venda AS 'Valor de venda'
FROM produto p
WHERE p.vl_venda > 100;

-- Liste os serviços cujo valor é inferior a R$ 50,00.
SELECT s.ds_servico AS 'Serviço', s.vl_servico AS 'Valor'
FROM servico s
WHERE s.vl_servico < 50;

-- Listar os dados dos animais (nome, descrição, data de nascimento e porte), 
-- ordenando pelo mais velho;
SELECT a.nm_animal AS 'Nome do Animal', 
		a.ds_animal AS 'Descrição', 
		a.dt_nascimento AS 'Data de Nascimento',
		a.tp_porte AS 'Porte'
FROM animal a
ORDER BY a.dt_nascimento ASC;

-- Listar o número e o valor total da(s) nota(s) fiscal(is) que foi(ram) 
-- emitida(s) no mês de setembro de 2024;
SELECT nf.cd_nota_fiscal AS 'Nº da nota', nf.vl_total AS 'Valor Total'
FROM nota_fiscal nf
WHERE nf.dt_emissao BETWEEN '2024-09-01' AND '2024-09-30';

-- Listar o nome do(s) cliente(s) que não apresenta(m) e-mail cadastrado;
SELECT c.nm_cliente AS 'Nome do Cliente'
FROM cliente c
WHERE c.ds_email IS NULL;

-- Listar qual(is) produto(s) apresentam valor de venda acima de 9.99 e 
-- estoque maior ou igual a 100 unidades;
SELECT p.nm_produto AS 'Produto', 
		p.vl_venda AS 'Valor de Venda', 
		p.qt_estoque AS 'Estoque'
FROM produto p
WHERE p.vl_venda > 9.99 AND
		p.qt_estoque >= 100;
		
-- Listar os serviços (nome e valor) ordenando pelo maior valor de serviço;
SELECT s.ds_servico AS 'Serviço', s.vl_servico AS 'Valor'
FROM servico s
ORDER BY s.vl_servico DESC;

-- Listar todos os prestadores de serviço cujo telefone começa com o 
-- código de área "47".
SELECT ps.nm_prestador AS 'Prestador', ps.nr_telefone AS 'Telefone'
FROM prestador_servico ps
WHERE ps.nr_telefone LIKE '47%';

-- Listar os dados (nome e data de nascimento) dos animais são de porte grande.
SELECT a.nm_animal AS 'Nome do Animal'
FROM animal a
WHERE a.tp_porte LIKE 'G';

-- Listar os clientes cujo nome apresenta "silva" na sua formação (nm_cliente).
SELECT c.nm_cliente AS 'Cliente'
FROM cliente c
WHERE c.nm_cliente LIKE '%silva%';

-- Listar todos os agendamentos feitos na primeira quinzena de outubro de 2024.
SELECT a.nr_agendamento AS 'Nº do Agendamento', 
		a.dt_agendamento AS 'Data',
		a.hr_agendamento AS 'Horário'
FROM agendamento a
WHERE a.dt_agendamento BETWEEN '2024-10-01' AND '2024-10-15';

-- Listar os clientes que nasceram antes de 01/01/1980.
SELECT c.nm_cliente AS 'Cliente', c.dt_nascimento AS 'Data de Nascimento'
FROM cliente c
WHERE c.dt_nascimento < '1980-01-01';

-- Listar as categorias com descrição contendo a palavra "brinquedo".
SELECT c.ds_categoria AS 'Categoria'
FROM categoria c
WHERE c.ds_categoria LIKE '%Brinquedo%';

-- Listar os clientes cujo e-mail contém "@gmail.com".
SELECT c.nm_cliente AS 'Cliente', c.ds_email AS 'E-mail' 
FROM cliente c
WHERE c.ds_email LIKE '%@gmail.com%';

-- Listar os produtos onde o estoque é maior ou igual a 20 e o preço de venda 
-- é inferior a R$ 100,00.
SELECT p.nm_produto AS 'Produto', 
		p.qt_estoque AS 'Estoque',
		p.vl_venda AS 'Valor de Venda'
FROM produto p
WHERE p.qt_estoque >= 20 AND p.vl_venda < 100;
