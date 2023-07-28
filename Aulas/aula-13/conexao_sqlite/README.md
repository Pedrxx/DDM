# Aula 13 - 25/05/23

### Toda a aula foi aplicada no [Projeto](https://github.com/Pedrxx/DDM/tree/main/Projeto/layout_flutter)...

### Atividade
É ESSENCIAL entender cada parâmetro do openDatabase
acesse https://pub.dev/packages/sqflite e descubra 

- para que passamos o path?
O path é o caminho onde o arquivo do banco de dados SQLite será guardado no dispositivo. É como dizer ao programa onde encontrar o arquivo. Assim, podemos ter acesso ao banco de dados e executar operações nele.

- o que é para que serve o version? o que ocorre se mudar? 
A version é um número que usamos para controlar a versão do nosso banco de dados SQLite. Quando mudamos a versão, estamos dizendo que fizemos alguma alteração na estrutura do banco de dados, como adicionar ou modificar tabelas ou colunas. Se mudarmos a versão, o método onCreate é chamado para atualizar o banco de dados com as alterações que fizemos.

- quando o onCreate é executado? A cada chamada do método criar, onCreate é executado?
O onCreate é executado apenas quando o banco de dados é criado pela primeira vez. Ele não é executado toda vez que chamamos o método _initDatabase, a menos que a versão do banco de dados seja alterada. O onCreate é acionado automaticamente quando abrimos o banco de dados pela primeira vez com uma determinada versão. Depois que o banco de dados é criado, chamadas subsequentes ao método _initDatabase usarão a versão existente e não executarão novamente o onCreate.


### Dependências/Bibliotecas
Adicione as dependências necessárias:<br>
→ sqflite - biblioteca para trabalhar com sqlite;<br>
→ path - pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO).<br>
```cmd
flutter pub add sqflite;
flutter pub add path;  
```
## Definindo script BD
### Criando arquivo do script BD.
Crie um arquivo no projeto para o script do BD. <br>
Para organização, eu criei o arquivo dentro de uma nova pasta "sqlite" da pasta "database". <br>
<img src="https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/04%20aula/arquivos/criar_script.png" alt="Alt text" title="Optional title">

### Comandos SQL
No arquivo criado, defini os comandos para criar tabela(s) e registro(s) - uma para criar tabela e outro do tipo array para inserções.
```dart
//comando para criar tabela
const criarContato = '''
 CREATE TABLE contato(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL 
  )
''';
//array de inserções
const insercoesContato = [
'''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Pietro','(11) 9 9874-5656','pietro@email.com','https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
''',
'''
INSERT INTO contato(nome, telefone, email, url_avatar)
VALUES ('Maitê','(11) 9 9632-8578', 'maite@email.com','https://cdn.pixabay.com/photo/2021/01/17/09/11/woman-5924366_960_720.jpg')
''',
'''
INSERT INTO contato (nome, telefone, email, url_avatar)
VALUES ('Hortência','(11) 9 9562-3356','hortencia@email.com','https://cdn.pixabay.com/photo/2021/01/24/09/28/girl-5944691_960_720.jpg')
'''];
```
## Definindo a classe de Database
### Criar um arquivo no projeto
Para organização, eu criei o arquivo chamado de "conexao.dart" dentro de uma nova pasta "sqlite" da pasta "database".<br>
<img src="https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/04%20aula/arquivos/criar_arquivo.png" alt="Alt text" title="Optional title">

### criar a classe no arquivo criado
```dart
class Conexao{

}
```
### Definir atributos necessários
→ Como é um app local para um único usuário, vamos criar uma única conexão para todo o APP. Para isso, vamos definir o atributo de database e o de controle. 
> Como são atributos que serão utilizadas somente na classe, definimos o moficador de acesso privato "_".
```dart
import 'package:sqflite/sqlite_api.dart'; //importanção

class Conexao{
  static late Database _conexao;  //atributo do database
  static bool _fechado = true;    //atributo de controle
}
```
### definir a lógica de inicialização do Database
```dart
import 'package:sqflite/sqflite.dart';

class Conexao{
  static late Database _database; 
  static bool _fechado = true;

  static Future<Database> criar() async {
    if(_fechado){     // a 1º vez, database é fechado, então 
         // definimos comandos para inicializar o database
      _fechado = false; // no atributo de controle, definimos que agora o database não é fechado
    }
    return _database; //retornamos o database
  }
}
```

