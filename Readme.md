# Projeto de Banco de Dados: Oficina Mecânica

![Status](https://img.shields.io/badge/status-conclu%C3%ADdo-green)

## 📖 Descrição do Projeto

Este repositório contém a solução completa para o Desafio de Projeto sobre modelagem de um banco de dados para o contexto de uma Oficina Mecânica, proposto no Bootcamp Klabin. O projeto abrange desde a criação do esquema lógico e físico, a inserção de dados realistas (DML), até a elaboração de consultas complexas (DQL) para extrair informações gerenciais.

## 🚀 Funcionalidades e Modelo de Negócio

O esquema foi projetado para gerenciar as operações centrais de uma oficina, incluindo:
* **Gestão de Clientes e Veículos:** Cadastro de clientes e seus respectivos veículos, com um relacionamento de um-para-muitos.
* **Equipes e Mecânicos:** Organização dos funcionários em equipes, com atribuição de especialidades.
* **Ordens de Serviço (OS):** Entidade central que registra cada trabalho, associando um veículo a uma equipe responsável, com status e datas de controle.
* **Catálogo de Peças e Serviços:** Tabelas de referência que listam todos os serviços e peças oferecidos pela oficina, com seus respectivos valores.
* **Integridade e Otimização:** O banco de dados utiliza chaves estrangeiras para garantir a integridade referencial e índices para otimizar a performance das consultas.

## 📊 Modelo Lógico (Diagrama EER)

O diagrama abaixo, gerado no MySQL Workbench, ilustra a estrutura final do banco de dados com suas entidades e relacionamentos.

![Modelo Lógico do Banco de Dados](Diagrama_EER_oficina.jpg)

## 📁 Estrutura de Arquivos

* `/sql/01_schema.sql`: Script DDL para criação de todas as tabelas e constraints.
* `/sql/02_inserts.sql`: Script DML para popular o banco de dados com dados de exemplo.
* `/sql/03_queries.sql`: Script DQL com exemplos de consultas que respondem a diversas perguntas de negócio, utilizando `JOIN`, `GROUP BY` e `HAVING`.

## 💡 Exemplos de Consultas (Business Intelligence)

O arquivo `03_queries.sql` inclui consultas que respondem a perguntas de negócio como:

* Qual equipe é a mais lucrativa?
* Quais clientes gastaram mais de R$ 500,00 na oficina?
* Quantas ordens de serviço cada equipe está gerenciando?
* Qual o valor total (peças + serviços) de cada ordem de serviço concluída?
* Como listar todos os itens (peças e serviços) de uma OS específica?

## 🛠️ Tecnologias Utilizadas

* **SGBD:** MySQL
* **Ferramenta de Modelagem:** MySQL Workbench
* **Editor de Código:** Visual Studio Code
* **Controle de Versão:** Git & GitHub

---

_Projeto desenvolvido por Bruno Albuquerque como parte do Desafio de Projeto do Bootcamp Klabin._
