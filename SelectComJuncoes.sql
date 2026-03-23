-- Selecione os nomes dos clientes e os respectivos nomes dos animais cadastrados.
SELECT c.nm_cliente AS 'Cliente', a.nm_animal AS 'Animal'
FROM cliente c
INNER JOIN animal a ON c.cd_cliente = a.cd_cliente;

-- Liste os detalhes dos produtos e as descrições de suas categorias.
SELECT p.nm_produto AS 'Produto', 
		p.ds_produto AS 'Detalhes do Produto',
		c.ds_categoria AS 'Descrição da Categoria'
FROM produto p
INNER JOIN categoria c ON p.cd_categoria = c.cd_categoria;

-- Mostre os agendamentos com as informações do prestador de serviço associado.
SELECT a.nr_agendamento AS 'Agendamento',
		ps.nm_prestador AS 'Prestador',
		ps.nr_telefone AS 'Telefone do Prestador',
		ps.ds_email AS 'E-mail do Prestador'
FROM agendamento a
INNER JOIN prestador_servico ps ON a.cd_prestador = ps.cd_prestador;

-- Liste os serviços agendados e as descrições de cada serviço.
SELECT ags.nr_agendamento AS 'Nº Agendamento', s.ds_servico AS 'Serviço'
FROM 	agendamento_servico ags
INNER JOIN servico s ON ags.cd_servico = s.cd_servico;

-- Selecione os nomes dos prestadores e os serviços que eles prestam. 
SELECT ps.nm_prestador AS 'Prestador', 
       s.ds_servico AS 'Serviço'
FROM prestador_servico ps
INNER JOIN servico_prestador sp ON ps.cd_prestador = sp.cd_prestador
INNER JOIN servico s ON sp.cd_servico = s.cd_servico
ORDER BY ps.nm_prestador;

-- Mostre as notas fiscais e os nomes dos clientes que as receberam.
SELECT nf.cd_nota_fiscal AS 'Número da Nota', c.nm_cliente AS 'Cliente'
FROM nota_fiscal nf
INNER JOIN cliente c ON nf.cd_cliente = c.cd_cliente;

-- Liste os itens de nota fiscal e os respectivos nomes dos produtos.
SELECT inf.nr_nota_fiscal AS 'Nº da NF', p.nm_produto AS 'Nome do Produto'
FROM item_nota_fiscal inf
INNER JOIN produto p ON inf.cd_produto = p.cd_produto;

-- Selecione os nomes dos animais, suas raças e suas respectivas espécies.
SELECT a.nm_animal AS 'Nome do Animal',
		r.nm_raca AS 'Raça',
		e.nm_especie AS 'Espécie'
FROM animal a
INNER JOIN raca r ON a.cd_raca = r.cd_raca
INNER JOIN especie e ON r.cd_especie = e.cd_especie;

-- Liste os endereços dos clientes, mostrando o logradouro e o município.
SELECT c.nm_cliente AS 'Cliente', 
		e.ds_logradouro AS 'Logradouro',
		m.nm_municipio AS 'Município'
FROM cliente c
INNER JOIN endereco e ON c.cd_endereco = e.cd_endereco
INNER JOIN municipio m ON e.cd_municipio = m.cd_municipio;

-- Selecione os prestadores de serviço e os municípios em que seus endereços estão localizados.
SELECT ps.nm_prestador AS 'Prestador', m.nm_municipio AS 'Município'
FROM prestador_servico ps
INNER JOIN endereco e ON ps.cd_endereco = e.cd_endereco
INNER JOIN municipio m ON e.cd_municipio = m.cd_municipio;

-- Mostre as notas fiscais e os produtos comprados, junto com as quantidades e valores.
SELECT inf.nr_nota_fiscal AS 'Nº da NF',
		p.nm_produto AS 'Produto',
		inf.qt_produto AS 'Quantidade do Produto',
		inf.vl_produto AS 'Valor do Produto' 
FROM item_nota_fiscal inf
INNER JOIN produto p ON inf.cd_produto = p.cd_produto;

-- Liste os agendamentos e os serviços prestados, mostrando os valores totais dos serviços agendados.
SELECT a.nr_agendamento AS 'Agendamento', 
		SUM(ags.qt_servico * ags.vl_servico) AS 'Valor Total' 
FROM agendamento a
INNER JOIN agendamento_servico ags ON a.nr_agendamento = ags.nr_agendamento
GROUP BY a.nr_agendamento;

-- Selecione os prestadores de serviço que realizam serviços de valor superior a R$ 100,00.
SELECT ps.nm_prestador AS 'Prestador',
		s.ds_servico AS 'Serviço Prestado',
		s.vl_servico AS 'Valor do Serviço'
FROM prestador_servico ps
INNER JOIN servico_prestador sp ON ps.cd_prestador = sp.cd_prestador
INNER JOIN servico s ON sp.cd_servico = s.cd_servico
WHERE s.vl_servico > 100;

-- Liste os animais, suas raças e as espécies a que pertencem, filtrando apenas as raças com nome "Poodle".]
SELECT a.nm_animal AS 'Animal',
		r.nm_raca AS 'Raça',
		e.nm_especie AS 'Espécie'
FROM animal a
INNER JOIN raca r ON a.cd_raca = r.cd_raca
INNER JOIN especie e ON r.cd_especie = e.cd_especie
WHERE r.nm_raca LIKE 'Poodle';