### definir os comandos para inciar o database
```dart
import 'package:path/path.dart';
import 'package:persistencia/database/sqlite/scriptbd.dart';
import 'package:sqflite/sqflite.dart';

class Conexao{
  static late Database _database; 
  static bool _fechado = true;

  static Future<Database> criar() async {
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db');  //definindo o camminho do database
      //deleteDatabase(path);                                    //caso queira apagar tudo antes, descomente esta linha
      _database = await openDatabase(                  //chamando o método que que abre o database
        path,                                          // informando o caminho
        version: 1,                                    // versão
        onCreate: (db, v){                             // criando os elementos (tabelas e registros) do BD
          db.execute(criarContato);
          insercoesContato.forEach(db.execute);
        }, 
      );
      _fechado = false;
    }
    return _database;
  }
}
```

## Alguns pontos imporntantes
### Uso do static
```dart
class Conexao{
  // os atributos estão com o modificador static porque são usados dentro do método estático
  // elementos static só aceitam elementos static
  static late Database _database; 
  static bool _fechado = true;

  //definimos static para gerar um único database para o app
  //static pertence a classe e não ao objetio - tomar cuidado com concorrência!!!
  static Future<Database> criar() async {
    if(_fechado){  
      // comandos para iniciar o database
      _fechado = false;
    }
    return _conexao;
  }
}
```
>>> só é possível verificar se o database é fechado com o uso do static
>>> com static, o elemento é da classe e assim, todos os objetos irão acessar este ponto!!! 
>>> se não usar o modificador static, cada objeto teria o seu próprio database e assim, não teria sentido verificar se é fechado.

### Uso do async await
```dart
class Conexao{
  static Future<Database> criar() async { //como estamos utilizando o await dentro da função, precisamos tornar a função assíncrona, colocando async
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db'); // precisamos "esperar" (await) o resultado para seguir a execução
      _database = await openDatabase( // precisamos "esperar" (await) a abertuda do database para retorná-lo
       [...]
      );
      _fechado = false;
    }
    return _database;
  }
}
```

## Implementação DAO SQLite (SQFLite)

### VERIFIQUE AS Dependências/Bibliotecas → JÁ FIZEMOS NA IMPLEMENTAÇÃO DA CLASSE DE CONEXÃO)
→ sqflite - biblioteca para trabalhar com sqlite;<br>
→ path - pacote que fornece operações comuns para manipulação de caminhos: junção, divisão, normalização, etc (independente do SO).<br>
```cmd
flutter pub add sqflite
flutter pub add path  
```

## Definindo a classe DAO
### Criar um arquivo no projeto
Para organização, eu criei o arquivo chamado de "contato_dao_sqlite.dart" dentro de uma nova pasta "dao" da pasta "sqlite".
projeto<br>
- lib<br>
-- database<br>
--- sqlite<br>
---- dao<br>
----- contato_dao_sqlite.dart<br>

