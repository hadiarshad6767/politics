import 'dart:convert';
import 'dart:io';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import '../LocalStorage/localStorage.dart';
import '../model/model.dart';
import '../settings/settings.dart';

class PrivilgeService {
  Settings settings = Settings();
  localstorageCustom loc = localstorageCustom();

  Future<int> getPrivilges() async {
    var token = settings.GetUnauthToken();
    var url = Uri.parse("http://api.cwiztech.com:8080/v1/login/userprivileges");
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: json.encode({
        'application_ID': settings.GetApplicationID(),
      }),
    );
    if (response.statusCode == 200) {
      List<String?> LoginBottomnames = [];
      List<String?> LoginSidemnames = [];
      List<String?> Sidenames = [];
      List<String?> Bottomnames = [];
      List<dynamic> responseList = json.decode(response.body);
      List<PrivilegesResponse> privilegeslist = [];
      List<PrivilegeCategoryResponse> cprivilegeslist = [];
      for (int i = 0; i < responseList.length; i++) {
        privilegeslist.add(PrivilegesResponse.fromJson(responseList[i]));
        cprivilegeslist.add(PrivilegeCategoryResponse.fromJson(
            json.decode(privilegeslist[i].pcategoryDETAIL)));
      }

      for (int i = 0; i < privilegeslist.length; i++) {
        if (cprivilegeslist[i].pcategoryorder_NO == 1) {
          LoginSidemnames.add(privilegeslist[i].privilegeNAME);
        } else if (cprivilegeslist[i].pcategoryorder_NO == 2) {
          LoginBottomnames.add(privilegeslist[i].privilegeNAME);
        } else if (cprivilegeslist[i].pcategoryorder_NO == 3) {
          Sidenames.add(privilegeslist[i].privilegeNAME);
        } else if (cprivilegeslist[i].pcategoryorder_NO == 4) {
          Bottomnames.add(privilegeslist[i].privilegeNAME);
        } else {
          print('none');
        }
      }
      loc.LoginSideBarStorage.setItem('privilege_name', LoginSidemnames);
      loc.LoginBottomNavBarStorage.setItem('privilege_name', LoginBottomnames);
      loc.SideBarStorage.setItem('privilege_name', Sidenames);
      loc.BottomNavBarStorage.setItem('privilege_name', Bottomnames);

      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
}
