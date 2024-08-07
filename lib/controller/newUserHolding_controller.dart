import 'package:dsa_app/apiServices/api_service.dart';
import 'package:dsa_app/model/newUserHoldingPayment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewuserholdingController extends GetxController{
  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> newUserHoldingFormKey = GlobalKey<FormState>();
  var isSuccess = false.obs;
  var mafNum = ''.obs;
  var dsaCode = ''.obs;
  TextEditingController dateHolding = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController otherCashController = TextEditingController();
  final TextEditingController otherChequeController = TextEditingController();
  final TextEditingController otherCardController = TextEditingController();
  final TextEditingController otherOnlineController = TextEditingController();
  final TextEditingController mafNumber = TextEditingController();
  String dropdownPayment = 'Select';
  String dropdownvalue1 = 'Select';
  @override
  void onInit(){
    super.onInit();
    final box = GetStorage();
    mafNumber.text = box.read('Approval Number') ?? '';
    mafNum.value = mafNumber.text;
    // dsaController.text = box.read('DsaCode') ?? '';
    // dsaCode.value = dsaController.text;
    // if (box.hasData('DsaCode')) {
    //   loginController.usernameController1.text = box.read('DsaCode');
    // }
  }
  Future<void> postNewUserHolding() async {
    isLoading.value = true;
    try{
      print("try2 new user");
      final res = await ApiProvider.newUserHoldingPayment(nameController.text, emailController.text, mobileController.text, amountController.text, dropdownPayment, otherCashController.text, otherChequeController.text, otherCardController.text, otherOnlineController.text, dropdownvalue1,parseDate(dateHolding.text)!);
      isSuccess.value = res.statusCode==200;
      print("try 3 new user");
      if(res.statusCode == 200){
        final result = newuserholdingpaymentModelFromJson(res.body);
        print("New User Holding Payment:${result.message}");
        //mafNum.value = result.data?.approvalNumber.toString() ?? '';

        Get.snackbar("Success", "New User Holding Payment added successfully.");

      } else {
        print("Error: Failed to add new user holding payment");
        Get.snackbar("Error", "Failed to add new user holding payment");

      }
    } catch(e){
      isSuccess.value = false;
      print("Error New User :$e");
    } finally {
      isLoading.value=false;
    }
  }
  void checkNewUserHolding(){
    final formState = newUserHoldingFormKey.currentState;
    if(formState!=null){
      print("formState :$formState");
      formState.save();
      postNewUserHolding();
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