import 'package:layout_flutter/conexao/dto/user.dart';

List<User> users = [
  User(id: 1, nome: 'admin', email: 'admin@prats.com.br', setor: 'TI',cargo: 'Gerente', senha: 'admin', acesso: "Admin"),
  User(id: 2, nome: 'user', email: 'user@prats.com.br' ,setor: 'Auditoria', cargo: 'Auditor', senha: 'user', acesso: "User"),
  User(id: 3, nome: 'tecnico', email: 'tecnico@prats.com.br' ,setor: 'TI', cargo: 'Tecnico', senha: 'tecnico', acesso: "Tecnico"),
  User(id: 4, nome: 'user2', email: 'user2@prats.com.br' ,setor: 'Expedição', cargo: 'Coletor', senha: 'user', acesso: "User"),
];