import 'dart:math';

import 'package:funcoes/funcoes.dart' as funcoes;

void main(List<String> arguments) {

cumprimentar();

exibirMensagem('Essa é uma mensagem de exemplo.');

int numero = gerarNumeroAleatorio();
print('Número aleatório: $numero');

String nomeCompleto = juntarNomes('João', 'Silva');
print('Nome completo: $nomeCompleto');
}

// Exemplo de função sem retorno e sem parâmetro
void cumprimentar() {
  print('Olá, como vai?');
}

// Exemplo de função sem retorno e com parâmetro
void exibirMensagem(String mensagem) {
  print(mensagem);
}


// Exemplo de função com retorno e sem parâmetro
int gerarNumeroAleatorio() {
  var random = Random();
  return random.nextInt(10);
}

// Exemplo de função com retorno e com parâmetro
String juntarNomes(String nome, String sobrenome) {
  return '$nome $sobrenome';
}






