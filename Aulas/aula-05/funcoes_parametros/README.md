# Aula 05 - 10/03

## Tipo de Funções 

### Conteúdo:
* Function Parameter (FP);
* Chamando uma função com FP por meio de uma função nomeada;
* Função anônima;
* Chamando uma função com FP por meio de uma função anônima;
* Diferenças entre função anônima e nomeada;
* Arrow Function;

### Function Parameter (FP)
#### Em Dart, uma função pode ter parâmetros que especificam os valores que a função espera receber como entrada. Isso permite que as funções sejam mais flexíveis e reutilizáveis.

```dart
void olaNome(String name) {
  print('Olá, $name!');
}

void main() {
  olaNome('Pedro');
}

```

### FP por meio de uma função nomeada
#### Em Dart, uma função pode ser chamada como argumento de outra função usando seu nome.

```dart
void greet(String name) {
  print('Olá, $name!');
}

void doSomething(Function function) {
  function('João');
}

void main() {
  doSomething(greet);
}


```

### Função anônima
#### Uma função anônima é uma função definida sem um nome específico. Geralmente é usada como um valor em um contexto em que uma função é necessária, mas não é necessária uma função nomeada.

```dart
void minhaFuncao(int a, int b, Function(int, int) operacao) {
  print(operacao(a, b));
}

void main() {
  minhaFuncao(2, 3, (a, b) => a + b); // imprime 5
}

```

#### uma função anônima é definida como (a, b) => a + b. Essa função anônima é passada como o terceiro argumento para minhaFuncao e é chamada por meio do parâmetro operacao.

### FP por meio de uma função anônima
#### Assim como uma função nomeada, uma função anônima também pode ser usada para chamar uma função com FP.
```dart
void minhaFuncao(int a, int b, Function(int, int) operacao) {
  print(operacao(a, b));
}

void main() {
  minhaFuncao(2, 3, (a, b) => a + b); // imprime 5
}

```