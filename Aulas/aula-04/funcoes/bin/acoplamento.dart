import 'package:funcoes/funcoes.dart' as funcoes;

void main(List<String> arguments) {
  
}

// Exemplo de acoplamento alto
class ClasseA {
  ClasseB b = ClasseB();
  void metodoA() {
    b.metodoB();
  }
}

class ClasseB {
  void metodoB() {
    print('Método B');
  }
}

// Exemplo de acoplamento baixo
class ClasseC {
  InterfaceB b;
  ClasseC(this.b);
  void metodoC() {
    b.metodoB();
  }
}

abstract class InterfaceB {
  void metodoB();
}

class ClasseD implements InterfaceB {
  void metodoB() {
    print('Método B');
  }
}

