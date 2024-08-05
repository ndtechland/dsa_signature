// maf_controller.dart
import 'package:get/get.dart';
import '../apiServices/api_service.dart';

class MafController extends GetxController {
  var isLoading = true.obs;
  var mafNumber = ''.obs;

  @override
  void onInit() {
    fetchMafNumber();
    super.onInit();
  }

  Future<void> fetchMafNumber() async {
    isLoading.value = true;
    final result = await ApiProvider.fetchMafNumber();
    if (result != null && result.status == 1 && result.data != null) {
      mafNumber.value = result.data!.mafNumber;
      print("Fetched MAF Number: ${result.data!.mafNumber}");
    } else {
      print("Failed to fetch MAF number");
    }
    isLoading.value = false;
  }
}
