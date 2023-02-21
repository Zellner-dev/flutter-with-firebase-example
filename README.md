# Exemplo de aplicação utilzando Firebase

![Firebase e Flutter](https://emendes.com/wp-content/uploads/2019/10/flutter-com-dependencias-firebase-banner2.png)

Esse projeto possui objetivo de utilizar um "Realtime Database" do próprio Firebase, 
assim simulando uma API Rest. Aqui conseguimos ver como funcionaria um CRUD simples 
com Firebase.

## Afinal, o que é Firebase?
Firebase é um conjunto de serviços de hospedagem para qualquer tipo de aplicativo.Oferece NoSQL e hospedagem em tempo real de bancos de dados, conteúdo, autenticação social e notificações ou serviços, como um servidor de comunicação em tempo real.

## Como utilizar?

Siga o passo a passo para poder utilizar a aplicação com o seu próprio "Realtime Database".

### Clone a aplicação

```
    git clone https://github.com/Zellner-dev/flutter-with-firebase-example.git
```

### Faça download das dependências do projeto

Obs: o comando deve ser executado dentro da pasta do projeto, correspondendo ao mesmo caminho onde o arquivo pubspec.yaml está. 

```
    flutter pub get
```

## Altere a url do Realtime Database
Em **firebase_app > lib > model > product_list.dart** você pode alterar a variável **_baseUrl** e inserir a url do seu Realtime Database.
```
    final String _baseUrl = "https://[SUA_URL_AQUI]/";
```

## Pronto para rodar!
Após essas configurações você pode rodar a aplicação no seu dispositivo.
# Aviso

- Não é necessário que haja alteração dentro do seu Realtime Database, alterações manuais podem resultar em exceções dentro da aplicação. Você pode apenas criar o Realtime Database e copiar a url dele no projeto.

- O aplicativo irá buscar e tratar as informações que existem dentro do Firebase.

- Quando o aplicativo busca por **[SUA_URL_AQUI]/products.json**, o próprio Firebase cria o caminho caso não exista.

- Repare que dentro do pubspec.yaml a dependência **http** foi adicionada, ela é essêncial para que possam ser feitas chamadas HTTP em sua aplicação.

- Seria muito interessante buscar sobre Providers e gerenciamento de estado. O projeto é simples e utiliza uma maneira simples de controlar o estado, funciona mas há maneiras melhores de controlar o estado da aplicação. Em projetos maiores com persistência de dados e navegação entre diversas telas a necessidade de buscar maneiras diferentes e otimizadas de controlar o estado da sua aplicação é ainda maior.
