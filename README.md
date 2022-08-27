# README

## Monthly Payment

Está aplicação é um API RESTful escrita em Ruby on Rails para gerenciar pagamentos.

### Detalhes

Este projeto roda em **Ruby** na versão`3.0.2` utilizando **Rails** `7.0.3`. Se precisar você pode utilizar um gerenciador de versões para facilitar como o [ASDF](https://www.lucascaton.com.br/2020/02/17/instalacao-do-ruby-do-nodejs-no-ubuntu-linux-usando-asdf).

### Configuração

Neste projeto, estamos usando o PostgreSQL. Rails usa a role e senha padrão do PostgreSQL, mas se você precisar alterá-los, você pode fazê-lo em [database.yml](config/database.yml).

Para executar siga os passos abaixo:

```console
$ bundle install
$ bin/rails db:create db:migrate
$ bin/rails server
```

Para executar os testes da aplicação:

```console
$ bin/rails test
```

### Collection (Postman)

Você pode fazer a importação da collection para seu postman para facilitar o teste através [deste link](https://www.getpostman.com/collections/fe3f84a29f42bcaab00d).

Para fazer as requisições aos endpoint você deve fazer uma Basic Auth utilizando as credenciais abaixo:
username: admin_ops
password: billing
