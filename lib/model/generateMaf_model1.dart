import 'dart:convert';

PostGenerateMafModel postGenerateMafModelFromJson(String str) => PostGenerateMafModel.fromJson(json.decode(str));
String postGenerateMafModelToJson(PostGenerateMafModel data) => json.encode(data.toJson());
class PostGenerateMafModel {
  int status;
  String message;
  Data? data;

  PostGenerateMafModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory PostGenerateMafModel.fromJson(Map<String, dynamic> json) => PostGenerateMafModel(
    status: json["Status"],
    message: json["Message"],
    data: json["Data"]==null?null: Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() =>{
    "Status": status,
    "Message": message,
    "Data":data?.toJson(),
  };
}

class Data {
  int id;
  int approvalNumber;
  String memberName;
  DateTime? craeteDate;
  dynamic welcomeFormNumber;
  bool isMember;
  String mafNumber;
  String dsaCode;
  String status;
  String mobileNumber;
  String preName;
  dynamic isAdd;

  Data({
    required this.id,
    required this.approvalNumber,
    required this.memberName,
    required this.craeteDate,
    required this.welcomeFormNumber,
    required this.isMember,
    required this.mafNumber,
    required this.dsaCode,
    required this.status,
    required this.mobileNumber,
    required this.preName,
    required this.isAdd,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["Id"],
    dsaCode: json["DsaCode"],
    approvalNumber: json["ApprovalNumber"],
    memberName: json["MemberName"],
    welcomeFormNumber: json["WelcomeFormNumber"],
    isMember: json["IsMember"],
    mafNumber: json["MafNumber"],
    status: json["Status"],
    mobileNumber: json["MobileNumber"],
    preName: json["PreName"],
    isAdd: json["IsAdd"],
    craeteDate: json["CraeteDate"] == null ? null : DateTime.parse(json["CraeteDate"]),
  );
  Map<String,dynamic> toJson() => {
    "Id":id,
    "DsaCode": dsaCode,
    "ApprovalNumber": approvalNumber,
    "MemberName": memberName,
    "WelcomeFormNumber": welcomeFormNumber,
    "IsMember": isMember,
    "MafNumber":mafNumber,
    "Status": status,
    "MobileNumber":mobileNumber,
    "PreName":preName,
    "IsAdd": isAdd,
    "CraeteDate":craeteDate
  };
}
