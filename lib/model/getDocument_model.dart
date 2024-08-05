// To parse this JSON data, do
//
//     final getDocumentModel = getDocumentModelFromJson(jsonString);

import 'dart:convert';

GetDocumentModel getDocumentModelFromJson(String str) => GetDocumentModel.fromJson(json.decode(str));

String getDocumentModelToJson(GetDocumentModel data) => json.encode(data.toJson());

class GetDocumentModel {
  int? status;
  String? message;
  GetDocumentData? getDocumentData;

  GetDocumentModel({
    this.status,
    this.message,
    this.getDocumentData,
  });

  factory GetDocumentModel.fromJson(Map<String, dynamic> json) => GetDocumentModel(
    status: json["Status"],
    message: json["Message"],
    getDocumentData: json["Data"] == null ? null : GetDocumentData.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Data": getDocumentData?.toJson(),
  };
}

class GetDocumentData {
  String? mafFile;
  String? receiptFile;
  String? agreementFile;

  GetDocumentData({
    this.mafFile,
    this.receiptFile,
    this.agreementFile,
  });

  factory GetDocumentData.fromJson(Map<String, dynamic> json) => GetDocumentData(
    mafFile: json["MafFile"],
    receiptFile: json["ReceiptFile"],
    agreementFile: json["AgreementFile"],
  );

  Map<String, dynamic> toJson() => {
    "MafFile": mafFile,
    "ReceiptFile": receiptFile,
    "AgreementFile": agreementFile,
  };
}
