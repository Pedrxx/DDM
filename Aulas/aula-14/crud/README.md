# Aula 14 - 01/06/2023

# CRUD básico E CRUD com associação

## Diário de Aula

ATÉ 21h → 2 CRUD BÁSICO FUNCIONANDO

ATÉ 22H30
* 1 CRUD COM ASSOCIAÇÃO FUNCIONANDO OU ELABORAR O MATEREIAL DE ESTUDO DO PROJETO COM CRUD COM ASSOCIAÇÃO
* MATERIAL DE ESTUDO
* Quais bibliotecas necessárias
    firebase_core: Biblioteca do FlutterFire que permite inicializar o Firebase no seu aplicativo Flutter.
    cloud_firestore: Biblioteca do FlutterFire que fornece acesso ao serviço de banco de dados Firestore do Firebase.

* Qual a sequência correta?
    Configurar o Firebase: Crie um projeto no Firebase Console, configure seu aplicativo Flutter e adicione o arquivo google-services.json ao seu projeto.
    Configurar o FlutterFire: Adicione as dependências firebase_core e cloud_firestore ao arquivo pubspec.yaml do seu projeto Flutter e execute o comando flutter pub get.
    Implementar o CRUD: Crie uma classe que gerencie as operações CRUD (como DatabaseService) e use a classe cloud_firestore para executar essas operações.
.
* ExplExplicação dos papéis das classes e dos principais pontos de todas as classes envolvidas.
    Classe DatabaseService:

    collection: É uma referência à coleção no Firestore onde os dados serão armazenados.
    getItems(): Recupera todos os documentos da coleção e retorna uma lista de Map<String, dynamic> contendo os dados dos documentos.
    addItem(Map<String, dynamic> item): Adiciona um novo documento à coleção com os dados fornecidos.
    updateItem(String id, Map<String, dynamic> item): Atualiza um documento existente na coleção com os dados fornecidos, usando o ID do documento.
    deleteItem(String id): Exclui um documento existente da coleção, usando o ID do documento.
    
    Classe MyApp:

    databaseService: Uma instância da classe DatabaseService para realizar as operações CRUD.
    ElevatedButton (Listar Itens): Ao ser pressionado, chama o método getItems() da databaseService para obter e exibir a lista de itens do banco de dados.
    ElevatedButton (Adicionar Item): Ao ser pressionado, chama o método addItem() da databaseService para adicionar um novo item ao banco de dados.

* Desenvolvimento do Projeto
2 CRUD BÁSICO
2 CRUD COM ASSOCIAÇÃO


## Passo a Passo para configuração do [Firebase](https://blog.flutterando.com.br/seu-primeiro-crud-com-flutter-e-firestore-parte-1-be3e9392a301)

* Iniciando um projeto no Firebase
Você deve acessar o console do Firebase e clicar em criar Adicionar Projeto .

Com o projeto criado, prossiga até Desenvolver/Database/Criar banco de dados. Para este exemplo pode ser iniciado com a opção Iniciar no modo de teste .

Instale o [Slidy](https://pub.dev/packages/slidy#-readme-tab-)

Depois, basta executar o script:

pub global activate slidy

Para atualizar:

slidy upgrade

* Criando o projeto Flutter
Como já temos o Flutter e o Slidy instalado, basta executar o script slidy create humanresources .

O slidy criou o projeto já na arquitetura bloc, além disso adicionou as dependências:

bloc_pattern: um package que facilita a implementação da arquitetura bloc.
dio: um client http.
rxdart: uma implementação do reactiveX para trabalhar com Streams em Dart.

* Adicionando referencia ao Firestore

No arquivo android/app/build.gradle , em defaultConfig, pegar o valor da propriedade applicationId

Depois de registrar, você deve fazer o download do arquivo google-services.json e colocá-lo em android/app .

Em android/build.gradle, adicionar a linha:

classpath 'com.google.gms:google-services:3.2.1' .
Em android/app/build.gradle adicionar:

multiDexEnabled true em defaultConfig.
implementation 'com.android.support:multidex:1.0.3' em dependencies.
apply plugin: 'com.google.gms.google-services'. na última linha do arquivo.


