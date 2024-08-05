import 'dart:convert';

GetUserNameModel getUserNameFromJson(String str) => GetUserNameModel.fromJson(json.decode(str));
String getUserNameToJson(GetUserNameModel data) => json.encode(data.toJson());

class GetUserNameModel {
  String? result;
  num? id;
  dynamic exception;
  num? status;
  bool? isCanceled;
  bool? isCompleted;
  num? creationOptions;
  dynamic asyncState;
  bool? isFaulted;

  GetUserNameModel({
    this.result,
    this.id,
    this.exception,
    this.status,
    this.isCanceled,
    this.isCompleted,
    this.creationOptions,
    this.asyncState,
    this.isFaulted,
  });

  factory GetUserNameModel.fromJson(Map<String, dynamic> json) => GetUserNameModel(
    result: json["Result"] as String?,
    id: json["Id"] as num?,
    exception: json["Exception"],
    status: json["Status"] as num?,
    isCanceled: json["IsCanceled"] ?? false, // Provide a default value if null
    isCompleted: json["IsCompleted"] ?? false, // Provide a default value if null
    creationOptions: json["CreationOptions"] as num?,
    asyncState: json["AsyncState"],
    isFaulted: json["IsFaulted"] ?? false, // Provide a default value if null
  );

  Map<String, dynamic> toJson() => {
    "Result": result,
    "Id": id,
    "Exception": exception,
    "Status": status,
    "IsCanceled": isCanceled,
    "IsCompleted": isCompleted,
    "CreationOptions": creationOptions,
    "AsyncState": asyncState,
    "IsFaulted": isFaulted,
  };
}
