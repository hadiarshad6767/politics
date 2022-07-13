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
