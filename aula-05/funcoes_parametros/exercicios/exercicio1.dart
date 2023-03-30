/*
(1) Criar um projeto chamado de funções anônimas;
(2) Criar 4 arquivos: funcoes, parâmetros do tipo função, funções anônimas, arrow functions;
(3) Para cada arquivo, criar o  método show - sem retorno, sem parâmetro com um print de teste;e
(4) Chamar o método show de cada aquivo no método main.
*/

// Arquivo: funcoes.dart

void cadastrarProduto() {
print("Cadastro de produto realizado com sucesso!");
}

// Arquivo: arrow_functions.dart

double calcularImposto(double valor) => valor * 0.1;

// Arquivo: parametros_funcao.dart

void emitirNotaFiscal(void Function(double) calculaImposto) {
double valorCompra = 100.0;
double imposto = calcularImposto(valorCompra);
double valorTotal = valorCompra + imposto;

print("Valor da compra: $valorCompra Reais" );
print("Valor do imposto: $imposto Reais");
print("Valor total: $valorTotal Reais");
}

// Arquivo: funcoes_anonimas.dart

void listarProdutos() {
List<String> produtos = ["Blusa", "Calça", "Vestido"];

produtos.forEach((produto) {
print(produto);
});
}

void main() {
cadastrarProduto(); // Cadastro de produto realizado com sucesso!

emitirNotaFiscal(calcularImposto);
// Valor da compra: R$ 100.0
// Valor do imposto: R$ 10.0
// Valor total: R$ 110.0

listarProdutos();
// Blusa
// Calça
// Vestido

double valorImposto = calcularImposto(50.0);
print("Valor do imposto: $valorImposto Reais" );
// Valor do imposto: R$ 5.0
}