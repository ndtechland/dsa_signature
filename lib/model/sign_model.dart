// To parse this JSON data, do
//
//     final signModel = signModelFromJson(jsonString);

import 'dart:convert';

SignModel signModelFromJson(String str) => SignModel.fromJson(json.decode(str));

String signModelToJson(SignModel data) => json.encode(data.toJson());

class SignModel {
  int? status;
  String? message;

  SignModel({
    this.status,
    this.message,
  });

  factory SignModel.fromJson(Map<String, dynamic> json) => SignModel(
    status: json["Status"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
  };
}
