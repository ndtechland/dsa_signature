import 'dart:convert';

GetMafListModel getMafListModelFromJson(String str) => GetMafListModel.fromJson(json.decode(str));
String getMafListModelToJson(GetMafListModel data) => json.encode(data.toJson());

class GetMafListModel {
  int status;
  String message;
  List<MafListData> data;

  GetMafListModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory GetMafListModel.fromJson(Map<String, dynamic> json) => GetMafListModel(
    status: json["Status"],
    message: json["Message"],
    data: json["Data"] == null ? [] : List<MafListData>.from(json["Data"].map((x) => MafListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() =>{
    "Status": status,
    "Message": message,
    "Data":List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MafListData {
  int id;
  int approvalNumber;
  String memberName;
  String craeteDate;
  dynamic welcomeFormNumber;
  bool isMember;
  String mafNumber;
  String dsaCode;
  String status;
  String mobileNumber;
  String preName;
  dynamic isAdd;

  MafListData({
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
  factory MafListData.fromJson(Map<String, dynamic> json) => MafListData(
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
    craeteDate: json["CraeteDate"] ,
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
