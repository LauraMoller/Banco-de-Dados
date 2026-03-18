
-- Liste o nome de todos os produtos e o nome da categoria a qual cada um pertence.
SELECT p.nm_produto AS 'Produto', a.ds_categoria AS 'Categoria'
FROM produto p
INNER JOIN categoria a
ON p.cd_categoria = a.cd_categoria;

-- Liste o nome do animal, o nome da sua raça e o nome da sua espécie.
SELECT a.nm_animal AS 'Nome do Animal', 
		r.nm_raca AS 'Nome da Raça',
		e.nm_especie AS 'Nome da Espécie'
FROM animal a
INNER JOIN raca r ON a.cd_raca = r.cd_raca
INNER JOIN especie e ON r.cd_especie = e.cd_especie;

-- Liste o nome dos clientes e o nome da cidade (nm_municipio) onde eles moram.
SELECT c.nm_cliente AS 'Cliente', m.nm_municipio AS 'Cidade de Residência'
FROM cliente c
INNER JOIN endereco e ON c.cd_endereco = e.cd_endereco
INNER JOIN municipio m ON e.cd_municipio = m.cd_municipio;


-- Exiba o número da nota fiscal (cd_nota_fiscal), a data de emissão, o nome do produto vendido e a quantidade vendida.
SELECT nf.cd_nota_fiscal AS 'Nº da NF', 
		nf.dt_emissao AS 'Data de Emissão', 
		p.nm_produto AS 'Produto', 
		i.qt_produto AS 'Quantidade'
FROM nota_fiscal nf
INNER JOIN item_nota_fiscal i ON i.nr_nota_fiscal = nf.cd_nota_fiscal
INNER JOIN produto p ON i.cd_produto = p.cd_produto;

-- Gere uma lista de agendamentos contendo: A data e hora do agendamento, O nome do prestador de serviço,
-- O nome do serviço que foi agendado e O valor unitário do serviço naquele agendamento.
SELECT a.dt_agendamento AS 'Data',
       a.hr_agendamento AS 'Horário',
       ps.nm_prestador AS 'Prestador do Serviço',
       s.ds_servico AS 'Serviço',
       ags.vl_servico AS 'Valor cobrado no agendamento' -- Note que usei ags aqui
FROM agendamento a
INNER JOIN prestador_servico ps ON a.cd_prestador = ps.cd_prestador
INNER JOIN agendamento_servico ags ON a.nr_agendamento = ags.nr_agendamento
INNER JOIN servico s ON ags.cd_servico = s.cd_servico
ORDER BY a.dt_agendamento, a.hr_agendamento;



