# Challenge Qulture Rocks

## Como rodar
```shell
$ docker-comṕose build
$ docker-compose up
$ docker-compose run web rake db:create db:migrate db:seed
```
## Endpoints

### Listar as empresas do sistema
##### Request
```request
GET /api/v1/companies
```
###  Ver uma empresa
##### Request
```request
GET /api/v1/companies/:id
```
### Cadastrar uma empresa
##### Request
```request
POST /api/v1/companies
```
##### Atributos
```json
{
	"name": "<nome da empresa>"
}
```
##### Response
200 - Criado com sucesso
422 - Parametros inválidos

### Listar os colaboradores de uma empresa
##### Request
```request
GET /api/v1/companies/:company_id/employees
```
### Cadastrar um colaborador em uma empresa
##### Request
```request
POST /api/v1/companies/:company_id/employees
```
##### Atributos
```json
{
	"name": "<nome do funcionário>",
	"email": "<email do funcionário>"
}
```
##### Response
200 - Criado com sucesso
422 - Parametros inválidos

### Apagar um colaborador de uma empresa
##### Request
```request
DELETE /api/v1/companies/:company_id/employees/:id
```
##### Response
200 - Deletado com sucesso
404 - Funcionário não encontrado na empresa

### Associar um colaborador como gestor de outro usuário
##### Request
```request
PUT /api/v1/employees/:employee_id/subordinate
```
##### Atributos
```json
{
	"subordinate_id": "<id do liderado>"
}
```
##### Response
200 - Associação criada com sucesso
400 - Associação circular não é permitida
404 - Lider/liderado não encontrado
409 - Colaboradores são de empresas diferentes

###  Listar os pares de um colaborador
##### Request
```request
GET /api/v1/employees/:employee_id/peers
```
###  Listar os liderados diretos de um colaborador
##### Request
```request
GET /api/v1/employees/:employee_id/subordinates
```
###  Listar os liderados dos liderados de um colaborador
##### Request
```request
GET /api/v1/employees/:employee_id/subordinates/second_tier
```

## Aprendizados
Conheci a técnica [nested set model](https://coderwall.com/p/ohomlg/nested-set-model-the-best-approach-to-deal-with-hierarchical-data), uma técnica para trabalhar com modelos autoreferenciavel, e adotei a gem [awesome_nested_set](https://github.com/collectiveidea/awesome_nested_set), que me permitiu trabalhar com o relacionamento entre lider/liderado evitando problemas de N+1.
