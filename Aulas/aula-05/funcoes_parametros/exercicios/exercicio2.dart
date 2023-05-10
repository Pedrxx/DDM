/*
Exercício 01 - implemente as funções
a) Função que solicite um número e realizar validações: (1) se é par; (2) maior que zero; (3) se é um número primo.
função "hospedeira" : solicitar um número
b) Função que solicite a data inicial e retorne quanto tempo passou em: (1) anos; (2) dias; e (3) horas.
c) Função que solicite a quantidade de dias trabalhadas, valor que recebe por hora e calcule o salarário para: (1) auxiliar; (2) júnior; e (3) pleno.
Exercício 02 - para cada função "hospedeira", defina uma função anônima.
*/

/*a) */

import 'dart:io';

bool validarPar(int numero) {
  return numero % 2 == 0;
}

bool validarMaiorQueZero(int numero) {
  return numero > 0;
}

bool validarPrimo(int numero) {
  if (numero == 2 || numero == 3) {
    return true;
  }

  if (numero == 1 || numero % 2 == 0) {
    return false;
  }

  for (int i = 3; i <= numero ~/ 2; i += 2) {
    if (numero % i == 0) {
      return false;
    }
  }

  return true;
}

void solicitarNumero() {
  print("Digite um número: ");
  int numero = int.parse(stdin.readLineSync()!);

  bool par = () {
    return validarPar(numero);
  }();

  bool maiorQueZero = () {
    return validarMaiorQueZero(numero);
  }();

  bool primo = () {
    return validarPrimo(numero);
  }();

  print("O número é par: $par");
  print("O número é maior que zero: $maiorQueZero");
  print("O número é primo: $primo");
}


/*b) */

void calcularTempoPassado() {
  print("Digite a data inicial (no formato dd/mm/aaaa): ");
  String dataInicial = stdin.readLineSync()!;

  List<String> partesData = dataInicial.split("/");
  int dia = int.parse(partesData[0]);
  int mes = int.parse(partesData[1]);
  int ano = int.parse(partesData[2]);

  DateTime dataAtual = DateTime.now();
  DateTime dataInicialFormatada = DateTime(ano, mes, dia);

  int anos = dataAtual.year - dataInicialFormatada.year;
  int dias = dataAtual.difference(dataInicialFormatada).inDays;
  int horas = dataAtual.difference(dataInicialFormatada).inHours;

  print("Tempo passado desde a data inicial:");
  print("Anos: $anos");
  print("Dias: $dias");
  print("Horas: $horas");
}

/*c) */
double calcularSalario(int diasTrabalhados, double valorHora, String cargo) {
  switch (cargo) {
    case "auxiliar":
      return diasTrabalhados * 6 * valorHora;
    case "júnior":
      return diasTrabalhados * 8 * valorHora;
    case "pleno":
      return diasTrabalhados * 10 * valorHora;
    default:
      return 0.0;
  }
}

void solicitarDadosSalario() {
  print("Digite a quantidade de dias trabalhados: ");
  int diasTrabalhados = int.parse(stdin.readLineSync()!);
  
}