import 'dart:convert';

class TokenModel {
  final String accessToken;
  final String refreshToken;
  final DateTime expirationTime;

  TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expirationTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expirationTime': expirationTime.toIso8601String(),
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    var token = TokenModel(
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      expirationTime: DateTime.parse(map['expirationTime']),
    );
    return token;
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) {
    var token = TokenModel.fromMap(json.decode(source));
    return token;
  }
}
