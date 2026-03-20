-- Listar todos os animais e os nomes de seus respectivos donos.
SELECT a.nm_animal AS 'Nome do Animal', c.nm_cliente AS 'Cliente'
FROM animal a
RIGHT JOIN cliente c ON a.cd_cliente =c.cd_cliente;

-- Exibir o nome dos produtos e a descrição de suas categorias.
SELECT p.nm_produto AS 'Produto', c.ds_categoria AS 'Categoria'
FROM produto p
RIGHT JOIN categoria c ON p.cd_categoria = c.cd_categoria;

-- Listar as datas e horários de agendamentos e o nome do prestador responsável.
SELECT a.dt_agendamento AS 'Data', a.hr_agendamento AS 'Horário', ps.nm_prestador AS 'Prestador'
FROM agendamento a
RIGHT JOIN prestador_servico ps ON a.cd_prestador = ps.cd_prestador;

-- Listar o código da nota fiscal e o nome do produto vendido (tabela item_nota_fiscal e produto).
SELECT inf.nr_nota_fiscal AS 'Código da Nota Fiscal', p.nm_produto AS 'Produto Vendido'
FROM item_nota_fiscal inf
RIGHT JOIN produto p ON inf.cd_produto = p.cd_produto;

-- Mostrar a descrição de todos os serviços e os números de agendamento em que eles aparecem.
SELECT ags.nr_agendamento AS 'Nº Agendamento',  s.ds_servico AS 'Descrição do Serviço'
FROM agendamento_servico ags
RIGHT JOIN servico s ON ags.cd_servico = s.cd_servico;