### criar a classe no arquivo criado
```dart
class ContatoDAOSQLite{

}
```
### Implementar a interface "ContatoInterfaceDAO"
→ Implementar a interface que definimos durante o desenvolvimento dos widgets. <br>
>Não esqueça de fazer a importação!
```dart
import 'package:persistencia/view/interface/contato_interface_dao.dart'; //importanção

class ContatoDAOSQLite implements ContatoInterfaceDAO{

}
```
### Criar os métodos da interface
→ Ao implementar a interface "ContatoInterfaceDAO" será necessário implementar todos os métodos da interface;<br>
→ "Create 4 missing overrrides".
<img src="https://github.com/heliokamakawa/-engenharia-de-software-2023-DDM/blob/main/2%C2%BA%20trimestre/04%20aula/arquivos/interface_dao.png" alt="Alt text" title="imagem da interface dao">
Implementando os métodos, a nossa classe deverá ficar da seguinte forma:
```dart
import 'package:persistencia/view/dto/contato.dart';
import 'package:persistencia/view/interface/contato_interface_dao.dart';

class ContatoDAOSQLite implements ContatoInterfaceDAO{
  @override
  Future<Contato> consultar(int id) {
    // TODO: implement consultar
    throw UnimplementedError();
  }

  @override
  Future<List<Contato>> consultarTodos() {
    // TODO: implement consultarTodos
    throw UnimplementedError();
  }

  @override
  Future<bool> excluir(id) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  Future<Contato> salvar(Contato contato) {
    // TODO: implement salvar
    throw UnimplementedError();
  }
}
```
### Implementação consultarTodos
- Antes de mais nada, precisamos entender que na consulta, os dados retornados pelo SQFLite tem o formato de "map<dynamic,dynamic>".<br>
- O primeiro dynamic refere-se ao nome da coluna e o segundo o valor. <br>
>Exemplo: 
>Se tiver a tabela estado no BD, onde há uma coluna nome, com o registro PARANÁ, <br>
>na consulta, será retornado um map: {nome: 'PARANÁ'}<br>
- Assim, para facilitar as coisas, vamos criar o método de conversão que recebe este "map" e retorne a nossa classe "Contato".<br>
```dart
  Contato converterContato(Map<dynamic,dynamic> resultado){
    return Contato(
      id : resultado['id'],
      nome: resultado['nome'],
      telefone: resultado['telefone'],
      email: resultado['email'],
      urlAvatar:  resultado['url_avatar']
    );
  }
```
Agora sim, implementamos o "consultarTodos".
```dart
  @override
  Future<List<Contato>> consultarTodos() async {
    Database db = await  Conexao.criar(); 
    List<Contato> lista = (await db.query('contato')).map<Contato>(converterContato).toList();
    return lista;
  }
```
#### IMPORTANTE SABER!!! - Implementação consultarTodos  
```dart
Database db = await  Conexao.criar(); 
/*
Aqui estamos pegando referência de Database - da nossa classe de Conexao. 
Lembre-se que, na 1º vez, database é criado e partir da 2º, o que foi criado na 1º vez, será reutilizado.
*/
```

```dart
db.query('contato')) 
// método do SQFLite para fazer a consulta de todos os contatos
```
```dart
.map<Contato>(converterContato).toList(); 
/*
o map é um método da biblioteca do dart que percorre uma lista, executa a função (que recebe como parâmetro) e retorna uma NOVA lista.<br>
no nosso caso, estamos: <br>
(1) percorrendo a lista do tipo map que veio da consulta no BD; <br>
(2) chamando o nosso método "converterContato" para converter map (de cada registro do resultado) para a nossa classe contato; <br>
(3) retornar uma nova lista do tipo contato.
E por fim, o map, de fato, retorna o tipo Iterable, e assim, precisamos chamar o método toList para convertê-lo em uma lista.
<br>
*/
```
### Implementação consultar

```dart
  @override
  Future<Contato> consultar(int id) async {
    Database db = await  Conexao.criar();
    List<Map> maps = await db.query('Contato',where: 'id = ?',whereArgs: [id]);
    if (maps.isEmpty) throw Exception('Não foi encontrado registro com este id');
    Map<dynamic,dynamic> resultado = maps.first;
    return converterContato(resultado);
  }
```
#### IMPORTANTE SABER!!! - Implementação consultar

```dart
await db.query('Contato',where: 'id = ?',whereArgs: [id]);
/*
Para consultar um contato específico, passamos como parâmetro o nome e o valor do filtro de consulta. 
No caso, estamos informando que o nome da coluna é id, e o valor é id que vem do parâmetro.
*/
```

