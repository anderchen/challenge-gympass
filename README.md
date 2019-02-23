# Challenge Gympass

App criado para resolver o challenge do Gympass, utilizando o Ruby como a linguagem principal.
Com a intenção de imitar o Ruby on Rails em uma escala menor, foi utilizado o Active Record para organizar a database e o MVC como padrão de arquitetura.

Challenge do gympass: <https://github.com/Gympass/interview-test>

## Começando o App

Para fazer com que o app funcione, é necessário seguir alguns pré-requisitos a serem cumpridos.

### Pré-requisitos

Antes de tudo, é necessário checar se há Active Record instalado no equipamento.

Caso não tenha, rode no seu terminal o código abaixo:
```
gem install activerecord
```

## Lançar o app
Após realizar os comandos Rake acima, digite o comando abaixo no terminal para rodar o app:

```
ruby app.rb
```

### Considerações

Outros comando úteis

```
rake db:create      # Cria a database
rake db:migrate     # Faz as migrações
rake db:seed        # Popula a database
rake db:drop        # Destrói a database
rake db:version     # Pega a número da versão do schema atual
rake db:timestamp   # Faz um timestamp para os arquivos de migração
```
#### Sem log do Active Record
Desativei os logs do Active Record para deixar o View no Terminal mais legível e menos poluído.

Caso queira ver os logs do Active Record vá para o arquivo 'config/application.rb' e descomente a seção responsável por isso.
