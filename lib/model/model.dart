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
  final String? error;

  AccessTokenResponse({this.token, this.message, this.error});

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) {
    return AccessTokenResponse(
      token: json["access_token"] != null ? json["access_token"] : null,
      message: json["message"] != null ? json["message"] : null,
      error: json["error"] != null ? json["error"] : null,
    );
  }
}

class PrivilegesResponse {
  final int? privilegeID;
  final int? privilegeorderNO; //privileges_numbering ///projects
  final int? pcategoryID;
  final String? privilegeNAME;
  final String pcategoryDETAIL;
  ////pcategory_DETAIL///
  // final String? token;
  // final String? message;
  // final String? error;

  PrivilegesResponse({
    this.privilegeID,
    this.privilegeorderNO,
    this.pcategoryID,
    this.privilegeNAME,
    required this.pcategoryDETAIL,
  });

  factory PrivilegesResponse.fromJson(Map<String, dynamic> json) {
    return PrivilegesResponse(
      privilegeID: json["privilege_ID"] != null ? json["privilege_ID"] : null,
      privilegeorderNO:
          json["privilegeorder_NO"] != null ? json["privilegeorder_NO"] : null,
      pcategoryID: json["pcategory_ID"] != null ? json["pcategory_ID"] : null,
      privilegeNAME:
          json["privilege_NAME"] != null ? json["privilege_NAME"] : null,
      pcategoryDETAIL:
          json["pcategory_DETAIL"] != null ? json["pcategory_DETAIL"] : null,
    );
  }
}

class PollingStationResponse {
  final String? pollingstationCODE;
  final String? description;
  final String? contituencyDETAIL;
  final String? error;

  PollingStationResponse(
      {this.pollingstationCODE,
      this.description,
      this.contituencyDETAIL,
      this.error});

  factory PollingStationResponse.fromJson(Map<String, dynamic> json) {
    return PollingStationResponse(
      pollingstationCODE: json["pollingstation_CODE"] != null
          ? json["pollingstation_CODE"]
          : null,
      description: json["description"] != null ? json["description"] : null,
      contituencyDETAIL: json["contituency_DETAIL"] != null
          ? json["contituency_DETAIL"]
          : null,
      error: json["error"] != null ? json["error"] : null,
    );
  }
}

class ContiteuncyResponse {
  final String? contituencyDESCRIPTION;
  final String? contituencyCODE;
  final String? description;
  final String? electionDETAIL;
  final String? error;
  final dynamic? district_DETAIL;

  ContiteuncyResponse(
      {this.contituencyDESCRIPTION,
      this.contituencyCODE,
      this.description,
      this.electionDETAIL,
      this.district_DETAIL,
      this.error});

  factory ContiteuncyResponse.fromJson(Map<String, dynamic> json) {
    return ContiteuncyResponse(
      contituencyDESCRIPTION: json["contituency_DESCRIPTION"] != null
          ? json["contituency_DESCRIPTION"]
          : null,
      contituencyCODE:
          json["contituency_CODE"] != null ? json["contituency_CODE"] : null,
      description: json["description"] != null ? json["description"] : null,
      electionDETAIL:
          json["election_DETAIL"] != null ? json["election_DETAIL"] : null,
      district_DETAIL:
          json["district_DETAIL"] != null ? json["district_DETAIL"] : null,
      error: json["error"] != null ? json["error"] : null,
    );
  }
}

class districtResponse {
  final String? district_NAME;

  final String? error;
  final dynamic? provinces_ID;

  districtResponse({this.district_NAME, this.provinces_ID, this.error});

  factory districtResponse.fromJson(Map<String, dynamic> json) {
    return districtResponse(
      district_NAME:
          json["district_NAME"] != null ? json["district_NAME"] : null,
      provinces_ID: json["provinces_ID"] != null ? json["provinces_ID"] : null,
      error: json["error"] != null ? json["error"] : null,
    );
  }
}

class provincesResponse {
  final String? entityname;

  final String? error;
  final dynamic? description;

  provincesResponse({this.entityname, this.description, this.error});

  factory provincesResponse.fromJson(Map<String, dynamic> json) {
    return provincesResponse(
      entityname: json["entityname"] != null ? json["entityname"] : null,
      description: json["description"] != null ? json["description"] : null,
      error: json["error"] != null ? json["error"] : null,
    );
  }
}

