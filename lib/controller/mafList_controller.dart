// controllers/member_controller.dart
import 'package:dsa_app/apiServices/api_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/mafList_model.dart';


class MemberController extends GetxController {
  var isLoading = true.obs;
  var members = <MafListData>[].obs;
  String dropdownvalue = 'Select';
  GetMafListModel? getMafListModel;

  @override
  void onInit() {
    fetchMembersList();
    super.onInit();
  }

  Future<void> fetchMembersList() async {
    isLoading.value = true;
    final result = await ApiProvider.MafListApi();
    if (result != null && result.status == 200 && result.data.isNotEmpty) {
      members.value = result.data;

      // Save IDs to SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> ids = result.data.map((e) => e.id.toString()).toList();
      await prefs.setStringList('member_ids', ids);

      print("Fetched ${result.data.length} members");
      print("Fetched ${members.value} members");
    } else {
      print("Failed to fetch members");
    }
    isLoading.value = false;
  }
}
