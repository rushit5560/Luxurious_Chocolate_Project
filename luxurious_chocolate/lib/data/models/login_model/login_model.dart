// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.success,
    required this.messege,
    required this.data,
  });

  bool success;
  String messege;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        messege: json["messege"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "messege": messege,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.password,
    this.forgotpasswordToken,
    this.rememberToken,
    this.acceptTc,
    this.isSubscribed,
    this.image,
    this.googlekey,
    this.logintype,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String password;
  dynamic forgotpasswordToken;
  dynamic rememberToken;
  dynamic acceptTc;
  dynamic isSubscribed;
  dynamic image;
  dynamic googlekey;
  dynamic logintype;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"],
        forgotpasswordToken: json["forgotpassword_token"],
        rememberToken: json["remember_token"],
        acceptTc: json["accept_tc"],
        isSubscribed: json["is_subscribed"],
        image: json["image"],
        googlekey: json["googlekey"],
        logintype: json["logintype"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "password": password,
        "forgotpassword_token": forgotpasswordToken,
        "remember_token": rememberToken,
        "accept_tc": acceptTc,
        "is_subscribed": isSubscribed,
        "image": image,
        "googlekey": googlekey,
        "logintype": logintype,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
