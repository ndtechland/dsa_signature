// To parse this JSON data, do
//
//     final postMemberOnHoldModel = postMemberOnHoldModelFromJson(jsonString);

import 'dart:convert';

PostMemberOnHoldModel postMemberOnHoldModelFromJson(String str) => PostMemberOnHoldModel.fromJson(json.decode(str));

String postMemberOnHoldModelToJson(PostMemberOnHoldModel data) => json.encode(data.toJson());

class PostMemberOnHoldModel {
  int? status;
  String? message;
  int? id;
  int? holdApprovalNumber;

  PostMemberOnHoldModel({
    this.status,
    this.message,
    this.id,
    this.holdApprovalNumber,
  });

  factory PostMemberOnHoldModel.fromJson(Map<String, dynamic> json) => PostMemberOnHoldModel(
    status: json["Status"],
    message: json["Message"],
    id: json["Id"],
    holdApprovalNumber: json["HoldApprovalNumber"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Id": id,
    "HoldApprovalNumber": holdApprovalNumber,
  };
}
