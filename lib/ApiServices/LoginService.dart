// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:localstorage/localstorage.dart';

import '../LocalStorage/localStorage.dart';
import '../settings/settings.dart';
import '../model/model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Settings settings = Settings();
  localstorageCustom loc = localstorageCustom();
  Future<int> loginService(var token) async {
    var url = Uri.parse("http://api.cwiztech.com:8080/v1/login");
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(
            {"application_CODE": "${settings.GetapplicationCODE()}"}));
    if (response.statusCode == 200) {
      loc.UserInfoStorage.setItem('user_info', response.body);
      return response.statusCode;
    } else {
      print("ErrorLOginService");
      return response.statusCode;
    }
  }
}
// class LoginService {
//   Settings settings = Settings();
//   Future<AccessTokenResponse> login(LoginRequestModel? requestModel) async {
//     var basicAuth = settings.GetAuthBasic();
//     var url = Uri.parse(
//         "http://api.cwiztech.com:8080/v1/oauth/token?username=${requestModel?.username}&password=${requestModel?.password}&grant_type=password");
//     final response = await http.post(
//       url,
//       headers: {
//         HttpHeaders.authorizationHeader: 'Basic $basicAuth',
//       },
//     );
//     if (response.statusCode == 200) {
//       LocalStorage TokenStorage = LocalStorage('Token_storage');
//       void addTokenToLocalStorage(var token) {
//         TokenStorage.setItem('Access', token);
//       }

//       // ignore: unused_element
//       String getTokenFromLocalStorage() {
//         String Token = TokenStorage.getItem('Access');
//         return Token;
//       }

//       addTokenToLocalStorage(response.body);

//       return AccessTokenResponse.fromJson(json.decode(response.body));
//     } else {
//       return AccessTokenResponse.fromJson(
//           json.decode(jsonEncode({'message': 'Invalid Input...'})));
//     }
//   }
// }

// class LoginService {
//   Settings settings = Settings();
//   LocalStorage TokenStorage = LocalStorage('Token_storage');
//   LocalStorage LoginStorage = LocalStorage('Login_storage');
//   LocalStorage privilegesStorage = LocalStorage('privileges_storage');
//   LocalStorage LoginBottomStorage = LocalStorage('Login_Bottom');
//   LocalStorage LoginSideStorage = LocalStorage('Login_Side');
//   PrivilegesResponse privilegesresponse =
//       PrivilegesResponse(pcategoryDETAIL: 'null');
//   void addTokenToLocalStorage(var token) {
//     TokenStorage.setItem('Access', token);
//   }

//   void addLoginToLocalStorage(var login) {
//     LoginStorage.setItem('Login', login);
//   }

//   void addprivilegesToLocalStorage(var privileges) {
//     privilegesStorage.setItem('Privileges', privileges);
//   }

//   void addLoginBottomToLocalStorage(var privilege_name) {
//     // print("addloginbottom");
//     // print(privilege_name);
//     LoginBottomStorage.setItem('privilege_name', privilege_name);
//     // print("addloginbottom2");
//     // TokenStorage.setItem('privilegeorderNO', privilegeorderNO);
//   }
//   // void addLoginBottomToLocalStorage(var privilege_name,var privilegeorderNO ) {
//   //   TokenStorage.setItem('privilege_name', privilege_name);
//   //   TokenStorage.setItem('privilegeorderNO', privilegeorderNO);
//   // }
//   // void addTokenToLocalStorage(var token) {
//   //   TokenStorage.setItem('Access', token);
//   // }

//   String getTokenFromLocalStorage() {
//     String Token = TokenStorage.getItem('Access');
//     return Token;
//   }

//   String getLoginFromLocalStorage() {
//     String Login = LoginStorage.getItem('Login');
//     return Login;
//   }

//   String getprivilegesFromLocalStorage() {
//     String Privileges = privilegesStorage.getItem('Privileges');
//     return Privileges;
//   }

//   String getLoginBottomFromLocalStorage() {
//     String Privileges = LoginBottomStorage.getItem('privilege_name');
//     return Privileges;
//   }

//   Future<AccessTokenResponse> login(LoginRequestModel? requestModel) async {
//     var basicAuth = settings.GetAuthBasic();
//     var url = Uri.parse(
//         "http://api.cwiztech.com:8080/v1/oauth/token?username=${requestModel?.username}&password=${requestModel?.password}&grant_type=password");
//     final response = await http.post(
//       url,
//       headers: {
//         HttpHeaders.authorizationHeader: 'Basic $basicAuth',
//       },
//     );
//     if (response.statusCode == 200) {
//       addTokenToLocalStorage(response.body);
//       var tokenJ = jsonDecode(getTokenFromLocalStorage());
//       var token = tokenJ['access_token'];
//       var url2 = Uri.parse("http://api.cwiztech.com:8080/v1/login");
//       var response2 = await http.post(url2,
//           headers: {
//             "Content-Type": "application/json",
//             "Authorization": "Bearer $token"
//           },
//           body: jsonEncode(
//               {"application_CODE": "${settings.GetapplicationCODE()}"}));
//       if (response2.statusCode == 200) {
//         addLoginToLocalStorage(response2.body);
//         var url3 =
//             Uri.parse("http://api.cwiztech.com:8080/v1/login/userprivileges");
//         var response3 = await http.post(
//           url3,
//           headers: {
//             'Content-Type': 'application/json',
//             HttpHeaders.authorizationHeader: 'Bearer $token',
//           },
//           body: json.encode({
//             'application_ID': settings.GetApplicationID(),
//           }),
//         );
//         if (response3.statusCode == 200) {
//           addprivilegesToLocalStorage(response3.body);
//           //  var a = PrivilegesResponse.fromJson(json.decode(response3.body));
//           // print("response");
//           // print(a);
//           //  String receivedJson = "... Your JSON string ....";
//           List<dynamic> list = json.decode(response3.body);
//           String S = getprivilegesFromLocalStorage();
//           List<dynamic> list1 = json.decode(S);
//           // print('list1');
//           // print(list1[0]);
//           // print(list1[1]);
//           // print(list1[2]);

