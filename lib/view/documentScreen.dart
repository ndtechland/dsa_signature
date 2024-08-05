import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import '../controller/getDocument_controller.dart';

class DocumentScreen extends StatelessWidget {
  final GetDocumentController controller = Get.put(GetDocumentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
      ),
      body: Obx(() {
        if (controller.mafFile.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            ListTile(
              title: Text('MAF File'),
              onTap: (){
                print("mafFile:${controller.mafFile}");
                controller.openDocument(controller.mafFile.value);},
            ),
            ListTile(
              title: Text('Receipt File'),
              onTap: () => controller.openDocument(controller.receiptFile.value),
            ),
            ListTile(
              title: Text('Agreement File'),
              onTap: () => controller.openDocument(controller.agreementFile.value),
            ),
          ],
        );
      }),
    );
  }

}

class PDFViewer extends StatelessWidget {
  final String url;
  static var baseUrlDOC = 'https://new.signatureresorts.in';
  PDFViewer(this.url);

  @override
  Widget build(BuildContext context) {
    print("doccc:$baseUrlDOC$url");
    return Scaffold(
      appBar: AppBar(title: Text('PDF Viewer')),
      body: PDF().cachedFromUrl(
        "$baseUrlDOC$url",
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
