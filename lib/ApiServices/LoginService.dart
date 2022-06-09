// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:localstorage/localstorage.dart';

import '../settings/settings.dart';
import '../model/model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Setting settings = Setting();
  final LocalStorage TokenStorage = LocalStorage('Token_storage');
  final LocalStorage LoginStorage = LocalStorage('Login_storage');
  final LocalStorage privilegesStorage = LocalStorage('privileges_storage');

  void addTokenToLocalStorage(var token) {
    TokenStorage.setItem('Access', token);
  }

  void addLoginToLocalStorage(var login) {
    LoginStorage.setItem('Login', login);
  }

  void addprivilegesToLocalStorage(var privileges) {
    privilegesStorage.setItem('Privileges', privileges);
  }

  String getTokenFromLocalStorage() {
    String Token = TokenStorage.getItem('Access');
    return Token;
  }

  String getLoginFromLocalStorage() {
    String Login = LoginStorage.getItem('Login');
    return Login;
  }

  String getprivilegesFromLocalStorage() {
    String Privileges = privilegesStorage.getItem('Privileges');
    return Privileges;
  }

  Future<AccessTokenResponse> Login(LoginRequestModel loginrequest) async {
    var basicAuth = settings.GetAuthBasic();
    var url = Uri.parse(
        "http://api.cwiztech.com:8080/v1/oauth/token?username=${loginrequest.username}&password=${loginrequest.password}&grant_type=password");
    final responseToken = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Basic $basicAuth',
      },
    );
    if (responseToken.statusCode == 200) {
      addTokenToLocalStorage(responseToken.body);
      var tokenJ = jsonDecode(getTokenFromLocalStorage());
      var token = tokenJ['access_token'];
      var url2 = Uri.parse("http://api.cwiztech.com:8080/v1/login");
      var responseLogin = await http.post(url2,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode(
              {"application_CODE": "${settings.GetapplicationCODE()}"}));
      if (responseLogin.statusCode == 200) {
        addLoginToLocalStorage(responseLogin.body);
        var LoginJ = jsonDecode(getLoginFromLocalStorage());
        var User_ID = LoginJ['user_ID'];
        var Application_ID = LoginJ['application_ID'];
        return AccessTokenResponse.fromJson(json.decode(responseToken.body));

        // if (Application_ID == settings.GetApplicationID()) {
        //   var url3 = Uri.parse(
        //       "http://api.cwiztech.com:8080/v1/login/userprivileges/${User_ID}");
        //   var responseprivileges = await http.post(
        //     url3,
        //     headers: {
        //       'Content-Type': 'application/json',
        //       HttpHeaders.authorizationHeader: 'Bearer $token',
        //     },
        //     body: json.encode({
        //       'application_ID': settings.GetApplicationID(),
        //     }),
        //   );
        //   if (responseprivileges.statusCode == 200) {
        //     addprivilegesToLocalStorage(responseprivileges.body);
        //     return AccessTokenResponse.fromJson(
        //         json.decode(responseprivileges.body));
        //   } else {
        //     print(responseprivileges.body);
        //     return AccessTokenResponse.fromJson(
        //         json.decode(responseprivileges.body));
        //   }
        // } else {
        //   Map message = {"message": "Invalid Application access"};
        //   var error = json.encode(message);
        //   return AccessTokenResponse.fromJson(json.decode(error));
        // }
      } else {
        print(responseLogin.body);
        return AccessTokenResponse.fromJson(json.decode(responseLogin.body));
      }
    } else {
      print(responseToken.body);
      return AccessTokenResponse.fromJson(json.decode(responseToken.body));
    }
  }
}
