import 'dart:convert';
import 'dart:io';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../settings/settings.dart';

class LoginTokenService {
  Settings settings = Settings();
  Future<AccessTokenResponse> login(LoginRequestModel? requestModel) async {
    var basicAuth = settings.GetAuthBasic();
    var url = Uri.parse(
        "http://api.cwiztech.com:8080/v1/oauth/token?username=${requestModel?.username}&password=${requestModel?.password}&grant_type=password");
    final response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Basic $basicAuth',
      },
    );
    if (response.statusCode == 200) {
      LocalStorage TokenStorage = LocalStorage('Token_storage');
      void addTokenToLocalStorage(var token) {
        TokenStorage.setItem('Access', token);
      }

      addTokenToLocalStorage(response.body);

      return AccessTokenResponse.fromJson(json.decode(response.body));
    } else {
      return AccessTokenResponse.fromJson(
          json.decode(jsonEncode({'message': 'Invalid Input...'})));
    }
  }
}
