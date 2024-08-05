import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/login_model.dart';


Future<UserModel?> loginUser(String dsaCode, String password) async {
  //HttpOverrides.global = MyHttpOverrides();

  const String apiUrl = 'https://new.signatureresorts.in/api/CommonApi/dsaLogin';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'DsaCode': dsaCode,
        'Password': password,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('Sent email: $dsaCode');
    print('Sent password: $password');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print("Decoded Json: $data");
      if (data['Status'] == 1) {
        return UserModel.fromJson(data['Data']);
      } else {
        // Handle error in API response
        print('Login failed: ${data['Message']}');
        return null;
      }
    } else if (response.statusCode == 400) {
      print('Invalid credentials: ${response.body}');
      return null;
    } else {
      // Handle other server errors
      print('Server error: ${response.statusCode} ${response.body}');
      return null;
    }
  } catch (e) {
    // Handle any other errors
    print('Error: $e');
    return null;
  }
}

Future<UserModel?> loginUserr(String dsaCode, String password) async {
  const String apiUrl = 'https://new.signatureresorts.in/api/CommonApi/dsaLogin';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'DsaCode': dsaCode,
        'Password': password,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('Sent DsaCode: $dsaCode');
    print('Sent password: $password');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final Map<String, dynamic>? data = responseData['data'];

      if (data != null && data['Status'] == 200) {
        //Get.to(()=>Home());

        return UserModel.fromJson(data);
      } else {
        print('Login failed: ${data?['Message']}');
        return null;
      }
    } else {
      print('Server error: ${response.statusCode} ${response.body}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
// Future<bool> getProfile() async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   print("getProfile");
//   String? authToken = sharedPreferences.getString("id");
//   if (authToken != null) {
//     var result = await loginUserr();
//
//     print("result is: $authToken");
//     // print(jsonEncode(result));
//     if (result["isSuccess"]) {
//       sharedPreferences.setString("userData", jsonEncode(result));
//       ghj = jsonEncode(result);
//
//       // print("FFFF"+ghj);
//       userModel = UserModel.fromJson(result);
//       print("Hello  + ${userModel.coach_track}");
//
//       // updateTextEditingControllers();
//       return true;
//     }
//     return false;
//   }
//   return false;
// }
