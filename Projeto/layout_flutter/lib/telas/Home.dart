import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:layout_flutter/conexao/dao/atendimentoTicketDAO.dart';
import 'package:layout_flutter/conexao/dto/atendimentoTicket.dart';
import 'package:layout_flutter/telas/Perfil.dart';
import 'package:layout_flutter/telas/ReabreTicket.dart';
import 'package:layout_flutter/telas/inicio.dart';
import 'package:layout_flutter/view/ticketAtendimentoInterfaceDAO.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../conexao/credenciais.dart';
import '../conexao/dao/ticketDAO.dart';
import '../conexao/dao/userDAO.dart';
import '../conexao/dto/ticket.dart';
import '../conexao/dto/user.dart';
import '../view/userInterfaceDAO.dart';
import 'CadastroAtendimento.dart';
import 'CadastroTicket.dart';


class Home extends StatefulWidget {

  
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Ticket> _tickets = []; // Lista para armazenar os tickets do banco
  bool _loadingTickets = true; // Variável para controlar o carregamento dos tickets

  @override
  void initState() {
    super.initState();
    _carregarTickets(); // Chama o método para carregar os tickets quando a tela é carregada
  }


  List<Ticket> verificaListagem(User usuario) {
    TicketDAO ticketDAO = TicketDAO();

    // List<Ticket> _tickets = [];

    _loadingTickets = false;

    if (usuario.acesso == 'Tecnico' || usuario.acesso == 'Admin') {
      List<Ticket> _tickets = ticketDAO.consultarTodos();
      return _tickets;
    } else {
      List<Ticket> _tickets = ticketDAO.consultarTodosPorIdUser(usuario.id);
      return _tickets;
    }
  }


  Future<void> _carregarTickets() async {
    setState(() {
      // _tickets = tickets;
      _loadingTickets = false; // Indica que o carregamento dos tickets foi concluído
    });
  }

  @override
  Widget build(BuildContext context) {
    UserInterfacaDAO dao = UserDAO();
    User usuario = dao.consultarPorNome(Provider.of<UserCredentials>(context).nome);

    List<Ticket> _tickets = verificaListagem(usuario);
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0057A6),
          title: Text(''),
          leading: IconButton(
            icon: Icon(Icons.home), // Ícone de X
            onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //   builder: (context) => Home(),
                //   ),
                // );            
              },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.close), // Ícone de casa
              onPressed: () {
                Provider.of<UserCredentials>(context, listen: false).logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Inicio(),
                  ),
                );
              },
            ),
          ],
        ),

        body: _loadingTickets
            ? Center(child: CircularProgressIndicator()) // Mostra um indicador de carregamento enquanto busca os tickets
            : (_tickets.isEmpty
                ? Center(child: Text('Não existem tickets inseridos!')) // Mostra a mensagem somente se não houver tickets
                : ListView.builder(
                  itemExtent: 60,
                  itemCount: _tickets.length,
                  itemBuilder: (context, index) {
                    Ticket ticket = _tickets[index];

                    Color circleColor;
                    switch (ticket.status) {
                      case 'Novo':
                        circleColor = Color(0xFF006804);
                        break;
                      case 'Em Andamento':
                        circleColor = Color(0xFFFFC700);
                        break;
                      case 'Encerrado':
                        circleColor = Color(0xFF8B0000);
                        break;
                      default:
                        circleColor = Colors.transparent;
                    }

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesTicket(ticket: ticket, circleColor: circleColor,usuario: usuario),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: circleColor,
                          radius: 15,
                        ),
                        title: Text(ticket.titulo, style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Text(ticket.urgencia),
                      ),
                    );
                  },
                )),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BotaoAdicionar(),
              SizedBox(width: 25,),
              BotaoLupa(),
              SizedBox(width: 25,),
              BotaoPerfil(usuario: usuario)
            ],
          ),
        ),
      ),
    );
  }
}


class DetalhesTicket extends StatelessWidget {
  final Ticket ticket;
  final Color circleColor;
  final User usuario;
  UserInterfacaDAO dao = UserDAO();

  DetalhesTicket({required this.ticket, required this.circleColor, required this.usuario});


