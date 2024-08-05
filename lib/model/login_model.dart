
class UserModel {
  final int status;
  final String message;
  final int id;
  final String name;
  final String address;
  final String mobile;
  final String password;
  final String dsaCode;
  final String email;

  UserModel({
    required this.status,
    required this.message,
    required this.id,
    required this.name,
    required this.address,
    required this.mobile,
    required this.password,
    required this.dsaCode,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['Status'] ?? 0,
      message: json['Message'] ?? '',
      id: json['Id'] ?? 0,
      name: json['Name'] ?? '',
      address: json['Address'] ?? '',
      mobile: json['Mobile'] ?? '',
      password: json['Password'] ?? '',
      dsaCode: json['DsaCode'] ?? '',
      email: json['Email'] ?? '',
    );
  }
}
