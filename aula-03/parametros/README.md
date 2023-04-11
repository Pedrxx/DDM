# Aula 03 - 24/02

## Parametros das Funções 

### Funções 
#### Blocos de código que realizam uma tarefa específica e podem ser chamadas várias vezes no programa. Elas podem receber parâmetros e retornar valores.

```dart
    tipoRetorno nomeFuncao(parametros) {
    // corpo da função
    return valorRetorno;
    }
```

### Parâmetros posicionais
#### São parâmetros que são passados para a função pela ordem em que são definidos na assinatura da função. Eles são obrigatórios e devem ser fornecidos na chamada da função.

```dart
void main() {
    print(soma(10, 5)); // 15
    }

    int soma(int a, int b) {
    return a + b;
    }
```

### Parâmetros posicionais não obrigatórios/valor padrão
#### São parâmetros que não precisam ser passados para a função, pois possuem um valor padrão. Eles são opcionais e podem ser ignorados na chamada da função.

```dart
    void main() {
    print(soma(10)); // 15
    }

    int soma(int a, [int b = 5]) {
    return a + b;
    }

```

### Parâmetros nomeados
#### São parâmetros que são passados para a função pelo seu nome. Eles são opcionais e podem ser fornecidos em qualquer ordem.

```dart
    void main() {
    print(soma(a: 10, b: 5)); // 15
    }

    int soma({required int a, required int b}) {
    return a + b;
    }

```

### Parâmetros nomeados obrigatórios
#### São parâmetros que são passados para a função pelo seu nome e são obrigatórios. Se não forem fornecidos na chamada da função, o Dart lançará um erro.

```dart
    void main() {
    print(soma(a: 10, b: 5)); // 15
    }

    int soma({required int a, required int b}) {
    return a + b;
    }

```