// ignore_for_file: non_constant_identifier_names

import 'dart:io';

void main(List<String> arguments) {
  print("Exercício 2 de fixação\n\n");

  //variáveis que serão utilizadas nas funções criadas
  int? opcaoMenuPrincipal;
  int? opcaoMenuSecundario;
  String? login;
  String? senha;
  int? num_pedido;
  double? precoProduto;
  double? precoFrete;

  //um laço de repetição para mostrar sempre o menu principal até o usuário decidir sair
  while (true) {
    // demonstra o menu principal
    menuPrincipal();
    opcaoMenuPrincipal = int.parse(stdin.readLineSync()!);

    // um bloco de if para determinar a opção desejada, poderia ter usado um switch e com isso diminuiria a qtde de código
    if (opcaoMenuPrincipal == 1) {
      // demonstra o menu específico para o login e senha
      menuLoginSenha();
      opcaoMenuSecundario = int.parse(stdin.readLineSync()!);

      if (opcaoMenuSecundario == 1) {
        // Solicita o login ao usuário
        print("Informe o seu login: ");
        login = stdin.readLineSync()!;

        // Solicita a senha ao usuário
        print("Informe sua senha: ");
        senha = stdin.readLineSync()!;

        // Execute a verificação conforme os dados informados via parâmetros
        print(verificarLoginSenhaUm(login, senha));
      } else if (opcaoMenuSecundario == 2) {
        // Execute a verificação e a solicitação de dados será dentro da função pois ela não recebe parâmetros
        print(verificarLoginSenhaDois());
      } else if (opcaoMenuSecundario == 3) {
        // Solicita o login ao usuário
        print("Informe o seu login: ");
        login = stdin.readLineSync()!;

        // Solicita a senha ao usuário
        print("Informe sua senha: ");
        senha = stdin.readLineSync()!;

        // Execute a verificação conforme os dados informados via parâmetros
        verificarLoginSenhaTres(login, senha);
      } else if (opcaoMenuSecundario == 4) {
        // Execute a verificação e a solicitação de dados será dentro da função pois ela não recebe parâmetros
        verificarLoginSenhaQuatro();
      } else {
        print("Opção inválida! Tente novamente!");
      }
    } else if (opcaoMenuPrincipal == 2) {
      // demonstra o menu específico do pedido preço final
      menuPedidoPrecoFinal();

      opcaoMenuSecundario = int.parse(stdin.readLineSync()!);

      if (opcaoMenuSecundario == 1) {
        // Solicita o número do pedido ao usuário
        print("Informe o número do pedido: ");
        num_pedido = int.parse(stdin.readLineSync()!);

        // Solicita o preço do produto ao usuário
        print("Informe o preço do produto: ");
        precoProduto = double.parse(stdin.readLineSync()!);

        // Solicita o preço do frete ao usuário
        print("Informe o preço do frete: ");
        precoFrete = double.parse(stdin.readLineSync()!);

        // Execute a verificação conforme os dados informados via parâmetros
        print(calcularValorFinalPedidoUm(num_pedido, precoProduto, precoFrete));
      } else if (opcaoMenuSecundario == 2) {
        // Execute a verificação e a solicitação de dados será dentro da função pois ela não recebe parâmetros
        print(calcularValorFinalPedidoDois());
      } else if (opcaoMenuSecundario == 3) {
        // Solicita o número do pedido ao usuário
        print("Informe o número do pedido: ");
        num_pedido = int.parse(stdin.readLineSync()!);

        // Solicita o preço do produto ao usuário
        print("Informe o preço do produto: ");
        precoProduto = double.parse(stdin.readLineSync()!);

        // Solicita o preço do frete ao usuário
        print("Informe o preço do frete: ");
        precoFrete = double.parse(stdin.readLineSync()!);

        // Execute a verificação conforme os dados informados via parâmetros
        calcularValorFinalPedidoTres(num_pedido, precoProduto, precoFrete);
      } else if (opcaoMenuSecundario == 4) {
        // Execute a verificação e a solicitação de dados será dentro da função pois ela não recebe parâmetros
        calcularValorFinalPedidoQuatro();
      } else {
        // Apresenta a mensagem abaixo se o usuário informar um número diferente das opções
        print("Opção inválida! Tente novamente!");
      }
    } else if (opcaoMenuPrincipal == 3) {
      // Apresenta a mensagem abaixo se o usuário informar quer sair do sistema
      print("Você selecionar, até mais!");
      break;
    } else {
      // Apresenta a mensagem abaixo se o usuário informar um número diferente das opções
      print("Opção inválida! Tente novamente!");
    }
  }
}

//#region MENUS

// Menu principal com as opções
void menuPrincipal() {
  print('''Escolha a opção desejada:
  1 - Verificar login e senha
  2 - Calcular o valor final do pedido
  3 - Sair
  ''');
}

// Menu login e senha com as opções;
void menuLoginSenha() {
  print('''Escolha a opção desejada para verificar o login e senha:
    1 - Função com retorno e com parâmetro
    2 - Função com retorno e sem parâmetro
    3 - Função sem retorno e com parâmetro
    4 - Função sem retorno e sem parâmetro
    ''');
}

