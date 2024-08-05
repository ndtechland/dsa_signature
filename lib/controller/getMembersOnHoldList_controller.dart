import 'package:dsa_app/model/getMembersOnHoldList_model.dart';
import 'package:get/get.dart';

import '../apiServices/api_service.dart';

class GetMembersOnHoldListController extends GetxController{
  var isLoading = true.obs;
  var name = ''.obs;
  var members = <MemberData>[].obs;
  String dropdownvalue = 'Select';

  @override
  void onInit() {
    fetchMembersOnHold();
    super.onInit();
  }

  Future<void> fetchMembersOnHold() async {
    isLoading.value = true;
    final result = await ApiProvider.getMembersOnHoldListApi();
    print("members result:$result");
    if (result != null && result.status == 200 && result.data.isNotEmpty) {
      members.value = result.data;
      print("Fetched ${result.data.length} members on hold");
      print("Fetched ${members.value} members on hold");
    } else {
      print("Failed to fetch members on hold");
    }
    isLoading.value = false;
  }

  // Future<void> fetchMembersOnHold() async {
  //   isLoading.value = true;
  //   try {
  //     final result = await ApiProvider.getMembersOnHoldListApi();
  //     if (result != null && result.status == 200 && result.data != null) {
  //       // Ensure `result.data` is a List<Map<String, dynamic>>
  //       members.value = (result.data as List)
  //           .map((e) => MemberData.fromJson(e as Map<String, dynamic>))
  //           .toList();
  //       print("Fetched ${members.length} members on hold");
  //     } else {
  //       print("Failed to fetch members on hold");
  //     }} catch (e) {
  //     print("Error: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

}