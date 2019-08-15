# README

### Requisitos:

```
* ruby 2.6.3
* Postgresql 9.6
* Nodejs v10+
```

### Configuração

1. Altere o arquivo database.yml na pasta **config** para suas configurações de base de dados.

2. Criação da base

```
rails db:setup
```

3. Configuração da api Key

```
EDITOR=nano rails credentials:edit
```

### Docker

1. Cria o container

```
  docker-compose build web
```

2. Inicia serviço

```
docker-compose up -d web
```

3. Encontra a Container ID

```
docker ps
```

4. Conecta sessão to terminal ao container

```
docker attach [Container ID]
```

Obs.: Os passos 3 e 4 são necessário para que o byebug funcione com o docker.

### Descrição

Uma aplicação web que permite converter moedas e cripto moedas de diversos formatos.

![](docs/index.png)
