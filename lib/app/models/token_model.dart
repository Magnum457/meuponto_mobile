import 'dart:convert';

class TokenModel {
  String? accessToken;
  String? refreshToken;
  DateTime? expirationTime;

  TokenModel({this.accessToken, this.refreshToken, this.expirationTime});

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

  String toJson() => json.encode(toMap());

  TokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    expirationTime = json['expirationTime'];
  }
}