```dart
if (maps.isEmpty) throw Exception('Não foi encontrado registro com este id');
/*
Aqui estamos tratando no caso em que não for encontrato registro do id passado no parâmetro.
*/
```

```dart
 Map<dynamic,dynamic> resultado = maps.first;
/*
Armazenando resultado...
*/
```

```dart
return converterContato(resultado);
/*
Convertendo com o nosso método e retornando o contato.
*/
```
### Implementação excluir
```dart
  @override
  Future<bool> excluir(id) async {
    Database db = await  Conexao.criar();
    var sql ='DELETE FROM contato WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }
```
#### IMPORTANTE SABER!!! - Implementação excluir
```dart
int linhasAfetas = await db.rawDelete(sql, [id]);
return linhasAfetas > 0;
/*
db.rawDelete tente executar o comando e retorno a quantidade de linhas afetadas no BD.<br>
Assim, pegamos a referências de linhas afetadas (int linhasAfetas = ...).<br>
E retornarmos se deu certo (return linhasAfetas > 0) - se linhasAfetadas for maior que 0, significa que a exclusão foi realizada.
*/
```
### Implementação salvar

```dart

  @override
  Future<Contato> salvar(Contato contato) async {
    Database db = await  Conexao.criar();
    String sql;
    if(contato.id == null){
      sql = 'INSERT INTO contato (nome, telefone,email,url_avatar) VALUES (?,?,?,?)';
      int id = await db.rawInsert(sql,[contato.nome,contato.telefone,contato.email,contato.urlAvatar]);
      contato = Contato(
        id: id,
        nome: contato.nome, 
        telefone: contato.telefone, 
        email: contato.email, 
        urlAvatar: contato.urlAvatar);
    }else{
      sql = 'UPDATE contato SET nome = ?, telefone =?, email = ?, url_avatar= ? WHERE id = ?';
      db.rawUpdate(sql,[contato.nome, contato.telefone, contato.email, contato.urlAvatar, contato.id]);
    }
    return contato;
  }
```
#### IMPORTANTE SABER!!! - Implementação salvar
O método salvar é utilizado em 2 situações: (1) alteração de um contato existente e (2) inserção de um novo contato. <br>
Assim, precisamos definir uma lógica para tratar estes 2 casos...
```dart
    if(contato.id == null){  //se id é nulo, então é um novo registro
      [...]                   //desta forma, aqui definimos comandos para salvar um novo contato
    }else{                  //caso contrário, se tiver id, significa que é alteração
      [...]                   //desta forma, aqui definimos comandos para alterar um contato
    }
    return contato;
  ```
  ```dart
  // comando para salvar um novo contato no BD.
      // definindo SQL.
      sql = 'INSERT INTO contato (nome, telefone,email,url_avatar) VALUES (?,?,?,?)';
      // comando para salvar no SQLite (db.rawInsert). 
      // db.rawInsert tenta salvar e se der certo, retorna o id gerado automaticamente
      int id = await db.rawInsert(sql,[contato.nome,contato.telefone,contato.email,contato.urlAvatar]);
      /*
      definimos a classe de Contato do tipo final - os valroes não podem ser alterados depois de definidos,
      assim, para retornar o contato com id, precisamos criar um novo contato e inserir o id.
      */
      contato = Contato(
        id: id,
        nome: contato.nome, 
        telefone: contato.telefone, 
        email: contato.email, 
        urlAvatar: contato.urlAvatar);
```
```dart
    //comando para alterar
      //sql para alterar de forma mais segura, no qual, preparamos os parâmetros (?) para serem inseridos - PreparedStatement
      sql = 'UPDATE contato SET nome = ?, telefone =?, email = ?, url_avatar= ? WHERE id = ?';
      //chamando o método "db.rawUpdate" da biblioteca sqflite para alterar 
      //o método "db.rawUpdate" solicita 2 parâmetros: (1) o SQL de alteração e (2) os parâmetros para substituir '?' do comando SQL.
      db.rawUpdate(sql,[contato.nome, contato.telefone, contato.email, contato.urlAvatar, contato.id]);
```