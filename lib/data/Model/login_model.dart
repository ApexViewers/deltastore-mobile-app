// // To parse this JSON data, do
// //
// //     final loginModel = loginModelFromJson(jsonString);
//
// import 'dart:convert';
//
// LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
//
// String loginModelToJson(LoginModel data) => json.encode(data.toJson());
//
// class LoginModel {
//   StatusCode? statusCode;
//   String? message;
//   Payload? payload;
//   Error? error;
//   int? totalCount;
//   bool? isSuccess;
//
//   LoginModel({
//     this.statusCode,
//     this.message,
//     this.payload,
//     this.error,
//     this.totalCount,
//     this.isSuccess,
//   });
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//     statusCode: json["statusCode"] == null ? null : StatusCode.fromJson(json["statusCode"]),
//     message: json["message"],
//     payload: json["payload"] == null ? null : Payload.fromJson(json["payload"]),
//     error: json["error"] == null ? null : Error.fromJson(json["error"]),
//     totalCount: json["totalCount"],
//     isSuccess: json["isSuccess"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "statusCode": statusCode?.toJson(),
//     "message": message,
//     "payload": payload?.toJson(),
//     "error": error?.toJson(),
//     "totalCount": totalCount,
//     "isSuccess": isSuccess,
//   };
// }
//
// class Error {
//   Error();
//
//   factory Error.fromJson(Map<String, dynamic> json) => Error(
//   );
//
//   Map<String, dynamic> toJson() => {
//   };
// }
//
// class Payload {
//   LoginModelDetails? LoginModelDetails;
//   String? token;
//
//   Payload({
//     this.LoginModelDetails,
//     this.token,
//   });
//
//   factory Payload.fromJson(Map<String, dynamic> json) => Payload(
//     LoginModelDetails: json["LoginModelDetails"] == null ? null : LoginModelDetails.fromJson(json["LoginModelDetails"]),
//     token: json["token"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "LoginModelDetails": LoginModelDetails?.toJson(),
//     "token": token,
//   };
// }
//
// class LoginModelDetails {
//   int? id;
//   String? email;
//   String? firstName;
//   String? lastName;
//   String? role;
//   String? company;
//
//   LoginModelDetails({
//     this.id,
//     this.email,
//     this.firstName,
//     this.lastName,
//     this.role,
//     this.company,
//   });
//
//   factory LoginModelDetails.fromJson(Map<String, dynamic> json) => LoginModelDetails(
//     id: json["ID"],
//     email: json["email"],
//     firstName: json["firstName"],
//     lastName: json["lastName"],
//     role: json["role"],
//     company: json["company"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "ID": id,
//     "email": email,
//     "firstName": firstName,
//     "lastName": lastName,
//     "role": role,
//     "company": company,
//   };
// }
//
// class StatusCode {
//   int? code;
//   String? description;
//
//   StatusCode({
//     this.code,
//     this.description,
//   });
//
//   factory StatusCode.fromJson(Map<String, dynamic> json) => StatusCode(
//     code: json["code"],
//     description: json["description"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "code": code,
//     "description": description,
//   };
// }


class LoginModel {
  String? user_id;
  String? firstName;
  String? lastName;
  String? displayName;
  String? role;
  Map<String, String>? avatarUrls;
  String? email;
  List<dynamic>? extras;
  String? devNote;

  LoginModel({
    this.user_id,
    this.firstName,
    this.lastName,
    this.displayName,
    this.role,
    this.avatarUrls,
    this.email,
    this.extras,
    this.devNote,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      user_id: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      displayName: json['display_name'],
      role: json['role'],
      avatarUrls: Map<String, String>.from(json['avatar_urls']),
      email: json['email'],
      extras: List<dynamic>.from(json['extras']),
      devNote: json['dev_note'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = user_id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['display_name'] = displayName;
    data['role'] = role;
    data['avatar_urls'] = avatarUrls;
    data['email'] = email;
    data['extras'] = extras;
    data['dev_note'] = devNote;
    return data;
  }
}
