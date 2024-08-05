import 'dart:convert';

NewuserholdingpaymentModel newuserholdingpaymentModelFromJson(String str) => NewuserholdingpaymentModel.fromJson(json.decode(str));
String newuserholdingpaymentModelToJson(NewuserholdingpaymentModel data) => json.encode(data.toJson());

class NewuserholdingpaymentModel {
  int status;
  String message;
 // List<Datum> data;

  NewuserholdingpaymentModel({
    required this.status,
    required this.message,
   // required this.data,
  });
  factory NewuserholdingpaymentModel.fromJson(Map<String, dynamic> json) => NewuserholdingpaymentModel(
    status: json["Status"],
    message: json["Message"],
    //data: json["Data"]==null?null: Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() =>{
    "Status": status,
    "Message": message,
    // "Data":data?.toJson(),
  };
  // factory NewuserholdingpaymentModel.fromJson(Map<String, dynamic> json) {
  //   return NewuserholdingpaymentModel(
  //     status: json['Status'],
  //     message: json['Message'],
  //     //data: List<Datum>.from(json['Data'].map((x) => Datum.fromJson(x))),
  //   );
  // }
}