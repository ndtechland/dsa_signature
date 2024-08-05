import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginData? data;

  LoginResponse({
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class LoginData {
  int? status;
  String? message;
  int? id;
  String? name;
  String? address;
  String? mobile;
  String? password;
  String? dsaCode;
  String? email;

  LoginData({
    this.status,
    this.message,
    this.id,
    this.name,
    this.address,
    this.mobile,
    this.password,
    this.dsaCode,
    this.email,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    status: json["Status"],
    message: json["Message"],
    id: json["Id"],
    name: json["Name"],
    address: json["Address"],
    mobile: json["Mobile"],
    password: json["Password"],
    dsaCode: json["DsaCode"],
    email: json["Email"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Id": id,
    "Name": name,
    "Address": address,
    "Mobile": mobile,
    "Password": password,
    "DsaCode": dsaCode,
    "Email": email,
  };
}