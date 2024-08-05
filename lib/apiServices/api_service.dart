// import 'dart:convert';
//
// import 'package:dsa_app/view/widgets/url.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
// import '../model/banner_model.dart';
// import '../model/generateMaf_model1.dart';
// import '../model/getGenerateMaf_model.dart';
// import '../model/login_model2.dart';
// import '../model/profile_model.dart';
// import '../view/home.dart';
//
// var prefs = GetStorage();
// final box = GetStorage();
//
// //final LoginController _loginController = Get.put(LoginController());
//
// class ApiProvider {
//   static var baseUrl = 'https://new.signatureresorts.in/api/';
//   static var baseUrl1 = 'https://api.hirejobindia.com/api/';
//   static var imageUrl = "https://new.signatureresorts.in/Images/";
//
//   /// "https://api.hirejobindia.com/api/";
//
//   // static var baseUrl = FixedText.apiurl;
//   //
//   //'https://api.hirejobindia.com/api/';
//
//   //http://pswellness.in/
//   //static var baseUrl1 = 'https://api.gyros.farm/';
//   //'http://pswellness.in/';
//   // static String token = '';
//   //
//   // //static String Token = '';
//   //
//   // //static String catid = '';
//   // //static String productid = '';
//   // //static String orderid = '';
//   // ///static String Id = '';
//   // static String MedicineId = ''.toString();
//   // static String adminId = ''.toString();
//
//   //static String userid = ''.toString();
//   static String userId = '';
//   static String dsaCode = ''.toString();
//
//   static List<String> images = [];
//
//   final box = GetStorage();
//   List<String> bannerImages = [];
//
//   ///todo login_email..........post...apis...
//   static Future<http.Response> LoginApi(String DsaCode, String Password) async {
//     var url = "${baseUrl}CommonApi/dsaLogin";
//     //baseUrl+CommonApi/dsaLogin;
//     //https://new.signatureresorts.in/api/CommonApi/dsaLogin
//     //App/UserChangePassword?userId=38
//     var body = jsonEncode({
//       "DsaCode": DsaCode,
//       "Password": Password,
//     });
//     print("url:$url");
//     print("loginnnn");
//     print(body);
//
//     http.Response r = await http.post(
//       Uri.parse(url),
//       body: body,
//       headers: {
//         "Content-Type": "application/json",
//       },
//     );
//
//     print("body: ${r.body}");
//
//     if (r.statusCode == 200) {
//       var responseData = json.decode(r.body);
//       var userId = responseData['data']['Id'];
//       var dsaCode = responseData['data']['DsaCode'];
//
//       // Save user ID (assuming 'Id' is part of the response JSON)
//       prefs.write("Id", userId);
//       print('Saved userId: $userId');
//       prefs.write("DsaCode", dsaCode);
//       print('Saved dsaCode: $dsaCode');
//
//       // Navigate to HomePage
//       Get.to(() => const Home());
//
//       return r;
//     } else if (r.statusCode == 401) {
//       Get.snackbar('Message', r.body);
//     } else {
//       Get.snackbar('Error', r.body);
//     }
//
//     return r;
//   }
//   //static const baseUrl = 'https://new.signatureresorts.in/api/CommonApi';
//
//   static Future<http.Response> postGenerateMaf(Map<String, dynamic> data) async {
//     final response = await http.post(
//       Uri.parse('${baseUrl}CommonApi/Generatemaf'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(data),
//     );
// print("bodyMaf:$data");
//     if (response.statusCode == 200) {
//       print("responseMaf:$response");
//       return response;
//
//     } else {
//       throw Exception('Failed to post data');
//     }
//   }
//   // static var baseUrl = 'https://new.signatureresorts.in/api/';
//
//   static Future<GetGenerateMafModel?> fetchMafNumber() async {
//     try {
//       final response = await http.get(Uri.parse('${baseUrl}CommonApi/Generatemaf'));
//
//       if (response.statusCode == 200) {
//         print("API Response: ${response.body}");
//         return GetGenerateMafModel.fromJson(json.decode(response.body));
//       } else {
//         print("API Error: ${response.statusCode} - ${response.body}");
//         return null;
//       }
//     } catch (e) {
//       print("API Exception: $e");
//       return null;
//     }
//   }
//
//   static Future<http.Response> generateMaf(
//      String memberName,
//      String mafNumber,
//      String mobileNumber,
//      String dsacode,
//      String preName,
//      String createDate,
//   ) async {
//     var prefs = GetStorage();
//
//     // Read saved userId
//     //  = prefs.read("DsaCode").toString();
//     // print('wwwuseridEiihhE:$dsaCode');
//     String dsaCode = prefs.read("DsaCode").toString();
//     print('wwwuseridEiihhE:$dsaCode');
//     // var dsaCode = responseData['data']['DsaCode']
//
//     var url = "${baseUrl}CommonApi/Generatemaf";
//     var body = jsonEncode({
//       "MemberName": memberName,
//       "MafNumber": mafNumber,
//       "MobileNumber": mobileNumber,
//       "PreName": preName,
//       "DsaCode": dsacode,
//       "CraeteDate": createDate,
//     });
//
//     print("url: $url");
//     print("body: $body");
//
//     http.Response response = await http.post(
//       Uri.parse(url),
//       body: body,
//       headers: {
//         "Content-Type": "application/json",
//       },
//     );
//
//     print("Response body: ${response.body}");
//
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       var responseData = json.decode(response.body);
//       var id = responseData['Data']['Id'];
//       var approvalNumber = responseData['Data']['ApprovalNumber'];
//       var dsa = responseData['Data']['DsaCode'];
//
//       // Save the required data (assuming 'Id' and 'ApprovalNumber' are part of the response JSON)
//       prefs.write("Id", id);
//       prefs.write("ApprovalNumber", approvalNumber);
//       prefs.write("DsaCode", dsa);
//       print('Saved Id: $id and ApprovalNumber: $approvalNumber and dsa: $dsa');
//
//       // Handle further logic or navigation here
//       // Get.to(() => const SomePage());
//
//       return response;
//     } else if (response.statusCode == 401) {
//       Get.snackbar('Message', response.body);
//     } else {
//       Get.snackbar('Error', response.body);
//     }
//
//     return response;
//   }
// // static Future postGenerateMaf(String memberName,String mafNum,String mobNum,
// //     String prefix,String dsaCode,DateTime createDate) async {
// // var url ="${baseUrl}CommonApi/Generatemaf";
// //
// // var body = jsonEncode({
// //   "MemberName":memberName,
// //   "MafNumber":mafNum,
// //   "MobileNumber":mobNum,
// //   "PreName":prefix,
// //   "DsaCode":dsaCode,
// //   "CraeteDate":createDate.toIso8601String(),
// // });
// // print("body:$body");
// // http.Response r = await http.post(
// //   Uri.parse(url),
// //   body: body,
// //   headers: {
// //     "Content-Type": "application/json",
// //   },
// // );
// // if(r.statusCode==200){
// //   var respoData= json.decode(r.body);
// //   return respoData;
// // } else {
// //   throw Exception('Failed to fetch data');
// // }
// // return r;
// // }
//   // static Future<http.Response> getProfile(String name,String address,String mobile,String email) async {
// // var body = jsonEncode({
// //   "Name":name,
// //   "Address":address,
// //   "Mobile":mobile,
// //   "Email":email,
// // });
// // final respo= await http.post(Uri.parse(loginUrl));
// //
// // return respo;
// //   }
//
//   // static Future<LoginResponse> getProfile(String name,String address,String mobile,String email) async{
//   //   var body = jsonEncode({
//   //     "Name":name,
//   //     "Address":address,
//   //     "Mobile":mobile,
//   //     "Email":email,
//   //   });
//   //   final respo = await http.post(loginrl);
//   // }
//   //https://new.signatureresorts.in/Images/8a1799cb-a932-4943-95fb-f7546ee2e0a1.jpg
//   static Future<Banner> getBanner() async {
//     final response =
//         await http.get(Uri.parse("${baseUrl}CommonApi/BannerList"));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return Banner.fromJson(data);
//     } else {
//       throw Exception('Failed to load banners');
//     }
//   }
//
//   ///5.profile_api...
//   static PriofileApi() async {
//   var prefs = GetStorage();
//
//     //saved userid..........
//     //prefs.write("Id".toString(), json.decode(r.body)['Id']);
//     userId = prefs.read("Id").toString();
//     print('wwwuseridEE:${userId}');
//     var url = '${baseUrl}CommonApi/dsaProfile?userid=37';
//     try {
//       http.Response r = await http.get(Uri.parse(url));
//       if (r.statusCode == 200) {
//         print("url");
//         print(url);
//         GetProfileModel? geetprofilemodel = getProfileModelFromJson(r.body);
//         print("profile: ${geetprofilemodel.data!.dsaCode}");
//         return geetprofilemodel;
//       }
//     } catch (error) {
//       print('profileedetaileror: $error');
//     }
//   }
//
//   // static Future<GetProfileModel?> profileApi() async {
//   //   var prefs = GetStorage();
//   //   String? userIdd = prefs.read("Id");
//   //   if (userIdd == null) {
//   //     print('User ID is not available');
//   //     return null;
//   //   }
//   //
//   //   var url = '${baseUrl1}App/GetProfile?userId=2';
//   //   try {
//   //     http.Response response = await http.get(Uri.parse(url));
//   //     if (response.statusCode == 200) {
//   //       GetProfileModel? profileModel = getProfileModelFromJson(response.body);
//   //       return profileModel;
//   //     } else {
//   //       print('Failed to load profile: ${response.statusCode}');
//   //       return null;
//   //     }
//   //   } catch (error) {
//   //     print('Profile detail error: $error');
//   //     return null;
//   //   }
//   // }
// }
import 'dart:convert';

