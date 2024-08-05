import 'package:dsa_app/controller/controller.dart';
import 'package:dsa_app/model/login_model2.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../apiServices/api_service.dart';
import '../view/account_service2.dart';
import '../view/home.dart';



class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController usernameController1 = TextEditingController();
  late TextEditingController passwordController1 = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  Future<void> loginApi() async {
    try {
      isLoading.value = true;

      final response = await ApiProvider.LoginApi(
        usernameController1.text,
        passwordController1.text,
      );

      if (response.statusCode == 200) {


        final accountData = loginResponseFromJson(response.body);
        await accountService2.setAccountData2(accountData);

        Get.off(() => const Home());
        final box = GetStorage();
        box.write('DsaCode', usernameController1.text);
        print("userName:$usernameController1");
        isLoggedIn.value = true;
      } else {
        Get.snackbar('Error', 'Failed to login. Please try again.');
      }
    } catch (e) {
      print('Error during login: $e');
      Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }


  String? validateUser(String value) {
    if (value.isEmpty) {
      return 'Please provide a username';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 4) {
      return 'Please provide a valid password';
    }
    return null;
  }
  void checkLogin() {
    final formState = loginFormKey.currentState;
    if (formState != null && formState.validate()) {
      formState.save();
      loginApi();
    }
  }
}