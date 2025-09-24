USE oficina_mecanica;

-- Desabilitar checagens de chave estrangeira temporariamente para facilitar a inserção em massa
SET FOREIGN_KEY_CHECKS = 0;

-- Inserindo Clientes
INSERT INTO `clientes` (`id_cliente`, `nome_completo`, `cpf`, `numero_telefone`, `rua`, `bairro`, `numero`) VALUES
(1, 'João da Silva', '11122233344', '15991112222', 'Rua das Flores', 'Centro', '123'),
(2, 'Maria Oliveira', '22233344455', '11988887777', 'Avenida Paulista', 'Bela Vista', '1500'),
(3, 'Carlos Pereira', '33344455566', '21977776666', 'Rua da Praia', 'Copacabana', '456'),
(4, 'Ana Costa', '44455566677', '15992223333', 'Rua das Palmeiras', 'Vila Barth', '789'),
(5, 'Pedro Martins', '55566677788', '11966665555', 'Rua dos Pinheiros', 'Pinheiros', '321');

-- Inserindo Veículos
INSERT INTO `veiculos` (`id_veiculo`, `cliente_id`, `placa`, `marca`, `modelo`, `ano`) VALUES
(1, 1, 'ABC1D23', 'Fiat', 'Uno', 2018),
(2, 1, 'DEF4E56', 'Chevrolet', 'Onix', 2020),
(3, 2, 'GHI7F89', 'Honda', 'Civic', 2021),
(4, 3, 'JKL0A12', 'Ford', 'Ka', 2019),
(5, 4, 'MNO3B45', 'Volkswagen', 'Gol', 2022),
(6, 5, 'PQR6C78', 'Hyundai', 'HB20', 2020),
(7, 5, 'STU9D01', 'Toyota', 'Corolla', 2023);

-- Inserindo Equipes
INSERT INTO `equipes` (`id_equipe`, `nome_equipe`) VALUES
(1, 'Equipe Motor e Elétrica'),
(2, 'Equipe Freios e Suspensão');

-- Inserindo Mecânicos
INSERT INTO `mecanicos` (`id_mecanico`, `equipe_id`, `nome_mecanico`, `codigo_funcionario`, `especialidade`) VALUES
(1, 1, 'José Almeida', 'FUNC001', 'Motor'),
(2, 1, 'Ricardo Lima', 'FUNC002', 'Elétrica'),
(3, 2, 'Sérgio Santos', 'FUNC003', 'Freios'),
(4, 2, 'Fernando Rocha', 'FUNC004', 'Suspensão');

-- Inserindo Catálogo de Serviços
INSERT INTO `catalogo_servicos` (`id_servico`, `descricao_servico`, `valor_mao_de_obra`) VALUES
(1, 'Troca de óleo e filtro', 100.00),
(2, 'Revisão completa do sistema de freios', 250.00),
(3, 'Alinhamento e Balanceamento', 120.00),
(4, 'Troca da correia dentada', 350.00),
(5, 'Diagnóstico do sistema de injeção eletrônica', 150.00),
(6, 'Troca de amortecedores (par)', 200.00);

-- Inserindo Catálogo de Peças
INSERT INTO `catalogo_pecas` (`id_peca`, `nome_peca`, `valor_unitario`) VALUES
(1, 'Óleo de Motor 5W30 (Litro)', 45.00),
(2, 'Filtro de Óleo', 30.00),
(3, 'Pastilha de Freio (par)', 120.00),
(4, 'Disco de Freio (unidade)', 180.00),
(5, 'Correia Dentada', 90.00),
(6, 'Vela de Ignição', 25.00),
(7, 'Amortecedor Dianteiro (unidade)', 280.00),
(8, 'Pneu Aro 15', 350.00);

-- Inserindo Ordens de Serviço
INSERT INTO `ordem_servico` (`id_os`, `veiculo_id`, `equipe_id`, `data_emissao`, `status_os`, `data_conclusao`) VALUES
(1, 1, 1, '2025-09-10', 'Concluída', '2025-09-11'),
(2, 2, 2, '2025-09-12', 'Concluída', '2025-09-13'),
(3, 3, 1, '2025-09-15', 'Em Execução', NULL),
(4, 4, 2, '2025-09-18', 'Aguardando', NULL),
(5, 5, 1, '2025-09-20', 'Concluída', '2025-09-21'),
(6, 6, 2, '2025-09-22', 'Em Execução', NULL),
(7, 7, 1, '2025-09-23', 'Aguardando', NULL),
(8, 1, 2, '2025-09-23', 'Cancelada', NULL);

-- Detalhando as Ordens de Serviço (Serviços)
INSERT INTO `servicos_por_os` (`id_os`, `id_servico`) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 5),
(5, 4),
(6, 6);

-- Detalhando as Ordens de Serviço (Peças)
INSERT INTO `pecas_por_os` (`id_os`, `id_peca`, `quantidade`) VALUES
(1, 1, 4.5),
(1, 2, 1),
(2, 3, 2),
(5, 5, 1),
(6, 7, 2);

-- Habilitar checagens de chave estrangeira novamente
SET FOREIGN_KEY_CHECKS = 1;