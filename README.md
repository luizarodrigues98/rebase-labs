# Rebase Labs

Uma app web para listagem de exames médicos. Utilizando:
* Docker
* Ruby
* Javascript
* HTML
* CSS

## Requisitos
É necessário possuir Docker instalado na maquina.

## Como rodar
1. git clone `git@github.com:luizarodrigues98/rebase-labs.git`
2. Rodar comando: `docker compose up`
3. Popular o banco de dados com arquivo csv, em outro terminal rodar:
   
   `docker compose exec 18-rebase-labs bash -c 'rake db:seed'`

4. Para acessar: 
   http://localhost:3000

5. Para visualizar front-end com os dados
   clonar o repositório
   
   `git clone git@github.com:luizarodrigues98/rebase-labs-front.git`

## Suíte de testes
Utilizamos o Rspec para realizar os testes automatizados;  
1. Rodar comando: 
   `docker compose up`
2. Rodar os testes: 
   `docker compose exec  18-rebase-labs bash -c 'rspec'`

## Endpoints dessa aplicação
### #GET /tests
* Lista os pacientes que tem exames
   * Resposta:
   ``` json
    [
      {
        "id": 1,
        "cpf": "048.973.170-88",
        "patient_name": "Emilly Batista Neto",
        "patient_email": "gerald.crona@ebert-quigley.com",
        "patient_bithdate": "2001-03-11",
        "patient_address": "165 Rua Rafaela",
        "patient_city": "Ituverava",
        "patient_state": "Alagoas",
        "doctor_crm": "B000BJ20J4",
        "doctor_crm_state": "PI",
        "doctor_name": "Maria Luiza Pires",
        "doctor_email": "denna@wisozk.biz",
        "result_token": "IQCZ17",
        "exam_date": "2021-08-05",
        "exam_type": "hemácias",
        "exam_type_limit": "45-52",
        "exam_type_result": "97"
      },
      {
        "id": 14,
        "cpf": "048.108.026-04",
        "patient_name": "Juliana dos Reis Filho",
        "patient_email": "mariana_crist@kutch-torp.com",
        "patient_bithdate": "1995-07-03",
        "patient_address": "527 Rodovia Júlio",
        "patient_city": "Lagoa da Canoa",
        "patient_state": "Paraíba",
        "doctor_crm": "B0002IQM66",
        "doctor_crm_state": "SC",
        "doctor_name": "Maria Helena Ramalho",
        "doctor_email": "rayford@kemmer-kunze.info",
        "result_token": "0W9I67",
        "exam_date": "2021-07-09",
        "exam_type": "hemácias",
        "exam_type_limit": "45-52",
        "exam_type_result": "28"
      }
    ]
   ```
