
import 'dart:convert';

GetGenerateMafModel getGenerateMafModelFromJson(String str) => GetGenerateMafModel.fromJson(json.decode(str));
String getGenerateMafModelToJson(GetGenerateMafModel data) => json.encode(data.toJson());
class GetGenerateMafModel {
  int status;
  GetGenerateData? data;

  GetGenerateMafModel({
    required this.status,
    required this.data,
  });
  factory GetGenerateMafModel.fromJson(Map<String, dynamic> json) => GetGenerateMafModel(
    status: json["Status"],
    data: json["Data"]==null?null: GetGenerateData.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() =>{
    "Status": status,
    "Data":data?.toJson(),
  };
}

class GetGenerateData {
  String mafNumber;

  GetGenerateData({
    required this.mafNumber,
  });
  factory GetGenerateData.fromJson(Map<String, dynamic> json) => GetGenerateData(
    mafNumber: json["MafNumber"],
  );
  Map<String,dynamic> toJson() => {
    "MafNumber":mafNumber,

  };
}
