import 'package:dsa_app/apiServices/api_service.dart';
import 'package:dsa_app/model/getUserName_model.dart';
import 'package:get/get.dart';

class UserNameController extends GetxController {
  var userName = Rxn<GetUserNameModel>();
  var isLoading = false.obs;
  var resultUserName = ''.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    isLoading.value = true;
    resultUserName.value = ''; // Reset the value before fetching
    errorMessage.value = ''; // Reset the error message before fetching

    try {
      final fetchedUserName = await ApiProvider.fetchUserName();
      if (fetchedUserName?.result != null) {
        userName.value = fetchedUserName;

        // Safely access the 'result' field
        if (fetchedUserName?.result != null && fetchedUserName!.result!.isNotEmpty) {
          resultUserName.value = fetchedUserName.result!;
          print("Fetched User Data: ${fetchedUserName.toJson()}");
        } else {
          errorMessage.value = 'Result field is empty or null.';
        }
      } else {
        errorMessage.value = 'Failed to load user data.';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
