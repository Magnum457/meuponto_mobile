class TokenModel {
  String? token;
  String? type;
  int? exp;

  TokenModel({this.token, this.type, this.exp});

  TokenModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['type'] = type;
    data['exp'] = exp;
    return data;
  }
}
