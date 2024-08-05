import 'dart:io';

import 'package:dsa_app/apiServices/api_service.dart';
import 'package:dsa_app/model/getDocument_model.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
class GetDocumentController extends GetxController{
  RxBool isLoading = true.obs;

  RxString cvUrl = ''.obs;

  GetDocumentModel? getDocumentModel;
  static var baseUrlDOC = 'https://new.signatureresorts.in';
  var mafFile = ''.obs;
  var receiptFile = ''.obs;
  var agreementFile = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDocument();
  }

  //Future<void> fetchDocument() async {
    Future<void> fetchDocument() async {
      isLoading(true);
      try {
        var documents = await ApiProvider.getDocument();
        mafFile.value = documents?['MafFile'];
        receiptFile.value = documents?['ReceiptFile'];
        agreementFile.value = documents?['AgreementFile'];
      } catch (e) {
        // Handle error
      }
    }
  Future<void> openDocument(String url) async {

    try {
      var tempDir = await getTemporaryDirectory();
      var tempFile = File('${tempDir.path}/${url.split('/').last}');
      print("tempFile1:${tempFile.path}");

      if (!await tempFile.exists()) {
        var response = await http.get(Uri.parse("https://new.signatureresorts.in$url"));
        await tempFile.writeAsBytes(response.bodyBytes);
      }
      print("https://new.signatureresorts.in$url");
      print("tempFile1:${tempFile.path}");

      await OpenFile.open(tempFile.path);
      print("tempFile2:${tempFile.path}");
    } catch (e) {
      // Handle error
      print("Error opening file: $e");
    }
  }
    // if(getDocumentModel?.getDocumentData?.mafFile==null){
    //   isLoading(true);
    //   getDocumentModel = await ApiProvider.getDocument();
    // } if (getDocumentModel?.getDocumentData?.mafFile!=null){
    //   isLoading(false);
    // }
 // }

}