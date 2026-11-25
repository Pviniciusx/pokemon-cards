# 🃏 Pokémon TCG Database — Modelagem Relacional & Migrations em PostgreSQL

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Status](https://img.shields.io/badge/Status-Concluído-2EA44F?style=for-the-badge)

Projeto de modelagem e engenharia de banco de dados relacional desenvolvido em **PostgreSQL** para catalogar cartas de **Pokémon Trading Card Game (TCG)**. O repositório implementa normalização de dados, chaves estrangeiras com integridade referencial, indexação, carga inicial de dados (*seeds*), *views* analíticas e automação de *migrations* via PowerShell.

---

## 📋 Índice

- [Arquitetura do Banco de Dados](#-arquitetura-do-banco-de-dados)
- [Estrutura de Pastas](#-estrutura-de-pastas)
- [Recursos Técnicos Implementados](#-recursos-técnicos-implementados)
- [Como Executar o Projeto](#-como-executar-o-projeto)
- [Exemplos de Consultas](#-exemplos-de-consultas)
- [Autor](#-autor)

---

## 🗄️ Arquitetura do Banco de Dados

O schema foi projetado seguindo boas práticas de normalização para eliminar redundâncias textuais e garantir integridade nos registros:

* **`tbl_collections`**: Armazena os conjuntos/expansões oficiais (`id`, `collectionSetName`, `releaseDate`, `totalCardsInCollection`).
* **`tbl_types`**: Tabela auxiliar normalizada com os 11 tipos de energia do TCG (`Grass`, `Fire`, `Water`, `Lightning`, `Psychic`, `Fighting`, `Darkness`, `Metal`, `Dragon`, `Fairy`, `Colorless`).
* **`tbl_stages`**: Tabela auxiliar com os estágios e mecânicas de evolução (`Basic`, `Stage 1`, `Stage 2`, `VMAX`, `VSTAR`, `ex`, `GX`, `Mega`).
* **`tbl_cards`**: Tabela principal contendo os atributos de combate (`hp`, `name`, `info`, `attack`, `dammage`, `weak`, `resistence`, `retreat`, `cardNumberInCollection`) e chaves estrangeiras vinculadas às tabelas auxiliares (`collection_id`, `type_id`, `stage_id`).
* **`vw_cards_detalhados`**: *View* relacional que consolida todas as informações das cartas substituindo os identificadores numéricos estrangeiros pelos respectivos nomes das coleções, tipos e estágios.

---

## 📂 Estrutura de Pastas

```text
pokemon-cards/
├── assets/
│   └── pikachu.webp                  # Recurso visual do projeto
├── db_scripts/
│   ├── migration.sql                 # Script consolidado gerado automaticamente
│   ├── tables/
│   │   └── 001_create_tables.sql     # DDL de criação das tabelas, FKs e índices
│   └── seeds/
│       ├── 001_initial_seeds.sql     # Carga inicial de coleções, tipos, estágios e cartas
│       ├── 002_bulk_cards_1.sql      # Lote complementar de 20 cartas
│       └── 003_bulk_cards_2.sql      # Lote complementar de 30 cartas
├── prompts/
│   └── tcg_cards.txt                 # Especificação e requisitos originais
├── views/
│   └── view_card.sql                 # Definição da view vw_cards_detalhados
├── to_migration.ps1                  # Script PowerShell de automação de migrations
└── README.md                         # Documentação do repositório
