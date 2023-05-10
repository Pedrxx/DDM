
void main(List<String> args) {
  void main(List<String> arguments) {
  print('inferência de tipos');
  var nomeProduto = "Ferrero Rocher";     //é uma String
  var descricaoProduto = 'chocolate';     //é uma String
  var precoProduto = 27.2;                //é um double
  var quantidadeProduto = 3;              //é um inteiro
  var produtoDisponivel = true;           //é um booleano
  var valor = null;                       //como o tipo é definido na atribuição, neste caso o valor pode ser nulo
  print('''o produto $nomeProduto é um $descricaoProduto,
    o seu preço é $precoProduto, 
    compramos $quantidadeProduto unidades''');
  }
}