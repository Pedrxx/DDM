# Aula 09 - 03/04

## Link:
* https://docs.flutter.dev/codelabs/layout-basics

## Layout Flutter

### Conteúdo?
* Row e Column
* Tamanho e alinhamento do eixo (mainAxisSize, mainAxisAlignment, crossAxisAlignment)
* Widget flexível
* Widget expandido


### Row e Column 
Os widgets dentro de um Row ou Column são chamados de filhos e são referidos como pais. dispõe seus widgets horizontalmente e dispõe seus widgets verticalmente.RowColumnRowColumn

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row( // Podemos alterar o Row para Column neste código que ele passará de linha pra coluna.
      children: [
        BlueBox(),
        BlueBox(),
        BlueBox(),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

```


### Tamanho e alinhamento do eixo
Até agora, os BlueBoxwidgets foram compactados juntos (à esquerda ou na parte superior da saída da interface do usuário). Você pode alterar como os BlueBoxwidgets são espaçados usando o tamanho do eixo e as propriedades de alinhamento.

#### mainAxisSize

Dica: MainAxisSize.max é o mainAxisSizevalor padrão da propriedade. Se você não especificar outro valor, o valor padrão será usado.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max, // Mude MainAxisSize.max para MainAxisSize.min
      children: [
        BlueBox(),
        BlueBox(),
        BlueBox(),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

```

#### mainAxisAlignment
A mainAxisAlignment propriedade determina como Row e Column pode posicionar seus filhos nesse espaço extra. mainAxisAlignment tem seis valores possíveis:

* MainAxisAlignment.start
Posiciona os filhos perto do início do eixo principal. (Esquerda para Row, topo para Column)

* MainAxisAlignment.end
Posiciona os filhos perto do final do eixo principal. (Direita para Row, inferior para Column)

* MainAxisAlignment.center
Posiciona os filhos no meio do eixo principal.

* MainAxisAlignment.spaceBetween
Divide o espaço extra uniformemente entre as crianças.

* MainAxisAlignment.spaceEvenly
Divide o espaço extra uniformemente entre as crianças e antes e depois das crianças.

* MainAxisAlignment.spaceAround
Semelhante a MainAxisAlignment.spaceEvenly, mas reduz metade do espaço antes do primeiro filho e depois do último filho para metade da largura entre os filhos.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Podemos mudar o star para qualquer uma dos 6 exemplos citados acima que terá uma reação diferente
      children: [
        BlueBox(),
        BlueBox(),
        BlueBox(),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

```

#### crossAxisAlignment
O eixo transversal de A Rowé vertical e o Columneixo transversal de a é horizontal. A crossAxisAlignmentpropriedade tem cinco valores possíveis:

* CrossAxisAlignment.start
Posiciona os filhos perto do início do eixo transversal. (Cima para Row, Esquerda para Column)

* CrossAxisAlignment.end
Posiciona os filhos perto do final do eixo transversal. (Inferior para Row, Direita para Column)

* CrossAxisAlignment.center
Posiciona as crianças no meio do eixo transversal. (Meio para Row, Centro para Column)

* CrossAxisAlignment.stretch
Estica as crianças ao longo do eixo transversal. (De cima para baixo para Row, da esquerda para a direita para Column)

* CrossAxisAlignment.baseline
Alinha os filhos pelas linhas de base de seus personagens. ( Textsomente classe e requer que a textBaseline propriedade seja definida como TextBaseline.alphabetic. Consulte a seção Widget de texto para obter um exemplo.)

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center, // Podemos mudar o center para qualquer um dos valores citados acima que terá uma reação diferente
      children: [
        BlueBox(),
        BiggerBlueBox(),
        BlueBox(),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

class BiggerBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

```

### Widget flexível
O Flexible widget envolve um widget, de modo que o widget se torna redimensionável. Quando o Flexible widget envolve um widget, o widget se torna o Flexible filho do widget e é considerado flexível . Depois que os widgets inflexíveis são definidos, os widgets são redimensionados de acordo com suas propriedades flex e fit.

* Flex
Compara-se com outras flex propriedades antes de determinar qual fração do espaço restante total cada Flexible widget recebe.


* Fit
Determina se um Flexible widget preenche todo o seu espaço extra.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlueBox(),
        Flexible(
          fit: FlexFit.loose, // O tamanho preferido do widget é usado. (Padrão)
          flex: 1,
          child: BlueBox(),
        ),
        Flexible(
          fit: FlexFit.tight, // Força o widget a preencher todo o espaço extra.
          flex: 1,
          child: BlueBox(),
        ),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

```

### Widget expandido
Semelhante a Flexible, o Expanded widget pode agrupar um widget e forçar o widget a preencher o espaço extra.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlueBox(),
        Expanded(child: BlueBox(),),
        BlueBox(),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

```

### Widget SizedBox
Ao SizedBox agrupa um widget, ele redimensiona o widget usando as propriedades height e width. Quando não envolve um widget, ele usa as propriedades heighte widthpara criar um espaço vazio.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        BlueBox(),
        SizedBox(
          width: 100,
          height: 100,
          child: BlueBox(),
        ),
        BlueBox(),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

```

## Projeto - Lista de Gastos Mensais 

### Optei por fazer com rotas nomeadas por conta de ser mais facil o entendimento e organização

### Telas: 

* Inicio
* Login 
* Cadastro
* Home 
* Sair
* Inlcuir
* Excluir
* Alterar
* Detalhes
* Configurações 
* Gastos

### Relações:

#### A primeira tela será a 'Inicio', onde ela terá dois botões, 'Login' ou 'Cadastro', essas duas telas farão um PushReplacement para a tela 'Home' e dentro terá os botões 'Configurações', 'Gastos' e 'Sair' ('Sair' fará um pushReplacement para a tela 'Inicio' fazendo com que o Login ou Cadastro seja feito novamente), dentro de 'Configuração' estarão as informações de usuario e dentro de 'Gastos' estarão todos os gastos inclusos, dentro de 'Gastos' terá mais 3 botões 'Incluir', 'Alterar', 'Excluir' e 'Detalhes'.