import 'package:dsa_app/model/addMember_model.dart';
import 'package:dsa_app/model/approvalForm_model.dart';
import 'package:dsa_app/model/getDocument_model.dart';
import 'package:dsa_app/model/getMembersOnHoldList_model.dart';
import 'package:dsa_app/model/getUserName_model.dart';
import 'package:dsa_app/model/mafList_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/banner_model.dart';
import '../model/generateMaf_model1.dart';
import '../model/getGenerateMaf_model.dart';
import '../model/login_model2.dart';
import '../model/profile_model.dart';
import '../model/sign_model.dart';
import '../view/home.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Add this import
import 'dart:typed_data';

class ApiProvider {
  static var baseUrl = 'https://new.signatureresorts.in/api/';
  //static var baseUrl1 = 'https://api.hirejobindia.com/api/';
  static var imageUrl = "https://new.signatureresorts.in/Images/";

  static String userId = '';
  static String dsaCode = '';
  static String approvalNum = ''.toString();
  static String id =''.toString();

  static List<String> images = [];


  static final box = GetStorage();
  List<String> bannerImages = [];

  ///todo login_email..........post...apis...1
  static Future<http.Response> LoginApi(String DsaCode, String Password) async {
    var url = "${baseUrl}CommonApi/dsaLogin";
    var body = jsonEncode({
      "DsaCode": DsaCode,
      "Password": Password,
    });
    print("url:$url");
    print("loginnnn");
    print(body);

    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );

