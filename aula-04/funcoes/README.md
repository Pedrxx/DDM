# Aula 04 - 03/03 

## Determinações para as funções

### Foi trabalhado sobre alguns pontos quais melhoram o entendimento e organização tanto das função com do código como um todo, esses são:

### Coesão:
#### Em programação, coesão refere-se ao grau em que as partes de um módulo ou componente estão relacionadas e trabalham juntas para realizar uma tarefa específica. Um alto nível de coesão é desejável, pois torna o código mais fácil de entender e manter.

```dart
class Calculadora {
  double soma(double a, double b) {
    return a + b;
  }
  
  double subtrai(double a, double b) {
    return a - b;
  }
  
  double multiplica(double a, double b) {
    return a * b;
  }
  
  double divide(double a, double b) {
    return a / b;
  }
}

```

#### a classe Calculadora possui métodos que realizam operações matemáticas diferentes, mas relacionadas. Cada método é responsável por uma única tarefa específica, tornando a classe altamente coesa.

### Acoplamento
#### Acoplamento em programação refere-se ao grau em que os módulos ou componentes de um programa dependem uns dos outros. Um baixo acoplamento é desejável, pois torna o código mais fácil de entender, manter e reutilizar.

```dart
class Pessoa {
  String nome;
  
  void cumprimenta() {
    print('Olá, $nome!');
  }
}

class App {
  Pessoa pessoa = Pessoa();
  
  void run() {
    pessoa.nome = 'João';
    pessoa.cumprimenta();
  }
}

```

#### a classe App não depende de outras classes além de Pessoa. A classe Pessoa também não depende de outras classes. Isso torna o código fácil de entender e reutilizar, pois cada classe tem uma única responsabilidade e não depende de outras classes desnecessariamente.

### Legibilidade
#### em programação refere-se ao grau em que o código é fácil de ler e entender. Um código legível é importante para facilitar a manutenção e colaboração no projeto.

```dart
class Pessoa {
  String nome;
  int idade;
  
  Pessoa(this.nome, this.idade);
  
  void apresenta() {
    print('Olá, meu nome é $nome e eu tenho $idade anos.');
  }
}

void main() {
  Pessoa pessoa = Pessoa('João', 30);
  pessoa.apresenta();
}

```

#### a classe Pessoa tem um construtor que define os atributos nome e idade. O método apresenta imprime uma mensagem formatada no console. O código é legível porque as variáveis e métodos têm nomes descritivos e a formatação do código facilita a leitura.
