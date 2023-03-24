import 'package:aula_pratica/aula_pratica.dart' as aula_pratica;

void main() {
  // Instanciando um objeto do tipo Placa com referência anônima
  final minhaPlaca = Placa(
    nome: "Placa Teste",
    circuito: Circuito(
      serial: "ABC123",
      marca: Marca(
        nome: "Marca Teste",
        descricao: "Descrição Marca Teste",
        buscarContato: 123456789
      ),
      peca: Peca(
        modelo: "Modelo Teste",
        estoque: 10,
        categoria: Categoria(
          nome: "Categoria Teste",
          descricao: "Descrição Categoria Teste"
        ),
        marca: Marca(
          nome: "Marca Teste",
          descricao: "Descrição Marca Teste",
          buscarContato: 123456789
        ),
        tipo: Tipo(
          nome: "Tipo Teste",
          sigla: "TT",
          peso: 1.0
        )
      ),
      quantidade: 1
    )
  );

  // Exemplo de uso de métodos do objeto
  print(minhaPlaca.nome);
  minhaPlaca.testar();
  minhaPlaca.registrarLog();
}

class Categoria {
  final String nome;
  final String descricao;

  Categoria({required this.nome, required this.descricao});
}

class Marca {
  final String nome;
  final String descricao;
  final int buscarContato;

  Marca({required this.nome, required this.descricao, required this.buscarContato});
}

class Tipo {
  final String nome;
  final String sigla;
  final double peso;

  Tipo({required this.nome, required this.sigla, required this.peso});
}

class Peca {
  final String modelo;
  final int estoque;
  final Categoria categoria;
  final Marca marca;
  final Tipo tipo;

  Peca({required this.modelo, required this.estoque, required this.categoria, required this.marca, required this.tipo});

  double calcularCusto() {
    // Implementação do cálculo do custo
    return 0.0;
  }
}

class Circuito {
  final String serial;
  final Marca marca;
  final Peca peca;
  final int quantidade;

  Circuito({required this.serial, required this.marca, required this.peca, required this.quantidade});
}

class Placa {
  final String nome;
  final Circuito circuito;
  
  Placa({required this.nome, required this.circuito});

  void testar() {
    // Implementação do teste da placa
  }

  void registrarLog() {
    print("Log Registrado");
  }
}



