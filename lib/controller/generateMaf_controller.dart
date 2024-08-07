import 'package:dsa_app/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../apiServices/api_service.dart';
import '../model/generateMaf_model1.dart';
import 'login_controller.dart';

class GenerateMafController extends GetxController {
  LoginController loginController = Get.put(LoginController());
  final RxBool isLoading = false.obs;
  final responseMessage = ''.obs;
  var isSuccess = false.obs;
  var approvalNum = ''.obs;
  var dsaCode = ''.obs;

  final GlobalKey<FormState> generateMafFormKey = GlobalKey<FormState>();

  final TextEditingController guestIdController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  late TextEditingController dsaController = TextEditingController();
  late TextEditingController dropdown = TextEditingController();
  late TextEditingController approvalNumber = TextEditingController();
  String dropdownvalue = 'Select';

@override
void onInit(){
  super.onInit();
guestIdController.text;
dateInput.text;
numberController.text;
nameController.text;
  final box = GetStorage();
  approvalNumber.text = box.read('Approval Number') ?? '';
  approvalNum.value = approvalNumber.text;
  dsaController.text = box.read('DsaCode') ?? '';
  dsaCode.value = dsaController.text;
  if (box.hasData('DsaCode')) {
    loginController.usernameController1.text = box.read('DsaCode');
  }
}
@override
void onClose() {
  super.onClose();
  // nameController.dispose();
  // dateInput.dispose();
  // numberController.dispose();
  // dropdown.dispose();
  dropdownvalue;
}
  Future<void> postGenerateMaf() async {
    isLoading.value = true;
    try {
      print("try2");
      //dsaController = GetStorage().read('DsaCode');
      //DateTime parsedDate = DateFormat('MM/dd/yyyy').parse(dateInput.text);
      // print('Data being sent: ${data.toJson()}');
      final response = await ApiProvider.generateMaf(nameController.text,guestIdController.text,numberController.text,dropdownvalue,parseDate(dateInput.text)!);
      isSuccess.value = response.statusCode == 1;
      print("try3");
      print("dsa:${loginController.usernameController1}");
      if (response.statusCode == 200) {
        // Handle successful response
        final result = postGenerateMafModelFromJson(response.body);
       // responseMessage.value = result.message;
        print('Success: ${result.message}');
        responseMessage.value = result.message;

        // Extract and store the required values
        approvalNum.value = result.data?.approvalNumber.toString() ?? '';
        dsaCode.value = result.data?.dsaCode ?? '';

        print("ApprovalNum: ${approvalNum.value}");
        print("DSA Code: ${dsaCode.value}");
        Get.snackbar("Success", "Generate Maf successfully.");

      }
      else {
       // responseMessage.value = 'Failed to post data';
        print('Error: Failed to post data');
        Get.snackbar("Error", "Failed to Generate Maf.");

      }
    } catch (e) {
      isSuccess.value = false;
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
  void checkGenerateMaf() {
  print("try1");
    final formState = generateMafFormKey.currentState;
    if (formState != null && formState.validate()) {
      print("formstate");
      formState.save();
      postGenerateMaf();
    }
  }
}

DateTime? parseDate(String value) {
  try {
    return DateTime.parse(value);
  } catch (e) {
    return null;
  }
}
// class GenerateMafController extends GetxController {
//   var isLoading = false.obs;
//   var responseMessage = ''.obs;
//
//   Future<void> postGenerateMaf(PostGenerateMafModel data) async {
//     try {
//       isLoading(true);
//       final response = await ApiService.postGenerateMaf(data);
//       // Assuming response has a success flag and message
//       isSuccess.value = response.status == 1;
//       responseMessage.value = response.message;
//     } catch (e) {
//       isSuccess.value = false;
//       responseMessage.value = 'An error occurred: $e';
//     } finally {
//       isLoading(false);
//     }
//   }
// }
