
void main(List<String> arguments) {
  print('sample const/final variables');

  const String nomeProduto = 'Prestígio';
  final String descricaoProduto = 'chocolate';

  const nomeProduto2 = 'Chokito';
  final descricaoProduto2 = 'doce';

  double precoProduto = 27.2;
  int quantidadeProduto = 3;
  bool produtoDisponivel = true; //só pode ser true ou false

  print('''
    produto 1: $nomeProduto $descricaoProduto
    produto 2: $nomeProduto2 $descricaoProduto2
  ''');
}

