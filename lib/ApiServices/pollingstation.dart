import 'dart:convert';
import 'dart:io';

import 'package:localstorage/localstorage.dart';

import '../LocalStorage/localStorage.dart';
import '../settings/settings.dart';
import '../model/model.dart';
import 'package:http/http.dart' as http;

class ElectionService {
  Settings settings = Settings();
  Future<PollingStationResponse> loginService() async {
    var token = settings.GetUnauthToken();
    var url = Uri.parse("http://api.cwiztech.com:8079/v1/apigateway");
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({
          "request_BODY": "",
          "request_TYPE": "GET",
          "request_URI": "electioncontituencypollingstation/1",
          "service_NAME": "ELECTION"
        }));
    // List<dynamic> responselist = [];
    // responselist = jsonDecode(response.body);
    // print(response.body.runtimeType);
    // print(responselist.length);
    // print(responselist[0]);
    if (response.statusCode == 200) {
      // // loc.UserInfoStorage.setItem('user_info', response.body);
      // var a = PollingStationResponse.fromJson(json.decode(response.body));
      // print(a.pollingstationCODE);
      // print(a.description);
      // print(a.contituencyDETAIL.runtimeType);
      // var b = ContiteuncyResponse.fromJson(
      //     json.decode(a.contituencyDETAIL.toString()));
      // print(b.contituencyDESCRIPTION);
      // print(b.description);
      // print(b.contituencyCODE);
      // print(b.electionDETAIL);
      // print(b.district_DETAIL);
      // var e = districtResponse.fromJson(jsonDecode(b.district_DETAIL));
      // print(e.district_NAME);
      // print(e.provinces_ID);
      // var f = provincesResponse.fromJson(e.provinces_ID);
      // print(f.entityname);
      // print(f.description);
      // var c =
      //     ElectionResponse.fromJson(json.decode(b.electionDETAIL.toString()));
      // print(c.election_DATE);
      // //print(c.electiontype_ID);
      // var z = c.electiontype_ID.toString();

      // var d = ElectionTypeResponse.fromJson(c.electiontype_ID);
      // print(d.description);
      // // //print(response.body);
      return PollingStationResponse.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      return PollingStationResponse.fromJson(json.decode(response.body));
    }
  }
}
