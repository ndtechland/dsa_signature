// To parse this JSON data, do
//
//     final postAddMemberModel = postAddMemberModelFromJson(jsonString);

import 'dart:convert';

PostAddMemberModel postAddMemberModelFromJson(String str) => PostAddMemberModel.fromJson(json.decode(str));

String postAddMemberModelToJson(PostAddMemberModel data) => json.encode(data.toJson());

class PostAddMemberModel {
  int? status;
  String? message;
  int? id;
  int? memberApprovalNumber;

  PostAddMemberModel({
    this.status,
    this.message,
    this.id,
    this.memberApprovalNumber,
  });

  factory PostAddMemberModel.fromJson(Map<String, dynamic> json) => PostAddMemberModel(
    status: json["Status"],
    message: json["Message"],
    id: json["Id"],
    memberApprovalNumber: json["MemberApprovalNumber"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Id": id,
    "MemberApprovalNumber": memberApprovalNumber,
  };
}