    print("body: ${r.body}");

    if (r.statusCode == 200) {
      var responseData = json.decode(r.body);
      var userId = responseData['data']['Id'];
      var dsaCode = responseData['data']['DsaCode'];

      // Save user ID (assuming 'Id' is part of the response JSON)
      box.write("Id", userId);
      print('Saved userId: $userId');
      box.write("DsaCode", dsaCode);
      print('Saved dsaCode: $dsaCode');

      // Navigate to HomePage
      Get.to(() => const Home());

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('Message', r.body);
    } else {
      Get.snackbar('Error', r.body);
    }

    return r;
  }

  ///todo postGenerateMaf api 2...
  // static Future<http.Response> postGenerateMaf(Map<String, dynamic> data) async {
  //   final response = await http.post(
  //     Uri.parse('${baseUrl}CommonApi/Generatemaf'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(data),
  //   );
  //   print("bodyMaf:$data");
  //   if (response.statusCode == 200) {
  //     print("responseMaf:$response");
  //     return response;
  //   } else {
  //     throw Exception('Failed to post data');
  //   }
  // }

  ///todo get fetchMafNumber api 2...
  static Future<GetGenerateMafModel?> fetchMafNumber() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}CommonApi/Generatemaf'));

      if (response.statusCode == 200) {
        print("API Response: ${response.body}");

        return GetGenerateMafModel.fromJson(json.decode(response.body));
      } else {
        print("API Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("API Exception: $e");
      return null;
    }
  }


  ///todo post generateMaf api 3...
  static Future<http.Response> generateMaf(
      String memberName,
      String mafNumber,
      String mobileNumber,
      String preName,
      DateTime createDate,
      ) async {
    // Read saved userId and dsaCode
    String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
    print('generateMaf Dsa Code:$dsaCode');

    String userId = box.read("Id")?.toString() ?? 'null';
    print('wwwuseridEE:$userId');

    var url = "${baseUrl}CommonApi/Generatemaf";
    var body = jsonEncode({
      "MemberName": memberName,
      "MafNumber": mafNumber,
      "MobileNumber": mobileNumber,
      "PreName": preName,
      "DsaCode": dsaCode,
      "CraeteDate": createDate.toIso8601String(),
    });

    print("url: $url");
    print("body: $body");

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );

    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      print(response.statusCode);
      var responseData = json.decode(response.body);
      var id = responseData['Data']['Id'];
      var approvalNumber = responseData['Data']['ApprovalNumber'];
      var dsa = responseData['Data']['DsaCode'];

      // Save the required data (assuming 'Id' and 'ApprovalNumber' are part of the response JSON)
      box.write("Id", id);
      box.write("ApprovalNumber", approvalNumber);
      box.write("DsaCode", dsa);
      print("Id: $id");
      print('Saved Id: $id and ApprovalNumber: $approvalNumber and dsa: $dsa');

      return response;
    } else if (response.statusCode == 401) {
      Get.snackbar('Message', response.body);
    } else {
      Get.snackbar('Error', response.body);
    }

    return response;
  }

  ///todo get getBanner api 4...
  static Future<Banner> getBanner() async {
    final response =
    await http.get(Uri.parse("${baseUrl}CommonApi/BannerList"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Banner.fromJson(data);
    } else {
      throw Exception('Failed to load banners');
    }
  }

  ///5.profile_api...
  ///todo get PriofileApi api 5...
  static Future<GetProfileModel?> PriofileApi() async {
    String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
    print('wwwuseridEiihhE:$dsaCode');

    String userId = box.read("Id")?.toString() ?? 'null';
    print('wwwuseridEE:$userId');

    if (userId == 'null' || dsaCode == 'null') {
      print('UserId or DsaCode not found in storage');
      return null;
    }

    // String dsaCode = box.read("DsaCode").toString();
    // print('wwwuseridEiihhE:$dsaCode');
    // // Read saved userId
    // String userId = box.read("Id").toString();
    // print('wwwuseridEE:$userId');

    var url = '${baseUrl}CommonApi/dsaProfile?userid=$userId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("url");
        print(url);
        GetProfileModel geetprofilemodel = getProfileModelFromJson(r.body);
        print("profile: ${geetprofilemodel.data!.dsaCode}");
        return geetprofilemodel;
      }
    } catch (error) {
      print('profileedetaileror: $error');
    }
    return null;
  }
 // static PriofileApi() async {
