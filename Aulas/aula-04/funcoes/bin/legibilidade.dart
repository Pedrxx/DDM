void main(List<String> args) {
  
}

// Exemplo de código pouco legível
void f(String s) {for(int i=0;i<s.length;i++)print(s.substring(i)+"\n");}

// Exemplo de código mais legível
void imprimirSubstrings(String texto) {
  for (int i = 0; i < texto.length; i++) {
    print(texto.substring(i) + "\n");
  }
}
