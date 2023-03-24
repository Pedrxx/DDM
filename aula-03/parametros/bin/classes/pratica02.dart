class Estado{
  final String nome;
  final String sigla;
  final Function calcularPIB;
  Estado({required this.nome,required this.sigla,
  required this.calcularPIB});
}

class Cidade{
  final String nome; 
  final Estado estado;
  final Function calcularDensidadeDemografica;
  Cidade({required this.nome, required this.estado, 
  required this.calcularDensidadeDemografica});
}

void main(List<String> arguments){

  var cidade = Cidade(nome: "Paranavai", 
            estado: Estado(nome: "Parana",
                            sigla: "PR",
                            calcularPIB: (){
                              double consumo = 5000.0;
                              double investimento = 2000.0;
                              double gastoPublico = 10000.0;
                              double exportacoes = 500.0;
                              double importacoes = 600.0;
                              
                              double pib = consumo + investimento + gastoPublico + exportacoes - importacoes;
                              return pib;
                            }), calcularDensidadeDemografica: () {
                              double habitantes = 89454;
                              double area = 1202.266;

                              double densiDemo = habitantes / area;
                              return densiDemo;
                            }
                            );

  print('eu moro na cidade de ${cidade.nome} no estado do ${cidade.estado.nome}, com o PIB de ${cidade.estado.calcularPIB()} e a denisade demografica de ${cidade.calcularDensidadeDemografica()}');
}


/*
  exercício 01 - criar um objeto do tipo Cidade
  com referência anônima na interpolação da função print. 
  Defina mais que um comando para cada FN.
  → criar e entender a sintaxe de uma função anônima
  → entenda quando utilizar ";" e ","

  
  exercício 02 
  - Altere uma das FNs para utilizar Arrow Function
  

  observação:   
  fórmula PIB → (produto + serviço) / habitantes
  Paraná → produto: 1.7, serviço: 1.2 e habitantes 11.08

  fórmula Densidade Demografica →  area / populacao;
  Paranavaí → area = 1202.3, populacao = 88374;
  */
 

