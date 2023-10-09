import 'dart:convert';

import 'package:meuponto_mobile/app/models/token_model.dart';

class UserModel {
  int? id;
  String? nome;
  String? cpf;
  TokenModel? token;

  UserModel({
    this.id,
    this.nome,
    this.cpf,
    this.token,
  });

  UserModel.empty()
      : id = 0,
        nome = '',
        cpf = '',
        token = null;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    var user = UserModel(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      cpf: map['cpf'] ?? '',
      token: map['token'],
    );
    return user;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) {
    var user = UserModel.fromMap(json.decode(source));
    return user;
  }
}
