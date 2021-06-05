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


<img width="867" alt="Captura de Tela 2021-06-05 às 14 30 19" src="https://user-images.githubusercontent.com/2266325/120900417-12f63f80-c60b-11eb-936b-19b319915070.png">

<img width="916" alt="Captura de Tela 2021-06-05 às 14 30 34" src="https://user-images.githubusercontent.com/2266325/120900422-18538a00-c60b-11eb-9a31-da7aff66a890.png">

<img width="983" alt="Captura de Tela 2021-06-05 às 14 32 05" src="https://user-images.githubusercontent.com/2266325/120900429-24d7e280-c60b-11eb-9e4e-e8516f478e00.png">

<img width="914" alt="Captura de Tela 2021-06-05 às 14 31 19" src="https://user-images.githubusercontent.com/2266325/120900435-2a352d00-c60b-11eb-9e4a-9466ee8cd15a.png">

<img width="1195" alt="Captura de Tela 2021-06-05 às 14 31 08" src="https://user-images.githubusercontent.com/2266325/120900445-328d6800-c60b-11eb-935f-ab1373646b6c.png">

<img width="984" alt="Captura de Tela 2021-06-05 às 14 32 39" src="https://user-images.githubusercontent.com/2266325/120900464-551f8100-c60b-11eb-8b71-b1302a9c1066.png">

<img width="955" alt="Captura de Tela 2021-06-05 às 14 32 28" src="https://user-images.githubusercontent.com/2266325/120900470-5a7ccb80-c60b-11eb-8c22-10b409929f58.png">

<img width="851" alt="Captura de Tela 2021-06-05 às 14 29 52" src="https://user-images.githubusercontent.com/2266325/120900458-4a64ec00-c60b-11eb-9cfd-83ea403a42e1.png">