* Paramêtros: 
  * `query` - Paramêtro opcional para fazer buscas pelo `result_token`
  * Resposta: 
    ```json 
    [
        {
      "id": 1,
      "cpf": "048.973.170-88",
      "patient_name": "Emilly Batista Neto",
      "patient_email": "gerald.crona@ebert-quigley.com",
      "patient_bithdate": "2001-03-11",
      "patient_address": "165 Rua Rafaela",
      "patient_city": "Ituverava",
      "patient_state": "Alagoas",
      "doctor_crm": "B000BJ20J4",
      "doctor_crm_state": "PI",
      "doctor_name": "Maria Luiza Pires",
      "doctor_email": "denna@wisozk.biz",
      "result_token": "IQCZ17",
      "exam_date": "2021-08-05",
      "exam_type": "hemácias",
      "exam_type_limit": "45-52",
      "exam_type_result": "97",
      "exams": [
        {
        "id": 1,
        "cpf": "048.973.170-88",
        "patient_name": "Emilly Batista Neto",
        "patient_email": "gerald.crona@ebert-quigley.com",
        "patient_bithdate": "2001-03-11",
        "patient_address": "165 Rua Rafaela",
        "patient_city": "Ituverava",
        "patient_state": "Alagoas",
        "doctor_crm": "B000BJ20J4",
        "doctor_crm_state": "PI",
        "doctor_name": "Maria Luiza Pires",
        "doctor_email": "denna@wisozk.biz",
        "result_token": "IQCZ17",
        "exam_date": "2021-08-05",
        "exam_type": "hemácias",
        "exam_type_limit": "45-52",
        "exam_type_result": "97"
      },
      {
        "id": 2,
        "cpf": "048.973.170-88",
        "patient_name": "Emilly Batista Neto",
        "patient_email": "gerald.crona@ebert-quigley.com",
        "patient_bithdate": "2001-03-11",
        "patient_address": "165 Rua Rafaela",
        "patient_city": "Ituverava",
        "patient_state": "Alagoas",
        "doctor_crm": "B000BJ20J4",
        "doctor_crm_state": "PI",
        "doctor_name": "Maria Luiza Pires",
        "doctor_email": "denna@wisozk.biz",
        "result_token": "IQCZ17",
        "exam_date": "2021-08-05",
        "exam_type": "leucócitos",
        "exam_type_limit": "9-61",
        "exam_type_result": "89"
      },
      {
        "id": 3,
        "cpf": "048.973.170-88",
        "patient_name": "Emilly Batista Neto",
        "patient_email": "gerald.crona@ebert-quigley.com",
        "patient_bithdate": "2001-03-11",
        "patient_address": "165 Rua Rafaela",
        "patient_city": "Ituverava",
        "patient_state": "Alagoas",
        "doctor_crm": "B000BJ20J4",
        "doctor_crm_state": "PI",
        "doctor_name": "Maria Luiza Pires",
        "doctor_email": "denna@wisozk.biz",
        "result_token": "IQCZ17",
        "exam_date": "2021-08-05",
        "exam_type": "plaquetas",
        "exam_type_limit": "11-93",
        "exam_type_result": "97"
      },
      {
        "id": 4,
        "cpf": "048.973.170-88",
        "patient_name": "Emilly Batista Neto",
        "patient_email": "gerald.crona@ebert-quigley.com",
        "patient_bithdate": "2001-03-11",
        "patient_address": "165 Rua Rafaela",
        "patient_city": "Ituverava",
        "patient_state": "Alagoas",
        "doctor_crm": "B000BJ20J4",
        "doctor_crm_state": "PI",
        "doctor_name": "Maria Luiza Pires",
        "doctor_email": "denna@wisozk.biz",
        "result_token": "IQCZ17",
        "exam_date": "2021-08-05",
        "exam_type": "hdl",
        "exam_type_limit": "19-75",
        "exam_type_result": "0"
      },
      {
        "id": 5,
        "cpf": "048.973.170-88",
        "patient_name": "Emilly Batista Neto",
        "patient_email": "gerald.crona@ebert-quigley.com",
        "patient_bithdate": "2001-03-11",
        "patient_address": "165 Rua Rafaela",
        "patient_city": "Ituverava",
        "patient_state": "Alagoas",
        "doctor_crm": "B000BJ20J4",
        "doctor_crm_state": "PI",
        "doctor_name": "Maria Luiza Pires",
        "doctor_email": "denna@wisozk.biz",
        "result_token": "IQCZ17",
        "exam_date": "2021-08-05",
        "exam_type": "ldl",
        "exam_type_limit": "45-54",
        "exam_type_result": "80"
      }
      ]}
    ]
### #POST /import
  * Com esse endpoint é possível enviar um arquivo `.csv` no body da requisição.
  * A primeira linha do arquivo precisa ter um cabeçalho como este exemplo abaixo, separando os campos por `;` 
  * Exemplo:
`cpf;nome paciente;email paciente;data nascimento paciente;endereço/rua paciente;cidade paciente;estado patiente;crm médico;crm médico estado;nome médico;email médico;token resultado exame;data exame;tipo exame;limites tipo exame;resultado tipo exame`

  * Todos os campos são obrigatórios, então não é possivel realizar o import se houver campos nulos.