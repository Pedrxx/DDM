import 'package:parametros/parametros.dart' as parametros;

void main(List<String> arguments) {

  exibirDadosPessoais('João', 30);

  exibirSobrenome('João');
  exibirSobrenome('João', 'Silva'); 

  exibirEndereco(rua: 'Rua Principal', cidade: 'São Paulo', estado: 'SP');

  exibirValores(10, 20);
  exibirValores(10, 20, 30);

}

// Exemplo de função com parâmetros posicionais obrigatórios
void exibirDadosPessoais(String nome, int idade) {
  print('Nome: $nome');
  print('Idade: $idade');
}


// Exemplo de função com parâmetros posicionais opcionais
void exibirSobrenome(String nome, [String? sobrenome]) {
  if (sobrenome != null) {
    print('Nome completo: $nome $sobrenome');
  } else {
    print('Nome: $nome');
  }
}

// Exemplo de função com parâmetros nomeados
void exibirEndereco({required String rua,required String cidade,required String estado}) {
  print('Endereço:');
  if (rua != null) {
    print('Rua: $rua');
  }
  if (cidade != null) {
    print('Cidade: $cidade');
  }
  if (estado != null) {
    print('Estado: $estado');
  }
}


// Exemplo de função com parâmetros posicionais
void exibirValores(int valor1, int valor2, [int? valor3]) {
  print('Valores:');
  print('Valor 1: $valor1');
  print('Valor 2: $valor2');
  if (valor3 != null) {
    print('Valor 3: $valor3');
  }
}





