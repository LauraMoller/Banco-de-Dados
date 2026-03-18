-- Listar todos os clientes cadastrados e o nome de seus animais.
SELECT c.nm_cliente AS 'Cliente',
		a.nm_animal AS 'Animal'
FROM cliente c
LEFT JOIN animal a ON c.cd_cliente = a.cd_cliente;

-- Exibir todas as categorias cadastradas e o nome dos produtos vinculados a elas.
SELECT c.ds_categoria AS 'Categoria',
		p.nm_produto AS 'Produto'
FROM categoria c
LEFT JOIN produto p ON c.cd_categoria = p.cd_categoria;

-- Selecionar o nome de todos os clientes e a data de emissão de suas notas fiscais.
SELECT c.nm_cliente AS 'Cliente',
		nf.dt_emissao AS 'Data da NF'
FROM cliente c
LEFT JOIN nota_fiscal nf ON c.cd_cliente = nf.cd_cliente;

-- Listar todos os prestadores de serviço e as descrições dos serviços que eles estão aptos a realizar (tabela servico_prestador).
SELECT ps.nm_prestador AS 'Prestador',
		s.ds_servico AS 'Serviço'
FROM prestador_servico ps
LEFT JOIN servico_prestador sp ON ps.cd_prestador = sp.cd_prestador
LEFT JOIN servico s ON sp.cd_servico = s.cd_servico;

-- Mostrar todas as espécies (Ex: Cão, Gato, Ave) e os nomes das raças vinculadas a elas.
SELECT 
    e.nm_especie AS 'Espécie',
    r.nm_raca AS 'Raça'
FROM especie e
LEFT JOIN raca r ON e.cd_especie = r.cd_especie;
