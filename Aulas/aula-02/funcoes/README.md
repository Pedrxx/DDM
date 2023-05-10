# Aula 02 - 17/02

## Aula introdutória a linguagem Dart

### Conteúdo:
* Sintaxe básica da linguagem; 
* Tipos de variáveis; 
* Tipos dinâmicos;
* const e final;
* Conversão de dados;
* Variáveis de Inferência;
* Null Safery - qual motivo? quando utilizar? versão? conversão? vantagens?

### Tipos de Variáveis
#### Em Dart, existem vários tipos de variáveis, incluindo int, double, String, bool e outros. Aqui está um exemplo de como declarar e usar variáveis em Dart:

```dart
  int age = 25;
  double height = 1.75;
  String name = 'Maria';
  bool isStudent = true;
  
```

### Inferência de tipo
#### Em Dart, você pode usar a inferência de tipo para deixar o compilador determinar o tipo de variável com base no valor atribuído a ela. Aqui está um exemplo:

```dart
  print('$name tem $age anos de idade, $height de altura e é estudante: $isStudent');
```
### Tipo dinâmico
#### Em Dart, você também pode usar o tipo dinâmico para permitir que uma variável armazene qualquer tipo de valor. Aqui está um exemplo:

```dart
  dynamic value = 25;
  print('O valor de value é $value');
  
  value = 'Maria';
  print('O valor de value é $value');
  
  value = true;
  print('O valor de value é $value');
```

### Constantes
#### Em Dart, você pode usar a palavra-chave const para criar constantes. Aqui está um exemplo:

```dart
  const double pi = 3.14;
  const int secondsInMinute = 60;
  const int minutesInHour = 60;
  
  final int totalSeconds = secondsInMinute * minutesInHour;
  
  print('Existem $totalSeconds segundos em uma hora');
```

### Entrada de dados
#### Em Dart, você pode usar a biblioteca dart:io para receber entrada de dados do usuário. Aqui está um exemplo:

```dart
  print('Qual é o seu nome?');
  String name = stdin.readLineSync();
  
  print('Olá, $name!');
```
### Conversão de dados
#### Em Dart, você pode usar métodos como toString(), parseInt(), parseDouble() e outros para converter dados entre diferentes tipos. Aqui está um exemplo:

```dart
  String ageString = '25';
  int age = int.parse(ageString);
  
  String heightString = '1.75';
  double height = double.parse(heightString);
  
  print('Você tem $age anos de idade e $height de altura');
```