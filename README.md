# Get Started

## Requerimentos

* Git intalado
* Docker instalado
* Docker Compose instalado

## Preparando a árvore de pastas

No diretório de usuário crie a seguinte árvore de pastas:

`$ mkdir ~/workspace/rails_app`


Entre na pasta criada _rails_app_:

`$ cd ~/workspace/rails_app`

## Clonando o repositório

Clone o repositório com o comando:

`$ git clone git@github.com:krlosgilson/builtcode_test.git`

Entre na pasta criada _builtcode_test_:

`$ cd builtcode_test`

## Instalando a aplicação

Construa o container da máquina Docker

` $ docker-compose build`

Execute o _bundle install_ do ruby

` $ docker-compose run --rm web bundle install`

Crie o banco de dados

` $ docker-compose run --rm web bundle exec rails db:create`

Execute as migrations

` $ docker-compose run --rm web bundle exec rails db:migrate`

Levante a aplicação

` $ docker-compose up -d`

Abra o navegador e acesse:  http://localhost:3000

## Diversos

O arquivo _bash_aliases_ contém os alias dos comandos do Docker que você pode configurar para seu usuário para minimizar na digitação.

Por ex:

* Entrar na pasta do projeto: _builtcode_test_

* Executar o console do Rails: _run rails c_

* Levantar a aplicação: _up_

* Parar a aplicação: _stop_

* Executar o bundle install do Ruby: _bundle_install_

* Remover arquivo pid do servidor: _remove_pid_