//   var prefs = GetStorage();
//
//     //saved userid..........
//     //prefs.write("Id".toString(), json.decode(r.body)['Id']);
//     userId = prefs.read("Id").toString();
//     print('wwwuseridEE:${userId}');
//     var url = '${baseUrl}CommonApi/dsaProfile?userid=37';
//     try {
//       http.Response r = await http.get(Uri.parse(url));
//       if (r.statusCode == 200) {
//         print("url");
//         print(url);
//         GetProfileModel? geetprofilemodel = getProfileModelFromJson(r.body);
//         print("profile: ${geetprofilemodel.data!.dsaCode}");
//         return geetprofilemodel;
//       }
//     } catch (error) {
//       print('profileedetaileror: $error');
//     }
//   }
  ///todo get MafListApi api 6...
  static Future<GetMafListModel?> MafListApi() async {
    // String dsaCode = box.read("DsaCode").toString();
    // print('wwwuseridEiihhE:$dsaCode');
    // // Read saved userId
    // userId = box.read("Id").toString();
    // print('wwwuseridEE:$userId');

    String id = box.read("Id")?.toString() ?? "null";
    var url = '${baseUrl}CommonApi/MafNumberList';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {

        print("url");
        print(url);
        GetMafListModel? getMafListModel = getMafListModelFromJson(r.body);
        return getMafListModel;
      }
    } catch (error) {
      print('profileedetaileror: $error');
    }
    return null;
  }


