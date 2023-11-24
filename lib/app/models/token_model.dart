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
      'expirationTime': expirationTime,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    var token = TokenModel(
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      expirationTime: map['expirationTime'],
    );
    return token;
  }

  String toJson() {
    return json.encode({
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expirationTime': expirationTime.toIso8601String(),
    });
  }

  factory TokenModel.fromJson(String source) {
    final tokenMap = json.decode(source);
    var token = TokenModel.fromMap({
      'accessToken': tokenMap['accessToken'],
      'refreshToken': tokenMap['refreshToken'],
      'expirationTime': DateTime.parse(tokenMap['expirationTime']),
    });
    return token;
  }
}
