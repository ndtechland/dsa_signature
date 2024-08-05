import 'dart:convert';

GetMembersOnHoldListModel getMembersOnHoldListModelFromJson(String str) =>GetMembersOnHoldListModel.fromJson(json.decode(str));
String getMemberOnHoldModelToJson(GetMembersOnHoldListModel data) => json.encode(data.toJson());

class GetMembersOnHoldListModel {
  int status;
  String message;
  List<MemberData> data;

  GetMembersOnHoldListModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory GetMembersOnHoldListModel.fromJson(Map<String, dynamic> json) => GetMembersOnHoldListModel(
    status: json["Status"],
    message: json["Message"],
    data: json["Data"] != null ? List<MemberData>.from(json["Data"].map((x) => MemberData.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() =>{
    "Status": status,
    "Message": message,
    "Data":List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MemberData {
  num id;
  String mobileNumber;
  String name;
  String email;
  num amount;
  String mop;
  bool isSeen;
  String createDate;
  num recieptNumber;
  dynamic otherCash;
  dynamic otherCheque;
  dynamic otherCard;
  dynamic otherOnline;
  String preName;
  String dsaCode;
  String mafNumber;

  MemberData({
    required this.id,
    required this.mobileNumber,
    required this.name,
    required this.email,
    required this.amount,
    required this.mop,
    required this.isSeen,
    required this.createDate,
    required this.recieptNumber,
    required this.otherCash,
    required this.otherCheque,
    required this.otherCard,
    required this.otherOnline,
    required this.preName,
    required this.dsaCode,
    required this.mafNumber,
  });
  factory MemberData.fromJson(Map<String, dynamic> json) => MemberData(
    id: json["Id"],
    mobileNumber: json["MobileNumber"],
    name: json["Name"],
    email: json["Email"],
    amount: json["Amount"],
    mop: json["MOP"],
    isSeen: json["IsSeen"],
    createDate: json["CreateDate"],
    recieptNumber: json["RecieptNumber"],
    otherCash: json["OtherCash"],
    otherCheque: json["OtherCheque"],
    otherCard: json["OtherCard"],
    otherOnline: json["OtherOnline"],
    preName: json["PreName"],
    dsaCode: json["Dsa_Code"],
    mafNumber: json["MafNumber"],
  );
  Map<String,dynamic> toJson() => {
    "Id":id,
    "MobileNumber":mobileNumber,
    "Name":name,
    "Email":email,
    "Amount":amount,
    "MOP":mop,
    "IsSeen":isSeen,
    "CreateDate":createDate,
    "RecieptNumber":recieptNumber,
    "OtherCash":otherCash,
    "OtherCheque":otherCheque,
    "OtherCard":otherCard,
    "OtherOnline":otherOnline,
    "PreName":preName,
    "Dsa_Code":dsaCode,
    "MafNumber":mafNumber,

  };
}