  @override
  Widget build(BuildContext context) {
    User usuarioTickek = dao.consultar(ticket.idUser!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0057A6),
        title: Text('Detalhes do Ticket'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: circleColor,
              radius: 50,
              child: Text(
                ticket.status,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Text(
                ticket.titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text('Usuario:', style: TextStyle(fontSize: 18))),
                    subtitle: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text(usuarioTickek.nome, style: TextStyle(fontSize: 18))),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text('Setor:', style: TextStyle(fontSize: 18))),
                    subtitle: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text(usuarioTickek.setor, style: TextStyle(fontSize: 18))),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text('Descrição:', style: TextStyle(fontSize: 18))),
                    subtitle: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text(ticket.descricao, style: TextStyle(fontSize: 18))),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text('Tipo:', style: TextStyle(fontSize: 18))),
                    subtitle: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text(ticket.tipo, style: TextStyle(fontSize: 18))),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text('Categoria:', style: TextStyle(fontSize: 18))),
                    subtitle: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text(ticket.categoria, style: TextStyle(fontSize: 18))),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text('Urgência:', style: TextStyle(fontSize: 18))),
                    subtitle: Container(padding: EdgeInsets.fromLTRB(10,0,10,0),child: Text(ticket.urgencia, style: TextStyle(fontSize: 18))),
                  ),
                ],
              ),
            ),            
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            FloatingActionButton(
                  onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AtendimentosTicket(ticket: ticket.id, usuario: usuario.id),
                  ),
                );
              },
              backgroundColor: Color(0xFF0057A6),
              child: Icon(
                Icons.book, 
                size: 40, 
                color: Colors.white, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AtendimentosTicket extends StatelessWidget {
  final int ticket;
  final int usuario;

  AtendimentosTicket({required this.ticket, required this.usuario});

  UserDAO daoUser = UserDAO();

  bool validaTecnico(usuario) {
    var user = daoUser.consultar(usuario);

    if (user.acesso == 'Tecnico' || user.acesso == 'Admin') {return true;} else {return false;}
  }

  AtendimentoTicketDAO dao = AtendimentoTicketDAO();

  List<AtendimentoTicket> atendimentos = [];
  
  void consultarAtendimentosPorId() {
      atendimentos = dao.consultarTodosPorId(ticket); 
      var _loadingAtendimentos = false;
  }

  String formatarHoraMinutos(DateTime data) {
  return DateFormat('dd/MM/yyyy HH:mm').format(data);
  }

  @override
  Widget build(BuildContext context) {
  AtendimentoTicketDAO daoAtend = AtendimentoTicketDAO();

  List<AtendimentoTicket> atendimentos = [];


  bool consultarAtendimentosPorId() {
      atendimentos = daoAtend.consultarTodosPorId(ticket); 
      var _loadingAtendimentos = false;
      return _loadingAtendimentos;
  }

return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0057A6),
          title: Text('Atendimentos'),
        ),
        body: consultarAtendimentosPorId()
            ? Center(child: CircularProgressIndicator()) 
            : (atendimentos.isEmpty
                ? Center(child: Text('Não existem atendimentos inseridos!')) 
                : ListView.builder(
                    itemExtent: 60,
                    itemCount: atendimentos.length,
                    itemBuilder: (context, index) {
                      AtendimentoTicket _atendimento = atendimentos[index];
                      return ListTile(
                        title: Text(_atendimento.detalhe,style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Text(formatarHoraMinutos(_atendimento.horaAtendimento)),
                      );
                    },
                  )
              ),
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Color(0xFF0057A6),
                onPressed: () {
                  // Adicione aqui a lógica para voltar
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
              if (validaTecnico(usuario)) 
              SizedBox(width: 25,),
              if (validaTecnico(usuario)) 
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastroAtendimento(idTicket: ticket,),
                    ),
                  );
                },
                child: Icon(Icons.add),
              ),
              if (validaTecnico(usuario)) 
              SizedBox(width: 25,),
              if (validaTecnico(usuario)) 
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReabreTicket(idTicket: ticket),
                    ),
                  );
                },
                child: Icon(Icons.lock_open),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class BotaoAdicionar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Center(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CadastroTicket(),
              ),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF0057A6),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class BotaoLupa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Center(
        child: FloatingActionButton(
          onPressed: () {
            _exibirTelaFiltro(context);
          },
          child: Icon(Icons.search),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class BotaoPerfil extends StatelessWidget {
  
  var usuario;

  BotaoPerfil({
    required this.usuario
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Center(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => Perfil(nome: usuario.nome, email: usuario.email,cargo: usuario.cargo,setor: usuario.setor,),
              ),
            );
          },
          child: Icon(Icons.person),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

void _exibirTelaFiltro(BuildContext context) {
  String? colunaSelecionada;

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Filtrar por:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _opcoesFiltro('Título', colunaSelecionada, () {
                  setState(() {
                    colunaSelecionada = 'Título';
                  });
                }),
                _opcoesFiltro('Categoria', colunaSelecionada, () {
                  setState(() {
                    colunaSelecionada = 'Categoria';
                  });
                }),
                _opcoesFiltro('Tipo', colunaSelecionada, () {
                  setState(() {
                    colunaSelecionada = 'Tipo';
                  });
                }),
                _opcoesFiltro('Urgência', colunaSelecionada, () {
                  setState(() {
                    colunaSelecionada = 'Urgência';
                  });
                }),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Digite aqui...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implemente a ação do botão de confirmar filtro aqui
                    print('Coluna selecionada: $colunaSelecionada');
                    Navigator.pop(context);
                  },
                  child: Text('Filtrar'),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget _opcoesFiltro(String nomeColuna, String? colunaSelecionada, VoidCallback onPressed) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: colunaSelecionada == nomeColuna ? Colors.green : Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          colunaSelecionada == nomeColuna
              ? Icon(Icons.check, color: Colors.white)
              : SizedBox(width: 24), // Espaço vazio quando não estiver selecionado
          SizedBox(width: 8),
          Text(
            nomeColuna,
            style: TextStyle(color: colunaSelecionada == nomeColuna ? Colors.white : Colors.black),
          ),
        ],
      ),
    ),
  );
}

