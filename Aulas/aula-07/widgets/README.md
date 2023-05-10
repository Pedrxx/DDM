# Aula 07 - 23/03 

## Intordução ao Flutter

### Conteúdo?
* Aplicação dos conceitos de POO na criação de APPs;
* Utilizando IntelliSense para auxiliar na compreensão do código;
* bibliotecas básicas e importações;
* navegando em bibliotecas para identificar tipos;
* fundamentos para criar um elemento gráfico geral; 
* o que é necessário para criar um widget; 
* skills necessárias para criar qualquer elemento gráfico; 
* Scaffold, Material, Cupertino, Widget;

### Objetivos da aula?
objetivo é fornecer uma base sólida para a criação de aplicativos em Dart e Flutter. conceitos fundamentais de programação orientada a objetos, como a criação de classes e objetos, utilização de recursos como bibliotecas e importações. Elementos gráficos necessários para criar interfaces de usuário atraentes e responsivas, como Scaffold, Material, Cupertino e Widget.


### Bibliotecas básicas e importações
* Material Design Widgets
* Cupertino Widgets
* Dart Async
* HTTP

```dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

```

### Fundamento para criar um elementro gráfico geral;
* Extensão de classe StatelessWidget
Essa classe define um widget que não pode ser modificado depois de criado. Para criar um novo widget, você pode criar uma nova classe que estende StatelessWidget.

```dart
import 'package:flutter/material.dart';

class MeuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Olá mundo!'),
    );
  }
}

```

* Árvore de widgets
Em Flutter, a interface do usuário é representada por uma árvore de widgets. Cada widget é responsável por renderizar uma parte da interface do usuário e pode ter filhos que também são widgets. Para criar uma árvore de widgets, basta aninhar os widgets uns dentro dos outros.

* Método build
Todo widget que estende StatelessWidget deve implementar o método build. Esse método é chamado pelo framework Flutter sempre que o widget precisa ser construído ou reconstruído.
```dart
import 'package:flutter/material.dart';

class MeuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Olá mundo!'),
          Text('Bem-vindo ao Flutter!'),
        ],
      ),
    );
  }
}

```


### o que é necessário para criar um widget

*Definir a classe do widget
Para criar um novo widget, você precisa definir uma classe que estende StatelessWidget ou StatefulWidget. A escolha entre essas duas opções depende se o widget precisa ou não de estado. Se o widget precisar armazenar informações que possam mudar durante a execução do aplicativo, você deve usar StatefulWidget. Caso contrário, use StatelessWidget.

*Implementar o método build
Todo widget que estende StatelessWidget ou StatefulWidget precisa implementar o método build. Esse método é responsável por retornar o widget que representa o elemento gráfico na tela. O método build é chamado sempre que o widget precisa ser construído ou reconstruído.

*Definir as propriedades do widget
Os widgets podem receber propriedades que são definidas pelos seus pais. Essas propriedades são passadas como argumentos para o construtor do widget. Você precisa definir os argumentos do construtor na classe do widget e usá-los para configurar o widget.

*Renderizar a interface do usuário
Por fim, você precisa definir como o widget deve renderizar a interface do usuário. Você pode usar outros widgets como Text, Container, Row, Column, etc. para construir a interface do usuário.

```dart
import 'package:flutter/material.dart';

class MeuWidget extends StatelessWidget {
  final String mensagem;

  MeuWidget({this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(mensagem),
    );
  }
}


MeuWidget(mensagem: 'Olá mundo!');


```

### skills necessárias para criar qualquer elemento gráfico

*Linguagem de programação Dart
Flutter é baseado na linguagem de programação Dart, então é importante ter conhecimento sobre a sintaxe, tipos de dados, operadores, funções, classes, etc. da linguagem Dart.

*Conceitos de programação orientada a objetos (POO)
Flutter é baseado em programação orientada a objetos, então é importante ter conhecimento sobre os conceitos de POO, como encapsulamento, herança e polimorfismo.

*Widgets e layouts
Os widgets são os blocos de construção básicos da interface do usuário em Flutter. É importante ter conhecimento sobre os diferentes tipos de widgets disponíveis em Flutter, bem como os layouts que podem ser usados para posicionar esses widgets na tela.

*Gerenciamento de rotas e navegação
Flutter oferece recursos poderosos para gerenciar rotas e navegação em um aplicativo. É importante entender como usar esses recursos para criar aplicativos com várias telas e fluxos de navegação complexos.

*Integração com APIs e serviços externos
Muitos aplicativos precisam se comunicar com serviços externos, como APIs da web ou bancos de dados. É importante ter conhecimento sobre como integrar um aplicativo Flutter com esses serviços externos.


### Scaffold, Material, Cupertino, Widget

* Scaffold
O Scaffold é um widget que fornece a estrutura básica para a maioria dos aplicativos Flutter. Ele fornece uma barra de aplicativos, um ícone de menu para abrir uma gaveta de navegação e um espaço para colocar o conteúdo principal do aplicativo.

```dart
Scaffold(
  appBar: AppBar(
    title: Text('Meu aplicativo'),
  ),
  body: Center(
    child: Text('Olá, mundo!'),
  ),
);

```

* Material 
O Material é um widget que fornece a implementação do Material Design do Google para as interfaces do usuário em aplicativos Flutter. Ele fornece um conjunto completo de componentes, como botões, caixas de texto, barras de progresso, listas e muito mais, todos com uma aparência e comportamento consistentes.

```dart
Material(
  color: Colors.blue,
  child: InkWell(
    onTap: () {},
    child: Container(
      width: 100,
      height: 100,
      child: Center(
        child: Text(
          'Clique aqui',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
);

```

* Cupertino
O Cupertino é um widget que fornece a implementação do design da interface do usuário da Apple para aplicativos Flutter. Ele fornece um conjunto completo de componentes, como botões, caixas de texto, barras de progresso, listas e muito mais, todos com uma aparência e comportamento consistentes.

```dart
CupertinoButton(
  child: Text('Pressione'),
  onPressed: () {},
  color: Colors.blue,
);

```

* Widget
O Widget é a classe base para todos os widgets em Flutter. Um widget é uma descrição de como parte da interface do usuário deve ser exibida. Ele pode ser uma caixa de texto, um botão, um ícone ou qualquer outra coisa. Um widget pode ter filhos, que também são widgets, formando assim uma árvore de widgets.

```dart
class MyWidget extends StatelessWidget {
  final String message;
  MyWidget({required this.message});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message),
    );
  }
}

```