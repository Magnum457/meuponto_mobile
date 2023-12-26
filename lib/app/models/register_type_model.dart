import 'dart:convert';

class RegisterTypeModel {
  final int id;
  final String descricao;

  RegisterTypeModel({
    required this.id,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
    };
  }

  factory RegisterTypeModel.fromMap(Map<String, dynamic> map) {
    var registerType = RegisterTypeModel(
      id: map['id'],
      descricao: map['descricao'],
    );
    return registerType;
  }

  String toJson() => json.encode(toMap());

  factory RegisterTypeModel.fromJson(String source) {
    var registerType = RegisterTypeModel.fromMap(json.decode(source));
    return registerType;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterTypeModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          descricao == other.descricao;

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;
}
