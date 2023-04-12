# Aula 08 - 29/03 

## Manipulação & Navegação de Widgets

### Conteúdo?
* fundamentos para o posicionamento de elementos gráficos;
* rotas; 
* principais elementos gráficos;
* Classe Scaffold, AppBar, FloatingActionButton, BottomAppBar, Container, outros...
* prototipação;

### Objetivos da aula?
O objetivo de entender esses tópicos é aprender os fundamentos para desenvolver aplicativos móveis com uma interface gráfica. Ao compreender como posicionar elementos gráficos, utilizar rotas, os principais widgets e classes como Scaffold, AppBar, FloatingActionButton, BottomAppBar e Container, é possível criar aplicativos que ofereçam uma boa experiência ao usuário. A prototipação é útil para validar o design antes da implementação completa, economizando tempo e dinheiro.

### O que foi realizado na aula?
Foi criado algumas telas e a navegação entre elas usando as Rotas (Push, PushNamed, PushreplacementNamed). Utilizamos os elementos graficos e posicionamento deles (Alignment, Colors, Width e Heigth). Utilizamos também botões (ElevatedButton), containers, AppBar, Scaffold. 

### Principais dificuldades?
Ainda é uma grande dificuldade as questões simples de Syntax e a estrutura do código, das aulas que foram perdidas anteriormente. 

### Principais aprendizagens?
Os principais entendimentos desta aula foram referente as Rotas e o Posicionamento.

### Fundamentos para o posicionamento de elementos gráficos
#### o Container é um widget que permite definir o tamanho e o posicionamento de seus filhos. Ele pode ser usado para definir o tamanho, a posição e a margem do conteúdo que contém.

```dart
Container(
  margin: EdgeInsets.all(10.0),
  child: Text('Olá, mundo!'),
);

```

#### o Padding é um widget que adiciona um espaço em torno de seu filho. Ele pode ser usado para adicionar espaçamento entre os elementos.

```dart
Padding(
  padding: EdgeInsets.all(10.0),
  child: Text('Olá, mundo!'),
);

```

#### o Row e o Column são widgets que permitem organizar seus filhos em linhas e colunas, respectivamente. Eles podem ser usados para criar layouts flexíveis e responsivos.

```dart
Row(
  children: [
    Text('Olá,'),
    Text('mundo!'),
  ],
);

```

#### o Stack é um widget que empilha seus filhos um sobre o outro. Ele pode ser usado para criar layouts complexos, como sobreposições e animações.
```dart
Stack(
  children: [
    Image.network('https://example.com/image.jpg'),
    Text('Olá, mundo!'),
  ],
);

```

### Rotas
#### Existem dois tipos de rotas em Flutter: rotas nomeadas e rotas anônimas.

#### As rotas anônimas, por outro lado, são criadas dinamicamente em tempo de execução e não têm um nome associado a elas.

#### As rotas nomeadas são definidas no início do aplicativo e têm um nome associado a elas. Quando o usuário deseja navegar para uma determinada tela, essa tela pode ser aberta chamando-se o nome associado à rota.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Aplicação',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/sobre': (context) => SobrePage(),
        '/contato': (context) => ContatoPage(),
      },
    );
  }
}

```

#### Neste exemplo, definimos três rotas nomeadas: /, /sobre e /contato. Cada rota é associada a um widget correspondente: HomePage, SobrePage e ContatoPage.

#### Para navegar para uma determinada tela, podemos usar o Navigator.pushNamed ou somente o Nagivator.push no caso de não nomeadas

```dart
Navigator.pushNamed(context, '/sobre');

Navigator.push(context, '/sobre');

```


### Principais elementos gráficos 
* Texto (Text) - widget usado para exibir texto na interface do usuário.
```dart
Text(
  'Olá, mundo!',
  style: TextStyle(fontSize: 24),
)

```
* Botão (Button) - widget usado para criar botões clicáveis.
```dart
ElevatedButton(
  onPressed: () {
    // Ação a ser executada quando o botão for clicado
  },
  child: Text('Clique aqui'),
)

```
* Campo de texto (TextField) - widget usado para capturar entrada de texto do usuário.
```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Digite aqui',
  ),
  onChanged: (text) {
    // Ação a ser executada sempre que o texto do campo mudar
  },
)

```
* Lista (ListView) - widget usado para exibir uma lista de itens.
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
)

```
* Imagem (Image) - widget usado para exibir imagens na interface do usuário.
```dart
Image.network(
  'https://picsum.photos/200/300',
  width: 200,
  height: 300,
)

```
* Ícone (Icon) - widget usado para exibir ícones na interface do usuário.
```dart
Icon(
  Icons.star,
  color: Colors.yellow,
  size: 32,
)

```
* Caixa de diálogo (Dialog) - widget usado para exibir uma caixa de diálogo modal.
```dart
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: Text('Título da caixa de diálogo'),
      content: Text('Conteúdo da caixa de diálogo'),
      actions: [
        TextButton(
          onPressed: () {
            // Ação a ser executada quando o botão for clicado
          },
          child: Text('Ok'),
        ),
      ],
    );
  },
)

```
* Barra de navegação (AppBar) - widget usado para criar uma barra de navegação no topo da tela.
```dart
Scaffold(
  appBar: AppBar(
    title: Text('Título da barra de navegação'),
  ),
  body: ...,
)

```
* Tabela (Table) - widget usado para exibir dados em forma de tabela.
```dart
Table(
  children: [
    TableRow(
      children: [
        Text('Item 1'),
        Text('Valor 1'),
      ],
    ),
    TableRow(
      children: [
        Text('Item 2'),
        Text('Valor 2'),
      ],
    ),
  ],
)

```
* Grade (GridView) - widget usado para exibir uma grade de itens.
```dart
GridView.builder(
  itemCount: items.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
  ),
  itemBuilder: (context, index) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Text('Item ${index+1}'),
      ),
    );
  },
)

```

### Prototipação
#### A prototipação em Flutter é uma forma rápida e eficiente de criar interfaces de usuário e testar diferentes ideias de design. Abaixo estão alguns trechos de código para criar elementos comuns de prototipação em Flutter, alguns deles ja foram citados acima:

* Botão
* Campos de Texto
* Card
* List View
* Ícone
* Imagem

