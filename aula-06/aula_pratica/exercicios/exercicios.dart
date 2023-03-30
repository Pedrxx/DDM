/*
Atividade 01 
- criar professor com 2 atributos
- alterar atributos do professor para não nulos
- alterar para contrutores nomeados	
- criar um objeto aluno no print
- alterar professor para ter atributos 
  nulos e não nulos
- alterar professor para ter um parameter function
- criar um objeto professor com função nomeada
- criar um objeto professor com função anônima
- criar um objeto professor com arrow function 
- criar um objeto professor com arrow function no print
 */

class Aluno {
  String nome;
  int idade;
  
  Aluno({required this.nome, required this.idade});
}

Aluno aluno = Aluno(nome: 'João', idade: 20);


class Professor {
  String? nome;
  int? idade;
  double? salario;
  
  Professor({required this.nome, required this.idade, this.salario});
  
  void aumentarSalario(double Function(double) fn) {
    if (salario != null) {
      salario = fn(salario!);
    }
  }
  
  void exibirNome() {
    print('Nome do professor: ${this.nome}');
  }
}

// Função nomeada
double aumento10(double salario) {
  return salario * 1.10;
}

