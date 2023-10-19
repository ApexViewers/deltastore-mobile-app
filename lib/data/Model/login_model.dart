// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  StatusCode? statusCode;
  String? message;
  Payload? payload;
  Error? error;
  int? totalCount;
  bool? isSuccess;

  LoginModel({
    this.statusCode,
    this.message,
    this.payload,
    this.error,
    this.totalCount,
    this.isSuccess,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    statusCode: json["statusCode"] == null ? null : StatusCode.fromJson(json["statusCode"]),
    message: json["message"],
    payload: json["payload"] == null ? null : Payload.fromJson(json["payload"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
    totalCount: json["totalCount"],
    isSuccess: json["isSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode?.toJson(),
    "message": message,
    "payload": payload?.toJson(),
    "error": error?.toJson(),
    "totalCount": totalCount,
    "isSuccess": isSuccess,
  };
}

class Error {
  Error();

  factory Error.fromJson(Map<String, dynamic> json) => Error(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Payload {
  UserDetails? userDetails;
  String? token;

  Payload({
    this.userDetails,
    this.token,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    userDetails: json["userDetails"] == null ? null : UserDetails.fromJson(json["userDetails"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "userDetails": userDetails?.toJson(),
    "token": token,
  };
}

class UserDetails {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  String? company;

  UserDetails({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.role,
    this.company,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["ID"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    role: json["role"],
    company: json["company"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "role": role,
    "company": company,
  };
}

class StatusCode {
  int? code;
  String? description;

  StatusCode({
    this.code,
    this.description,
  });

  factory StatusCode.fromJson(Map<String, dynamic> json) => StatusCode(
    code: json["code"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "description": description,
  };
}
