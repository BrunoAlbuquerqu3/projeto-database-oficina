

CREATE DATABASE oficina_mecanica;
USE oficina_mecanica;
/*=================================================================
 Criação de tabelas fortes
=================================================================
*/

CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome_completo VARCHAR(100) NOT NULL,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	numero_telefone VARCHAR(16),
	rua VARCHAR(50),
	bairro VARCHAR(50),
	numero VARCHAR(5)
);

CREATE TABLE veiculos(
	id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    placa VARCHAR(7) UNIQUE NOT NULL ,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    CONSTRAINT fk_veiculos_clientes FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente)
);

CREATE TABLE equipes(
	id_equipe INT AUTO_INCREMENT PRIMARY KEY,
    nome_equipe VARCHAR (30) UNIQUE NOT NULL
);

CREATE TABLE mecanicos(
	id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    equipe_id INT NOT NULL,
    nome_mecanico VARCHAR(50) NOT NULL,
    codigo_funcionario VARCHAR (10) UNIQUE,
    especialidade VARCHAR(30) NOT NULL,
    CONSTRAINT fk_mecanicos_equipes FOREIGN KEY(equipe_id) REFERENCES equipes(id_equipe)
);

CREATE TABLE catalogo_servicos(
	id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao_servico VARCHAR(255) NOT NULL,
    valor_mao_de_obra DECIMAL(10,2) NOT NULL
);

CREATE TABLE catalogo_pecas(
	id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome_peca VARCHAR(50)NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL
);

/*===========================================================================
Tabelas fracas relacionamento
=============================================================================*/
CREATE TABLE ordem_servico(
	id_os INT AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT NOT NULL,
    equipe_id INT NOT NULL,
    data_emissao DATE NOT NULL,
    data_conclusao DATE NULL,
    status_os ENUM('Aguardando','Em Execução','Cancelada','Concluída'),
    valor_total DECIMAL(10,2),
    CONSTRAINT fk_os_veiculos FOREIGN KEY(veiculo_id) REFERENCES veiculos(id_veiculo),
    CONSTRAINT fk_os_equipes FOREIGN KEY(equipe_id) REFERENCES equipes(id_equipe)
    );
    
    
CREATE TABLE servicos_por_os(
	id_os INT NOT NULL,
    id_servico INT NOT NULL,
    PRIMARY KEY(id_os, id_servico),
    CONSTRAINT fk_servico_os_os FOREIGN KEY(id_os) REFERENCES ordem_servico(id_os),
    CONSTRAINT fk_servico_os_servico FOREIGN KEY(id_servico) REFERENCES catalogo_servicos(id_servico)
);

CREATE TABLE pecas_por_os (
	id_os INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade DECIMAL(10, 2) NOT NULL, -- PODE CONTER PRODUTOS EM LITROS
    PRIMARY KEY (id_os, id_peca),
    CONSTRAINT fk_pecas_os_os FOREIGN KEY(id_os) REFERENCES ordem_servico(id_os),
    CONSTRAINT fk_pecas_os_peca FOREIGN KEY(id_peca) REFERENCES catalogo_pecas(id_peca)
);




