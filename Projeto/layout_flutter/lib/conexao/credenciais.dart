import 'package:flutter/material.dart';

class UserCredentials with ChangeNotifier {
  
  String _nome = '';
  String _senha = '';

  String get nome => _nome;
  String get senha => _senha;

  void logar(String nome, String senha) {
    _nome = nome;
    _senha = senha;
    notifyListeners();
  }

  void logout() {
    _nome = '';
    _senha = '';
    notifyListeners();
  }
}
