import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/sign_controller.dart';
import '../sign.dart';


class Signature extends StatelessWidget {
  final SignatureController signController = Get.put(SignatureController());

  void _showSignatureDialog(BuildContext context, int signatureNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Sign(
              onSignComplete: (signature) {
                signController.setSignature(signatureNumber, signature);
                Navigator.of(context).pop(); // Close the dialog after signing
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.blue, size: 28),
        ),
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Image(
            image: AssetImage('assets/logo.png'),
            height: 70,
            width: 70,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<SignatureController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Text("Sign here", style: TextStyle(fontSize: 20)),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _showSignatureDialog(context, 1),
                          child: Container(
                            height: h / 2.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: controller.signature1 == null
                                ? Center(child: Text('Tap to sign'))
                                : Image.memory(controller.signature1!),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _showSignatureDialog(context, 2),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: controller.signature2 == null
                                ? Center(child: Text('Tap to sign'))
                                : Image.memory(controller.signature2!),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => _showSignatureDialog(context, 3),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: controller.signature3 == null
                                ? Center(child: Text('Tap to sign'))
                                : Image.memory(controller.signature3!),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: controller.saveSignatures,
                          child: Text("Save Signatures"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
