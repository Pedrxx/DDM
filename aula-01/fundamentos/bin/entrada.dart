import 'dart:io';

void main(List<String> arguments) {
  print('sample data input');

  stdin.readByteSync(); //realizando a leitura de linha

  var nomeProduto;
  print('informe o nome do produto:');                //imprimindo o que é desejado
  nomeProduto = stdin.readLineSync();                 //amazendo a leitura em nomeProduto
  print('o nome digitado foi $nomeProduto');          //imprimindo o resultado
  print('informe a descrição do produto:');           //imprimindo o que é desejado
  var descricaoProduto = stdin.readLineSync();        //declarando e amazendo a leitura na variável
  print('o nome digitado foi $descricaoProduto');     //imprimindo o resultado
}