// Menu pedido e  com as opções;
void menuPedidoPrecoFinal() {
  print('''Escolha a opção desejada para calcular o valor final do pedido:
    1 - Função com retorno e com parâmetro
    2 - Função com retorno e sem parâmetro
    3 - Função sem retorno e com parâmetro
    4 - Função sem retorno e sem parâmetro
    ''');
}

//#endregion MENUS

//#region Funções Login e Senha

//Função com retorno e com parâmetro
String verificarLoginSenhaUm(String login, String senha) {
  if (login == "admin") {
    if (senha == "1234567890") {
      return "O usuário $login existe no sistema! Mas infelizmente pode fazer nada  :(";
    } else {
      return "Usuário e/ou senha incorretos!";
    }
  } else {
    return "Esse usuário não existe!";
  }
}

// Função com retorno e sem parâmetro
String verificarLoginSenhaDois() {
  String? login;
  String? senha;

  print("Informe o seu login: ");
  login = stdin.readLineSync()!;

  print("Informe sua senha: ");
  senha = stdin.readLineSync()!;

  if (login == "admin") {
    if (senha == "1234567890") {
      return "O usuário $login existe no sistema! Mas infelizmente pode fazer nada  :(";
    } else {
      return "Usuário e/ou senha incorretos!";
    }
  } else {
    return "Esse usuário não existe!";
  }
}

// Função sem retorno e com parâmetro
void verificarLoginSenhaTres(String login, String senha) {
  String? verificacao;

  if (login == "admin") {
    if (senha == "1234567890") {
      verificacao =
          "O usuário $login existe no sistema! Mas infelizmente pode fazer nada  :(";
    } else {
      verificacao = "Usuário e/ou senha incorretos!";
    }
  } else {
    verificacao = "Esse usuário não existe!";
  }

  print(verificacao);
}

// Função sem retorno e sem parâmetro
void verificarLoginSenhaQuatro() {
  String? login;
  String? senha;
  String? verificacao;

  print("Informe o seu login: ");
  login = stdin.readLineSync()!;

  print("Informe sua senha: ");
  senha = stdin.readLineSync()!;

  if (login == "admin") {
    if (senha == "1234567890") {
      verificacao =
          "O usuário $login existe no sistema! Mas infelizmente pode fazer nada  :(";
    } else {
      verificacao = "Usuário e/ou senha incorretos!";
    }
  } else {
    verificacao = "Esse usuário não existe!";
  }

  print(verificacao);
}

//#endregion Funções Login e Senha

//#region Funções calcular o pedido informado

//Função com retorno e com parâmetro
String calcularValorFinalPedidoUm(
    int num_pedido, double precoProduto, double precoFrete) {
  if (num_pedido > 0) {
    double valorFinal = precoProduto + precoFrete;
    return "O pedido $num_pedido, tem o valor final de $valorFinal reais";
  } else {
    return "O número do pedido não pode ser 0 (zero)!";
  }
}

//Função com retorno e sem parâmetro
String calcularValorFinalPedidoDois() {
  int? num_pedido;
  double? precoProduto;
  double? precoFrete;

  print("Informe o número do pedido: ");
  num_pedido = int.parse(stdin.readLineSync()!);

  print("Informe o preço do produto: ");
  precoProduto = double.parse(stdin.readLineSync()!);

  print("Informe o preço do frete: ");
  precoFrete = double.parse(stdin.readLineSync()!);

  if (num_pedido > 0) {
    double valorFinal = precoProduto + precoFrete;
    return "O pedido $num_pedido, tem o valor final de $valorFinal reais";
  } else {
    return "O número do pedido não pode ser 0 (zero)!";
  }
}

// Função sem retorno e com parâmetro
void calcularValorFinalPedidoTres(
    int num_pedido, double precoProduto, double precoFrete) {
  String? resultado;

  if (num_pedido > 0) {
    double valorFinal = precoProduto + precoFrete;
    resultado = "O pedido $num_pedido, tem o valor final de $valorFinal reais";
  } else {
    resultado = "O número do pedido não pode ser 0 (zero)!";
  }

  print(resultado);
}

// Função sem retorno e sem parâmetro
void calcularValorFinalPedidoQuatro() {
  int? num_pedido;
  double? precoProduto;
  double? precoFrete;
  String? resultado;

  print("Informe o número do pedido: ");
  num_pedido = int.parse(stdin.readLineSync()!);

  print("Informe o preço do produto: ");
  precoProduto = double.parse(stdin.readLineSync()!);

  print("Informe o preço do frete: ");
  precoFrete = double.parse(stdin.readLineSync()!);

  if (num_pedido > 0) {
    double valorFinal = precoProduto + precoFrete;
    resultado = "O pedido $num_pedido, tem o valor final de $valorFinal reais";
  } else {
    resultado = "O número do pedido não pode ser 0 (zero)!";
  }

  print(resultado);
}
