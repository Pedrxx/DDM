import 'package:fundamentos/fundamentos.dart' as fundamentos;

void main(List<String> arguments) {
  print('tipos de variávei em Dart'); 
  String meuNome = 'Paulo';    
  int minhaIdade;   
  minhaIdade = 30; 
  minhaIdade = 25;
  minhaIdade = 18;

  
  double peso = 80.7;         
  bool eProgramador = true;   

  print('nome: '+meuNome); 
  print('nome ${meuNome}, idade: ${minhaIdade}'); 
  print('nome $meuNome, idade: $minhaIdade'); 
  print("nome $meuNome, idade: $minhaIdade"); 
  print('''
    Meu nome é $meuNome,
    minha idade é $minhaIdade,
    meu peso é $peso,
    sou programador? $eProgramador!
  ''');
  
  String nomeProduto = 'Chokito';                   
  String descricaoProduto = 'chocolate';            
  String nomeComDescricaoProduto = nomeProduto +' '+ descricaoProduto; 
  double precoProduto = 27.2;                       
  int quantidadeProduto = 3;                        
  bool produtoDisponivel = true;                    
  double total = precoProduto * quantidadeProduto;  
  
  print('''
    Produto: $nomeProduto,
    Descrição: $descricaoProduto,
    Nome e descrição: $nomeComDescricaoProduto
    Preço: $precoProduto,
    Quantidade: $quantidadeProduto,
    Total: $total
  ''');
  
  String? nome = null; 
}
