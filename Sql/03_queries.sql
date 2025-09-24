USE oficina_mecanica;

-- Quais são todos os veículos cadastrados? Liste-os ordenando pelo ano do mais novo para o mais antigo.
SELECT marca, modelo, ano, placa FROM veiculos ORDER BY ano DESC;

-- Quais mecânicos são da equipe "Equipe Motor Elétrica"?
SELECT m.nome_mecanico, m.especialidade
FROM mecanicos m
JOIN equipes e ON m.equipe_id = e.id_equipe
WHERE e.nome_equipe = 'Equipe Motor e Elétrica';


-- Crie um relatório de todas as Ordens de Serviço mostrando o carro, o cliente e o status.

SELECT 
    os.id_os AS 'Número da OS',
    os.status_os AS 'Status',
    CONCAT(v.marca, ' ', v.modelo, ' (Placa: ', v.placa, ')') AS 'Veículo',
    c.nome_completo AS 'Cliente'
FROM ordem_servico os
JOIN veiculos v ON os.veiculo_id = v.id_veiculo
JOIN clientes c ON v.cliente_id = c.id_cliente;

-- Qual é o valor total de cada serviço (mão de obra + peças) em cada Ordem de Serviço concluída?
SELECT 
    os.id_os AS 'Número da OS',
    SUM(cs.valor_mao_de_obra) AS 'Valor Mão de Obra',
    SUM(ppo.quantidade * cp.valor_unitario) AS 'Valor Peças',
    round((SUM(cs.valor_mao_de_obra) + SUM(ppo.quantidade * cp.valor_unitario)),2) AS 'Valor Total Calculado'
FROM ordem_servico os
JOIN servicos_por_os spo ON os.id_os = spo.id_os
JOIN catalogo_servicos cs ON spo.id_servico = cs.id_servico
JOIN pecas_por_os ppo ON os.id_os = ppo.id_os
JOIN catalogo_pecas cp ON ppo.id_peca = cp.id_peca
WHERE os.status_os = 'Concluída'
GROUP BY os.id_os;

-- desc servicos_por_os;

-- Quantas ordens de serviço tem cada uma das equipes que está gerenciando?

SELECT 
    e.nome_equipe,
    COUNT(os.id_os) AS 'Total de Ordens de Serviço'
FROM equipes e
LEFT JOIN ordem_servico os ON e.id_equipe = os.equipe_id
GROUP BY e.nome_equipe
ORDER BY `Total de Ordens de Serviço` DESC;

--  Quais clientes gastaram mais de R$ 500,00 na oficina?
SELECT 
    c.nome_completo AS 'Cliente',
    SUM(cs.valor_mao_de_obra + (ppo.quantidade * cp.valor_unitario)) AS 'Total Gasto'
FROM clientes c
JOIN veiculos v ON c.id_cliente = v.cliente_id
JOIN ordem_servico os ON v.id_veiculo = os.veiculo_id
JOIN servicos_por_os spo ON os.id_os = spo.id_os
JOIN catalogo_servicos cs ON spo.id_servico = cs.id_servico
JOIN pecas_por_os ppo ON os.id_os = ppo.id_os
JOIN catalogo_pecas cp ON ppo.id_peca = cp.id_peca
WHERE os.status_os = 'Concluída'
GROUP BY c.nome_completo
HAVING `Total Gasto` > 500
ORDER BY `Total Gasto` DESC;


-- Relação de todas as peças e serviços utilizados na Ordem de Serviço número 2.
(SELECT 
    'Serviço' AS Tipo,
    cs.descricao_servico AS Descrição,
    cs.valor_mao_de_obra AS Valor
FROM servicos_por_os spo
JOIN catalogo_servicos cs ON spo.id_servico = cs.id_servico
WHERE spo.id_os = 2)
UNION
(SELECT 
    'Peça' AS Tipo,
    cp.nome_peca AS Descrição,
    round((ppo.quantidade * cp.valor_unitario)) AS Valor
FROM pecas_por_os ppo
JOIN catalogo_pecas cp ON ppo.id_peca = cp.id_peca
WHERE ppo.id_os = 2);




-- RECEITA TOTAL POR EQUIPES DE OS CONCLUIDA

SELECT
	e.nome_equipe,
    os.status_os,
    ROUND(SUM(IFNULL(cs.valor_mao_de_obra, 0)),2) AS "Total Servico",
    ROUND(SUM(IFNULL(ppo.quantidade * cp.valor_unitario, 0)),2) AS "Total Pecas",
    ROUND(SUM(IFNULL(cs.valor_mao_de_obra, 0)) + SUM(IFNULL(ppo.quantidade * cp.valor_unitario, 0)),2) AS "Receita Total"
FROM ordem_servico os
JOIN equipes e ON os.equipe_id = e.id_equipe
LEFT JOIN servicos_por_os spo ON os.id_os = spo.id_os
LEFT JOIN catalogo_servicos cs ON spo.id_servico = cs.id_servico
LEFT JOIN pecas_por_os ppo ON os.id_os = ppo.id_os
LEFT JOIN catalogo_pecas cp ON ppo.id_peca = cp.id_peca
WHERE os.status_os = "Concluída"
GROUP BY e.nome_equipe
ORDER BY "Receita Total" DESC;


