## Exercícios de Banco de Dados (SQL)

Este repositório contém scripts SQL e artefatos de modelagem de dados que demonstram a criação de esquemas, manipulação de dados, consultas complexas e uso de recursos avançados como Transações e Stored Procedures.

---

### 1. 🏢 Projeto EMPRESA (Modelagem e CRUD)

Este conjunto de arquivos foca no modelamento de um sistema de banco de dados para gerenciar o quadro de **funcionários, departamentos e projetos** de uma empresa.

| Arquivo | Descrição |
| :--- | :--- |
| `arq1.sql` | Script SQL para a criação do banco de dados `EMPRESA`. Inclui as tabelas `TBEmpregado`, `TBDepartamento`, `TBProjeto` e `TBDependente`. O script também insere dados de exemplo e executa consultas para extrair informações como "empregados que trabalham mais de 40 horas" e o "projeto com o maior número de empregados". |
| `DER` | Arquivo do Diagrama de Entidade-Relacionamento (**DER**) que representa visualmente o modelo conceitual do banco de dados `EMPRESA`, definindo as entidades e seus relacionamentos (1:N, N:M).  |

---

### 2. 📚 Projeto Acadêmico (Disciplina e Curso)

Este projeto simula um sistema de banco de dados para a área acadêmica, com foco no gerenciamento de **disciplinas, pré-requisitos, cursos e alunos**.

| Arquivo | Descrição |
| :--- | :--- |
| `arq2.sql` | Script SQL que cria o banco de dados `AULA20220516`. Inclui tabelas como `TBDepartamento`, `TBDisciplina`, `TBPrerequisito`, `TBCurso` e `TBAluno`. Contém exemplos de consultas que usam cláusulas `GROUP BY` e `JOIN` para extrair dados relevantes, como a contagem de alunos por curso e a identificação de disciplinas sem pré-requisito. |

---

### 3. 🛒 Exemplo de Transações e Procedimentos Armazenados

Este arquivo demonstra técnicas avançadas de SQL para garantir a integridade dos dados, como em sistemas de vendas e estoque.

| Arquivo | Descrição |
| :--- | :--- |
| `arq3.sql` | Scripts para um banco de dados de exemplo (`aula`) focado em vendas. Demonstra o uso de **Transações** (`BEGIN`, `COMMIT`, `ROLLBACK`) para operações como a venda de produtos e a atualização do estoque. Também inclui a criação de uma **Stored Procedure** (`repor_estoque`) com lógica condicional (`IF`) para gerenciar a entrada de produtos no estoque. |
