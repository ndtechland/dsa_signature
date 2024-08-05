import 'dart:async';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import '../apiServices/api_service.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  RxBool isLoading = true.obs;

  RxString cvUrl = ''.obs;

  GetProfileModel? getprofileModel;


  Future<void> profileApi() async {
    isLoading(true);
    final box = GetStorage();
    String dsaCode = box.read("DsaCode")?.toString() ?? 'null';
    print("dsaCode profile:$dsaCode");
    getprofileModel = await ApiProvider.PriofileApi();
print("profile try 1");
    if (getprofileModel?.data?.dsaCode == null) {
      print("profile try 2");

      isLoading(true);
      getprofileModel = await ApiProvider.PriofileApi();
    }
    if (getprofileModel?.data?.dsaCode != null) {
      //Get.to(() => TotalPrice());
      print("profile try 3");

      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    profileApi();
  }

  @override
  void onClose() {
    super.onClose();
  }
}