///todo post AddMember api 7...
  static Future<http.Response> addMemberApi(
      var dateOfJoining,
      var preName,
      var memberName1,
      var member1DOB,
      var mobile1,
      var preName2,
      var memberName2,
      var member2DOB,
      var mobile2,
      var address,
      var residenceNumber,
      var email,
      var city,
      var pincode,
      var tenure,
      var validity,
      var type,
      var season,
      var apartment,
      var occupancy,
      var amcAmount,
      var amcDueDate,
      var dsaCode,
      var empCode,
      var rciEnrollment,
      var totalCost,
      var purchasePrice,
      var adminCharges,
      var amcFirstYear,
      var roundOffAmcFirstYearAmount,
      var preAmount,
      var initialPayment,
      var modeOfPayment,
      var otherCash,
      var otherCard,
      var otherOnline,
      var otherCheque,
      var balance,
      var numberOfEMI,
      var emi,
      var emiStartDate,
      var managerName,
      var repName,
      var offerStayNights,
      var offerStayDays,
      var offerNoOfAdults,
      var offerNoOfChild,
      var offerOnlyAccomodation,
      var offerAccomodation,
      var offerBreakfast,
      var offerDinner,
      var offerSightSeeing,
      var offerBalanceAmount,
      var offerValidity,
      var offerIncludeRemark,
      var offerNoOfAirtickets,
      var airtTicketType,
      var mafNo,
      var username,
      ) async {
    // Read saved userId and dsaCode
    String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
    print('add member Dsa Code:$dsaCode');

    String userId = box.read("Id")?.toString() ?? 'null';
    print('wwwuseridEE:$userId');

    var url = "${baseUrl}AddmemberApi/Addmember";

    var body = jsonEncode({
      "DateOfJoining": dateOfJoining.toIso8601String(),
      "PreName": preName,
      "MemberName1": memberName1,
      "Member1DOB": member1DOB.toIso8601String(),
      "Mobile1": mobile1,
      "PreName2": preName2,
      "MemberName2": memberName2,
      "Member2DOB": member2DOB.toIso8601String(),
      "Mobile2": mobile2,
      "Address": address,
      "ResidenceNumber": residenceNumber,
      "Email": email,
      "City": city,
      "Pincode": pincode,
      "Tenure": tenure.toString()??0,
      "Validity": validity.toIso8601String(),
      "Type": type,
      "Season": season,
      "Apartment": apartment,
      "Occupancy": occupancy,
      "AMC_Amount": amcAmount.toString() ?? 0,
      "AMC_DueDate": amcDueDate.toIso8601String(),
      "Dsa_Code": dsaCode,
      "EmpCode": empCode,
      "RCIEnrollment": rciEnrollment.toString() ?? 0,
      "TotalCost": totalCost.toString(),
      "PurchasePrice": purchasePrice.toString(),
      "AdminCharges": adminCharges.toString(),
      "AmcFirstYear": amcFirstYear.toString(),
      "RoundOffAmcFirstYearAmount": roundOffAmcFirstYearAmount.toString(),
      "PreAmount": preAmount.toString(),
      "InitialPayment": initialPayment.toString(),
      "ModeOfPayment": modeOfPayment,
      "OtherCash": otherCard.toString(),
      "OtherCard": otherCard.toString(),
      "OtherOnline": otherOnline.toString(),
      "OtherCheque": otherCheque.toString(),
      "Balance": balance.toString(),
      "NumberOfEMI": numberOfEMI.toString(),
      "EMI": emi.toString(),
      "EMIStartDate": emiStartDate.toIso8601String(),
      "ManagerName": managerName,
      "RepName": repName,
      "Offer_StayNights": offerStayNights.toString(),
      "Offer_StayDays": offerStayDays.toString(),
      "Offer_NoOfAdults": offerNoOfAdults.toString(),
      "Offer_NoOfChild": offerNoOfChild.toString(),
      "Offer_OnlyAccomodation": offerOnlyAccomodation.toString(),
      "Offer_Accomodation": offerAccomodation.toString(),
      "Offer_Breakfast": offerBreakfast.toString(),
      "Offer_Dinner": offerDinner.toString(),
      "Offer_SightSeeing": offerSightSeeing.toString(),
      "Offer_BalanceAmount": offerBalanceAmount.toString(),
      "Offer_Validity": offerValidity,
      "Offer_IncludeRemark": offerIncludeRemark,
      "Offer_NoOfAirtickets": offerNoOfAirtickets.toString(),
      "AirtTicketType": airtTicketType,
      "mafNo": mafNo,
      "Username": username,
    });

    print("url: $url");
    print("body: $body");

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );

    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      print(response.statusCode);
      var responseDataa2 = json.decode(response.body);
      var approval = responseDataa2['data']['ApprovalNumber'];
      var memberId = responseDataa2['data']['Id'];
      box.write("ApprovalNumber", approval);
      box.write("Id", memberId);
      print("ApprovalNumberrrrrrr:$approval");
      print("Idddd:$memberId");
      print("response:$responseDataa2");
      return responseDataa2;
    } else if (response.statusCode == 401) {
      Get.snackbar('Message', response.body);
    } else {
      Get.snackbar('Error', response.body);
    }

    return response;
  }

  ///todo get fetchUserName api 8...
  // static Future<GetUserNameModel?> fetchUserName() async {
  //   try {
  //     final response = await http.get(Uri.parse('${baseUrl}AddmemberApi/GetUsername'));
  //
  //     if (response.statusCode == 200) {
  //       print("API Response UserName: ${response.body}");
  //       GetUserNameModel? getUserNameModel = getUserNameFromJson(response.body);
  //       return getUserNameModel;
  //      // return GetUserNameModel.fromJson(json.decode(response.body));
  //     } else {
  //       print("API Error: ${response.statusCode} - ${response.body}");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("API Exception: $e");
  //     return null;
  //   }
  // }
  static Future<GetUserNameModel?> fetchUserName() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}AddmemberApi/GetUsername'));
      print(" user name ");
      if (response.statusCode == 200) {
        print("API Response UserName: ${response.body}");
        GetUserNameModel? getUserNameModel = getUserNameFromJson(response.body);
        print("getUserNameModel:${getUserNameModel.result}");
        return getUserNameModel;
      } else {
        print("API Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("API Exception: $e");
      return null;
    }
  }

  ///todo post newUserHoldingPayment api 9...
  static Future<http.Response> newUserHoldingPayment(
      String name,
      String email,
      String mobileNumber,
      String amount,
      String mop,
      String otherCash,
      String otherCheque,
      String otherCard,
      String otherOnline,
      String preName,
      DateTime createDate
      ) async {
    // Read saved userId and dsaCode
    //String dsaCode = box.read("Dsa_Code").toString();
    //print('dsaCode NewUser:$dsaCode');
    String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
    print('new User Dsa Code:$dsaCode');

    String userId = box.read("Id")?.toString() ?? 'null';
    print('wwwuseridEE:$userId');

    var url = "${baseUrl}CommonApi/HoldingNewUserPayment";
    var body = jsonEncode({
      "Name": name,
      "Email": email,
      "MobileNumber": mobileNumber,
      "Amount": amount,
      "MOP": mop,
      "OtherCash": otherCash,
      "OtherCheque": otherCheque,
      "OtherCard": otherCard,
      "OtherOnline": otherOnline,
      "PreName": preName,
      "Dsa_Code": dsaCode,
      "CreateDate": createDate.toIso8601String(),
    });

    print("url: $url");
    print("body: $body");

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );

    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      print(response.statusCode);
      var responseData = json.decode(response.body);
      return response;
    } else if (response.statusCode == 401) {
      Get.snackbar('Message', response.body);
    } else {
      Get.snackbar('Error new user holding', response.body);
    }

    return response;
  }

  ///todo get MembersOnHoldListApi api 10...
  // static Future<GetMembersOnHoldListModel?> getMembersOnHoldListApi() async {
  //   String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
  //   print('MemberOnHoldList Dsa Code:$dsaCode');
  //
  //   String userId = box.read("Id")?.toString() ?? 'null';
  //   print('wwwuseridEE:$userId');
  //
  //   var url = '${baseUrl}CommonApi/MembersOnHoldList';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     if (r.statusCode == 200) {
  //       print("url");
  //       print(url);
  //       GetMembersOnHoldListModel? getMembersOnHoldList = getMembersOnHoldListModelFromJson(r.body);
  //       //print("profile: ${geetprofilemodel.data!.dsaCode}");
  //       return getMembersOnHoldList;
  //     }
  //   } catch (error) {
  //     print('profileedetaileror: $error');
  //   }
  //   return null;
  // }
  static Future<GetMembersOnHoldListModel?> getMembersOnHoldListApi() async {
    // String dsaCode = box.read("DsaCode").toString();
    // print('wwwuseridEiihhE:$dsaCode');
    // // Read saved userId
    // userId = box.read("Id").toString();
    // print('wwwuseridEE:$userId');

    var url = '${baseUrl}CommonApi/MembersOnHoldList';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("url");
        print(url);
        GetMembersOnHoldListModel? getMembersOnHoldListModel = getMembersOnHoldListModelFromJson(r.body);
        //print("profile: ${geetprofilemodel.data!.dsaCode}");
        return getMembersOnHoldListModel;
      }
    } catch (error) {
      print('profileedetaileror: $error');
    }
    return null;
  }

  ///todo post MembersOnHold api 11...
  static Future<http.Response> postMembersOnHold(
      var dateOfJoining,
      var preName,
      var memberName1,
      var member1DOB,
      var mobile1,
      var preName2,
      var memberName2,
      var member2DOB,
      var mobile2,
      var address,
      var residenceNumber,
      var email,
      var city,
      var pincode,
      var tenure,
      var validity,
      var type,
      var season,
      var apartment,
      var occupancy,
      var amcAmount,
      var amcDueDate,
      var dsaCode,
      var empCode,
      var rciEnrollment,
      var totalCost,
      var purchasePrice,
      var adminCharges,
      var amcFirstYear,
      var roundOffAmcFirstYearAmount,
      var preAmount,
      var initialPayment,
      var modeOfPayment,
      var otherCash,
      var otherCard,
      var otherOnline,
      var otherCheque,
      var balance,
      var numberOfEMI,
      var emi,
      var emiStartDate,
      var managerName,
      var repName,
      var offerStayNights,
      var offerStayDays,
      var offerNoOfAdults,
      var offerNoOfChild,
      var offerOnlyAccomodation,
      var offerAccomodation,
      var offerBreakfast,
      var offerDinner,
      var offerSightSeeing,
      var offerBalanceAmount,
      var offerValidity,
      var offerIncludeRemark,
      var offerNoOfAirtickets,
      var airtTicketType,
      var mafNo,
      var username,
      var dateOfHolding,
      ) async {
    // Read saved userId and dsaCode
    String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
    print('add member Dsa Code:$dsaCode');

    String userId = box.read("Id")?.toString() ?? 'null';
    print('wwwuseridEE:$userId');

    var url = "${baseUrl}AddmemberApi/MembersOnHold";

    var body = jsonEncode({
      "DateOfJoining": dateOfJoining.toIso8601String(),
      "PreName": preName,
      "MemberName1": memberName1,
      "Member1DOB": member1DOB.toIso8601String(),
      "Mobile1": mobile1,
      "PreName2": preName2,
      "MemberName2": memberName2,
      "Member2DOB": member2DOB.toIso8601String(),
      "Mobile2": mobile2,
      "Address": address,
      "ResidenceNumber": residenceNumber,
      "Email": email,
      "City": city,
      "Pincode": pincode,
      "Tenure": tenure.toString()??0,
      "Validity": validity.toIso8601String(),
      "Type": type,
      "Season": season,
      "Apartment": apartment,
      "Occupancy": occupancy,
      "AMC_Amount": amcAmount.toString() ?? 0,
      "AMC_DueDate": amcDueDate.toIso8601String(),
      "Dsa_Code": dsaCode,
      "EmpCode": empCode,
      "RCIEnrollment": rciEnrollment.toString() ?? 0,
      "TotalCost": totalCost.toString(),
      "PurchasePrice": purchasePrice.toString(),
      "AdminCharges": adminCharges.toString(),
      "AmcFirstYear": amcFirstYear.toString(),
      "RoundOffAmcFirstYearAmount": roundOffAmcFirstYearAmount.toString(),
      "PreAmount": preAmount.toString(),
      "InitialPayment": initialPayment.toString(),
      "ModeOfPayment": modeOfPayment,
      "OtherCash": otherCard.toString(),
      "OtherCard": otherCard.toString(),
      "OtherOnline": otherOnline.toString(),
      "OtherCheque": otherCheque.toString(),
      "Balance": balance.toString(),
      "NumberOfEMI": numberOfEMI.toString(),
      "EMI": emi.toString(),
      "EMIStartDate": emiStartDate.toIso8601String(),
      "ManagerName": managerName,
      "RepName": repName,
      "Offer_StayNights": offerStayNights.toString(),
      "Offer_StayDays": offerStayDays.toString(),
      "Offer_NoOfAdults": offerNoOfAdults.toString(),
      "Offer_NoOfChild": offerNoOfChild.toString(),
      "Offer_OnlyAccomodation": offerOnlyAccomodation.toString(),
      "Offer_Accomodation": offerAccomodation.toString(),
      "Offer_Breakfast": offerBreakfast.toString(),
      "Offer_Dinner": offerDinner.toString(),
      "Offer_SightSeeing": offerSightSeeing.toString(),
      "Offer_BalanceAmount": offerBalanceAmount.toString(),
      "Offer_Validity": offerValidity,
      "Offer_IncludeRemark": offerIncludeRemark,
      "Offer_NoOfAirtickets": offerNoOfAirtickets.toString(),
      "AirtTicketType": airtTicketType,
      "mafNo": mafNo,
      "Username": username,
      "DateOfHolding": dateOfHolding.toIso8601String(),
    });

    print("url: $url");
    print("body: $body");

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );

    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      print(response.statusCode);
      var responseDataa2 = json.decode(response.body);
      // var id = responseData['Data']['Id'];
      var membrOnHoldApprovalNum = responseDataa2['Data']['ApprovalNumber'];
      var memberId = responseDataa2['data']['Id'];
      box.write("Id", memberId);
      box.write("ApprovalNumber", membrOnHoldApprovalNum);
      print("Idddd:$memberId");
      print("response:$responseDataa2");

      // box.write("DsaCode", dsa);
      print("membrOnHoldApprovalNum: $membrOnHoldApprovalNum");
      // print('Saved Id: $id and ApprovalNumber: $approvalNumber and dsa: $dsa');
      print("response:$responseDataa2");
      return responseDataa2;
    } else if (response.statusCode == 401) {
      Get.snackbar('Message', response.body);
    } else {
      Get.snackbar('Error', response.body);
    }

    return response;
  }


  ///todo get getApprovalForm api 12...
  static Future<ApprovalFormModel?> getApprovalForm() async {

    String approvalNum = box.read("ApprovalNumber")?.toString() ?? 'null';
    print('approbal :$approvalNum');
var url = '${baseUrl}CommonApi/Maf?ApprovalNumber=$approvalNum';
    try {
      // Construct the API URL using the retrieved ApprovalNumber
      final response = await http.get(Uri.parse(
          //'https://new.signatureresorts.in/api/CommonApi/Maf?ApprovalNumber=3222'
          //https://new.signatureresorts.in/api/
         url
      ));
print("urlApproval:$url");

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        ApprovalFormModel? approvalFormModel = approvalFormModelFromJson(response.body);
        print("API Response ApprovalNumber: ${response.body}");

        print("ApprovalFormModel: $approvalFormModel");
        return approvalFormModel;
      } else {
        print("API Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("API Exception: $e");
      return null;
    }
  }



  ///todo post postSign api 13...
    static Future<void> saveSignatures( Uint8List signature1, Uint8List signature2, Uint8List signature3) async {
      String base64Signature1 = base64Encode(signature1);
      String base64Signature2 = base64Encode(signature2);
      String base64Signature3 = base64Encode(signature3);
      String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
      print('Sign Dsa Code:$dsaCode');
      String memberIddd = box.read("Id")?.toString() ?? 'null';
      print('memberIddd :$memberIddd');
      var uri = Uri.parse('${baseUrl}AddmemberApi/usersign');
      try {
        // Construct the API URL using the retrieved ApprovalNumber
        final response = await http.post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "Memeberid": memberIddd,
            "Memebersignimage": base64Signature1,
            "dsasignimage": base64Signature3, // Assuming this is the DSA sign image
            "DsaCode":dsaCode,
            "Memebersign1image": base64Signature2,
          }),
        );

        if (response.statusCode == 200) {
          print("sign response:$response");
          var responseData = json.decode(response.body);
          print("sign response:$responseData");
          print("sign response:$base64Signature3");

          return responseData;
        } else if (response.statusCode != 200) {
          throw Exception('Failed to save signatures');
        }
        else {
          print("API Error: ${response.statusCode} - ${response.body}");
          return null;
        }
      } catch (e) {
        print("API Exception: $e");
        return null;
      }

    }

  ///todo get getDocument api 14...
  static Future<Map<String, dynamic>?> getDocument() async {
    String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
    print('GetDoc Dsa Code:$dsaCode');
    String memberIdGetDoc = box.read("Id")?.toString() ?? 'null';
    print('GetDoc memberIddd :$memberIdGetDoc');
    var url = '${baseUrl}AddmemberApi/GetDocument?Memeberid=$memberIdGetDoc';
    print("doc url:$url");
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        var data = jsonDecode(r.body)['Data'];
        return {
          'MafFile': data['MafFile'],
          'ReceiptFile': data['ReceiptFile'],
          'AgreementFile': data['AgreementFile'],
        };
      } else {
        throw Exception('Failed to load documents');
      }
    } catch (error) {
      print('getDocumentError: $error');
    }
    return null;
  }














  static Future<http.Response> uploadSignature(
      String memeberId,
      String memeberSignImage,
      String dsaSignImage,
      String memeberSign1Image,
      ) async {
    String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
    print('Sign Dsa Code:$dsaCode');
      var uri = Uri.parse('$baseUrl/upload-signature');
      var response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'Memeberid': memeberId,
          'Memebersignimage': memeberSignImage,
          'dsasignimage': dsaSignImage,
          'DsaCode': dsaCode,
          'Memebersign1image': memeberSign1Image,
        }),
      );

    print("Response body Sign: ${response.body}");

    if (response.statusCode == 200) {
      print(response.statusCode);
      var responseDataa2 = json.decode(response.body);
      print("response:$responseDataa2");
      return responseDataa2;
    } else if (response.statusCode == 401) {
      Get.snackbar('Message', response.body);
    } else {
      Get.snackbar('Error', response.body);
    }
      return response;
    }
  // static Future<http.Response> uploadSignature(Uint8List signatureBytes) async {
  //   var uri = Uri.parse('$baseUrl/upload-signature');
  //   var request = http.MultipartRequest('POST', uri);
  //
  //   // Detect the mime type of the image
  //   String mimeType = lookupMimeType('', headerBytes: signatureBytes) ?? 'image/png';
  //
  //   request.files.add(http.MultipartFile.fromBytes(
  //     'signature',
  //     signatureBytes,
  //     contentType: MediaType(mimeType.split('/')[0], mimeType.split('/')[1]),
  //     filename: 'signature.png',
  //   ));
  //
  //   var response = await request.send();
  //   return http.Response.fromStream(response);
  // }
  static Future<SignResponse> upldSignature(Uint8List signatureBytes) async {
    final request = http.MultipartRequest('POST', Uri.parse('your_api_url'));

    request.files.add(
      http.MultipartFile.fromBytes(
        'signature',
        signatureBytes,
        filename: 'signature.png',
        contentType: MediaType('image', 'png'),
      ),
    );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print("sign:$responseBody");
      return SignResponse(status: responseBody['Status'], message: responseBody['Message']);
    } else {
      return SignResponse(status: 0, message: 'Failed to upload signature');
    }
  }

  static Future<SignModel> postSignature(Uint8List signatureBytes) async {
   var url = '${baseUrl}AddmemberApi/usersign';

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(
      http.MultipartFile.fromBytes(
        'signature',
        signatureBytes,
        filename: 'signature.png',
      ),
    );

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return signModelFromJson(responseBody);
    } else {
      return SignModel(status: 0, message: "Error posting signature");
    }
  }


  static LabSignupApi(
      var PAN,
      var LabName,
      var EmailId,
      var Password,
      var ConfirmPassword,
      var MobileNumber,
      var PhoneNumber,
      var Location,
      var StateMaster_Id,
      var CityMaster_Id,
      var LicenceNumber,
      var LicenceImage,
      var LicenceImageBase64,
      var PanImage,
      var PanImageBase64,
      var StartTime,
      var EndTime,
      var GSTNumber,
      var AadharNumber,
      var PinCode,
      ) async {
    var url = '${baseUrl}api/SignupApi/LabRegistration';
    var body = {
      "PAN": "$PAN",
      "LabName": LabName,
      "EmailId": EmailId,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
      "MobileNumber": MobileNumber,
      "PhoneNumber": PhoneNumber,
      "Location": Location,
      "StateMaster_Id": StateMaster_Id,
      "CityMaster_Id": CityMaster_Id,
      "LicenceNumber": LicenceNumber,
      "LicenceImage": "${LicenceImage}",
      "LicenceImageBase64": "${LicenceImageBase64}",
      "PanImage": "${PanImage}",
      "PanImageBase64": "${PanImageBase64}",
      "StartTime": "09:30:00.0000000",
      "EndTime": "21:40:00.0000000",
      "GSTNumber": GSTNumber,
      "AadharNumber": AadharNumber,
      "PinCode": PinCode,
    };

    http.Response r = await http.post(Uri.parse(url), body: body);
    print("Lab Signup Api: ${body}");
    if (r.statusCode == 200) {
      print("Lab Signup Api200: ${body}");
      Get.snackbar('message', r.body);
      return r;
    } else {
      Get.snackbar('Error', r.body);
      print("Errorlabsignup: ${r.body}");
      return r;
    }
  }
}


class SignResponse {
  final int status;
  final String message;

  SignResponse({required this.status, required this.message});
}