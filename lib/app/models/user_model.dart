import 'dart:convert';

import 'day_record_model.dart';
import 'token_model.dart';

class UserModel {
  String? nome;
  String? cpf;
  TokenModel? token;
  List<DayRecordModel>? dayRecord;

  UserModel({
    this.nome,
    this.cpf,
    this.token,
  });

  UserModel.empty()
      : nome = '',
        cpf = '',
        token = null;

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cpf': cpf,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    var user = UserModel(
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
