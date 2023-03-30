/* 
Exercício I
Para cada variante de função que estudamos elaborar a seguinte função:
→ função calularSalario - precisa do (i) valor salario e o (ii) valor do desconto. Permitir o desconto somente se haver saldo. No final informar o saldo.

Exercício II
Pensar em um projeto único - quanto maior o escopo melhor - possibilita pensar em vários exemplos
Elabroar funções no escopo do projeto (autêntico)
Fazer comentários de tudo que entendeu
Elabore: 
1) Duas funções sem retorno e sem parâmetro; 
2) Duas funções sem retorno e com parâmetro; 
3) Duas funções com retorno e sem parâmetro;  
4) Duas funções com retorno e com parâmetro;

Exercício III
1) Em relação a sintaxe, quais são as variantes na escrita de uma função? Quais são as especificidades e em que caso pode-se utilziar cada uma?
*/

/*1.*/
void calcularSalario(double salario, double desconto) {
  double saldo = salario;
  
  if (desconto > saldo) {
    print("Não é possível realizar o desconto pois não há saldo suficiente.");
  } else {
    saldo -= desconto;
    print("O desconto foi realizado com sucesso. Saldo atual: R\$${saldo.toStringAsFixed(2)}");
  }
}

/*2. O Escopo é o nosso projeot integrador o qual é uma loja de venda de roupas femininas*/
/*Duas funções sem retorno e sem parâmetro */

void exibirMensagemBoasVindas() {
  print("Seja bem-vinda à nossa loja de roupas femininas!");
}

void exibirHorarioFuncionamento() {
  print("Estamos abertos de segunda a sábado, das 9h às 18h.");
}

/*Duas funções sem retorno e com parâmetro*/

void exibirCatalogo(List<String> roupas) {
  print("Catálogo de produtos:");
  for (var roupa in roupas) {
    print("* $roupa");
  }
}

void exibirDetalhesProduto(String nome, double preco) {
  print("Detalhes do produto:");
  print("- Nome: $nome");
  print("- Preço: R\$ ${preco.toStringAsFixed(2)}");
}

/*Duas funções com retorno e sem parâmetro */

double obterTotalVendas() {
  // Implementação fictícia, apenas para demonstração
  double totalVendas = 15000.0;
  return totalVendas;
}

String obterMelhorVendedora() {
  // Implementação fictícia, apenas para demonstração
  String melhorVendedora = "Maria";
  return melhorVendedora;
}

/*Duas funções com retorno e com parâmetro*/

double calcularDesconto(double preco, double percentualDesconto) {
  double desconto = (percentualDesconto / 100) * preco;
  double novoPreco = preco - desconto;
  return novoPreco;
}

double calcularLucro(double precoCompra, double precoVenda) {
  double lucro = precoVenda - precoCompra;
  return lucro;
}

/* 3. */
/* Algumas das especificidades que devem ser consideradas incluem:

A presença ou não de parâmetros e de retorno
O tipo dos parâmetros e do retorno
A visibilidade da função (por exemplo, se ela deve ser pública ou privada)
A forma como os parâmetros são passados (por valor ou por referência)
A complexidade do código dentro da função e a necessidade de reutilização do mesmo em outras partes do programa.*/
