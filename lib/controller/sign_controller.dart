import 'dart:typed_data';
import 'package:dsa_app/apiServices/api_service.dart';
import 'package:get/get.dart';


class SignatureController extends GetxController {
  Uint8List? signature1;
  Uint8List? signature2;
  Uint8List? signature3;

  // Function to update the signature images
  void setSignature(int index, Uint8List signature) {
    if (index == 1) {
      signature1 = signature;
    } else if (index == 2) {
      signature2 = signature;
    } else if (index == 3) {
      signature3 = signature;
    }
    update(); // Notify listeners about the update
  }

  // Function to save the signatures to the server
  Future<bool> saveSignatures() async {
    if (signature1 != null && signature2 != null && signature3 != null) {
      print("signature:$signature1");
      try {
        final res = await ApiProvider.saveSignatures(
          signature1!,
          signature2!,
          signature3!,
        );
        print("sign1:$signature1");
        Get.snackbar("Success", "Signatures saved successfully.");
        return true;

      } catch (error) {
        Get.snackbar("Error", "Failed to save signatures.");
        return false;

      }
    } else {
      Get.snackbar("Error", "Please provide all three signatures.");
      return false;
    }
  }
}
