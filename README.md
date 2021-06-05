# CryptoAPI

Esta API foi desenvolvida para pesquisar o valor do Bitcoin em diferentes tipo de moedas utilizando Elixir e Phoenix.

A aplicação frontend você pode encontrar aqui  https://github.com/renanvy/crypto_frontend

## INICIANDO APLICAÇÃO COM DOCKER

Iniciar aplicação:
`docker-compose up --build`

Rodar testes:
`docker-compose run web mix test`

## INICIANDO APLICAÇÃO SEM DOCKER

### Antes de rodar o projeto é necessário:
* Ter instalado Elixir 1.12.1
* Ter instalado Erlang 24

Obs: Você pode utilizar um gerador de versões como asdf https://github.com/asdf-vm/asdf para controlar as versões de cada linguagem

### Dependências
Instale as dependências do projeto rodando no terminal o comando: `mix deps.get`

### Banco
Crie o banco de dados com o seguinte comando: `mix ecto.create`

### Testes
Para executar todos os testes rode o seguinte comando no terminal: `mix test`

### Iniciar o servidor
Para iniciar o servidor da API rode o seguinte comando no terminal: `mix phx.server`

### Documentação da API

**Logar usuário:**
- Endpoint: `http://localhost:4000/api/v1/login`
- Tipo: `POST`
- Body:
```json
{
    "email": "renanvy@gmail.com",
    "password": "123456"
}
```
- Resposta: ```{"token": "t6kgsbgcobpj0pry"}```

**Listar valor do Bitcoin em outras moedas**
- Endpoint: `http://localhost:4000/api/v1/crypto/btc`
- Tipo: `GET`
- Header: `Authorization: t6kgsbgcobpj0pry`

**Listar valor das moedas dentro do arquivo currencies.json**
- Endpoint: `http://localhost:4000/api/v1/currencies`
- Tipo: `GET`
- Header: `Authorization: t6kgsbgcobpj0pry`

**Atualizar o valor de uma moeda dentro do arquivo currencies.json**
- Endpoint: `http://localhost:4000/api/v1/crypto/btc`
- Tipo: `PATCH`
- Header: `Authorization: t6kgsbgcobpj0pry`
- Body:
```json
{
    "currency": "BRL",
	"value": 5.2
}
```