class ElectionResponse {
  final String? election_DATE;
  final dynamic? electiontype_ID;

  final String? error;

  ElectionResponse({this.election_DATE, this.electiontype_ID, this.error});

  factory ElectionResponse.fromJson(Map<String, dynamic> json) {
    return ElectionResponse(
      election_DATE:
          json["election_DATE"] != null ? json["election_DATE"] : null,
      electiontype_ID:
          json["electiontype_ID"] != null ? json["electiontype_ID"] : null,
      error: json["error"] != null ? json["error"] : null,
    );
  }
}

class ElectionTypeResponse {
  //int? code;
  final String? description;
  final String? error;

  ElectionTypeResponse({this.description, this.error});

  factory ElectionTypeResponse.fromJson(Map json) {
    return ElectionTypeResponse(
      description: json["description"] != null ? json["description"] : null,
      error: json["error"] != null ? json["error"] : null,
      // code: json["code"] != null ? json["code"] : null,
    );
  }
}

// class PrivilegesResponse2 {
//   final int? privilegeID;
//   final int? privilegeorderNO; //privileges_numbering ///projects
//   final int? pcategoryID;
//   final String? privilegeNAME;
//   final String pcategoryDETAIL;
//   ////pcategory_DETAIL///
// final String? token;
// final String? message;
// final String? error;

//   PrivilegesResponse2({
//     this.privilegeID,
//     this.privilegeorderNO,
//     this.pcategoryID,
//     this.privilegeNAME,
//     required this.pcategoryDETAIL,
//   });
//   List<PrivilegesResponse2> getrespose(List<dynamic> list) {
//     List<PrivilegesResponse2> Response;
//     for (int i = 0; i < list.length; i++) {
//       Response[i]=PrivilegesResponse2.fromJson(js)
//     }
//   }

//   factory PrivilegesResponse2.fromJson(Map<String, dynamic> json) {
//     for (int i = 0; i < list.length; i++) {}
//     return PrivilegesResponse2(
//       privilegeID: json["privilege_ID"] != null ? json["privilege_ID"] : null,
//       privilegeorderNO:
//           json["privilegeorder_NO"] != null ? json["privilegeorder_NO"] : null,
//       pcategoryID: json["pcategory_ID"] != null ? json["pcategory_ID"] : null,
//       privilegeNAME:
//           json["privilege_NAME"] != null ? json["privilege_NAME"] : null,
//       pcategoryDETAIL:
//           json["pcategory_DETAIL"] != null ? json["pcategory_DETAIL"] : null,
//     );
//   }
// }

class PrivilegeCategoryResponse {
  final int? pcategoryorder_NO; //catogery number 1-4;
  // final int? privilegeorderNO;
  // final int? pcategoryID;
  // final String? privilegeNAME;
  // final String? pcategoryDETAIL;
  final String? pcategory_NAME;
  ////pcategory_DETAIL///
  // final String? token;
  // final String? message;
  // final String? error;

  PrivilegeCategoryResponse(
      {
      //   this.privilegeID,
      // this.privilegeorderNO,
      // this.pcategoryID,
      // this.privilegeNAME,
      // this.pcategoryDETAIL,
      this.pcategoryorder_NO,
      this.pcategory_NAME});

  factory PrivilegeCategoryResponse.fromJson(Map<String?, dynamic?> json) {
    return PrivilegeCategoryResponse(
      // privilegeID: json["privilege_ID"] != null ? json["privilege_ID"] : null,
      // privilegeorderNO:
      //     json["privilegeorder_NO"] != null ? json["privilegeorder_NO"] : null,
      // pcategoryID: json["pcategory_ID"] != null ? json["pcategory_ID"] : null,
      // privilegeNAME:
      //     json["privilege_NAME"] != null ? json["privilege_NAME"] : null,
      // pcategoryDETAIL:
      //     json["pcategory_DETAIL"] != null ? json["pcategory_DETAIL"] : null,
      pcategory_NAME:
          json["pcategory_NAME"] != null ? json["pcategory_NAME"] : null,
      pcategoryorder_NO:
          json["pcategoryorder_NO"] != null ? json["pcategoryorder_NO"] : null,
    );
  }
}
