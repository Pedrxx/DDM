import 'package:funcoes_parametros/funcoes_parametros.dart' as funcoes_parametros;

void main(List<String> arguments) {

  imprimirNome("João", "Silva"); // Saída: "Nome completo: João Silva"

  print(somar(3, 4)); // Saída: 7

  print(dobrar(4)); // Saída: 8

}

// Function Parameter
void imprimirNome(String primeiroNome, String sobrenome) {
  print("Nome completo: $primeiroNome $sobrenome");
}

// Anonymous Funciton
var somar = (int a, int b) {
  return a + b;
};

// Arrow Function 
int dobrar(int x) => x * 2;



