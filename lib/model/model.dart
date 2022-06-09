// ignore_for_file: prefer_if_null_operators

class LoginRequestModel {
  String? username;
  String? password;

  LoginRequestModel({
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username?.trim(),
      'password': password?.trim(),
    };

    return map;
  }
}

class AccessTokenResponse {
  final String? token;
  final String? message;

  AccessTokenResponse({this.token, this.message});

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) {
    return AccessTokenResponse(
      token: json["access_token"] != null ? json["access_token"] : null,
      message: json["message"] != null ? json["message"] : null,
    );
  }
}