// //Fact fact = Fact.fromJson(list[0]);
//           // print(list[0]);
//           // print(list[1]);
//           // print(list[2]);
//           //print(list.length);
//           var a0 = PrivilegesResponse.fromJson(list[0]);
//           var a1 = PrivilegesResponse.fromJson(list[1]);
//           var a2 = PrivilegesResponse.fromJson(list[2]);
//           var a3 = PrivilegesResponse.fromJson(list[3]);
//           var a4 = PrivilegesResponse.fromJson(list[4]);
//           var a5 = PrivilegesResponse.fromJson(list[5]);
//           var a6 = PrivilegesResponse.fromJson(list[6]);
//           var a7 = PrivilegesResponse.fromJson(list[7]);
//           // var a = PrivilegesResponse.fromJson(list[0]);

//           // print(a.privilegeNAME);
//           // print(a.pcategoryDETAIL);
//           var b0 = json.decode(a0.pcategoryDETAIL);
//           var b1 = json.decode(a1.pcategoryDETAIL);
//           var b2 = json.decode(a2.pcategoryDETAIL);
//           var b3 = json.decode(a3.pcategoryDETAIL);
//           var b4 = json.decode(a4.pcategoryDETAIL);
//           var b5 = json.decode(a5.pcategoryDETAIL);
//           var b6 = json.decode(a6.pcategoryDETAIL);
//           var b7 = json.decode(a7.pcategoryDETAIL);
//           //var b8 = json.decode(a8.pcategoryDETAIL);
//           //print(c);

//           // var c0 = PrivilegesResponse1.fromJson(b0);
//           // var c1 = PrivilegesResponse1.fromJson(b1);
//           // var c2 = PrivilegesResponse1.fromJson(b2);
//           // var c3 = PrivilegesResponse1.fromJson(b3);
//           // var c4 = PrivilegesResponse1.fromJson(b4);
//           // var c5 = PrivilegesResponse1.fromJson(b5);
//           // var c6 = PrivilegesResponse1.fromJson(b6);
//           // var c7 = PrivilegesResponse1.fromJson(b7);
//           // var c8 = PrivilegesResponse1.fromJson(b);
//           // var c = PrivilegesResponse1.fromJson(b0);
//           // print('0');
//           // print(c0.pcategory_NAME);
//           // print(c0.pcategoryorder_NO);
//           // print(a0.privilegeNAME);
//           // print("----------");
//           // print('1');
//           // print(c1.pcategory_NAME);
//           // print(c1.pcategoryorder_NO);
//           // print(a1.privilegeNAME);
//           // print("----------");
//           // print('2');
//           // print(c2.pcategory_NAME);
//           // print(c2.pcategoryorder_NO);
//           // print(a2.privilegeNAME);
//           // print("----------");
//           // print('3');
//           // print(c3.pcategory_NAME);
//           // print(c3.pcategoryorder_NO);
//           // print(a3.privilegeNAME);
//           // print("----------");
//           // print('4');
//           // print(c4.pcategory_NAME);
//           // print(c4.pcategoryorder_NO);
//           // print(a4.privilegeNAME);
//           // print("----------");
//           // print('5');
//           // print(c5.pcategory_NAME);
//           // print(c5.pcategoryorder_NO);
//           // print(a5.privilegeNAME);
//           // print("----------");
//           // print('6');
//           // print(c6.pcategory_NAME);
//           // print(c6.pcategoryorder_NO);
//           // print(a6.privilegeNAME);
//           // print("----------");
//           // print('7');
//           // print(c7.pcategory_NAME);
//           // print(c7.pcategoryorder_NO);
//           // print(a7.privilegeNAME);
//           // print("----------");
//           addLoginBottomToLocalStorage(a2.privilegeNAME);
//           return AccessTokenResponse.fromJson(json.decode(response.body));
//         } else {
//           return AccessTokenResponse.fromJson(json.decode(response3.body));
//         }
//       } else {
//         return AccessTokenResponse.fromJson(json.decode(response2.body));
//       }
//     } else {
//       return AccessTokenResponse.fromJson(
//           json.decode(jsonEncode({'message': 'Invalid Input...'})));
//     }
//   }
// }
