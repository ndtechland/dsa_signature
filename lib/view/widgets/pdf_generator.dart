import 'package:dsa_app/controller/addMember_controller.dart';
import 'package:dsa_app/controller/login_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';

import '../../controller/controller.dart';
import '../../controller/generateMaf_controller.dart';
import '../../controller/mafList_controller.dart';

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }

  Future<Uint8List> makePdf() async {
    final pdf = pw.Document();
    final ByteData bytes = await rootBundle.load('assets/logo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    final GenerateMafController _controller = Get.put(GenerateMafController());
    final LoginController _loginController = Get.put(LoginController());
    final AddMemberController _addMember = Get.put(AddMemberController());
    final MemberController _memberController = Get.put(MemberController());
    print("guest Id Pdf:${_controller.guestIdController}");

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(10),
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Header(
                    text: "Register User",
                    level: 1,
                    textStyle: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  pw.Image(
                    pw.MemoryImage(byteList),
                    fit: pw.BoxFit.contain,
                    height: 120,
                    width: 120,
                  ),
                ],
              ),
              pw.Table(
                border: pw.TableBorder.all(width: 1),
                children: [
                  buildTableRow("User Name",  _addMember.userNameController!.text),
                  buildTableRow("Guest ID",  _memberController.dropdownvalue),
                  buildTableRow("Date Of Joining", _controller.dateInput.text),
                  buildTableRow("Member Name 1", _controller.nameController.text),
                  buildTableRow("Member 1 D.O.B", _addMember.dob1!.text),
                  buildTableRow("MobileNO 1 ", _controller.numberController.text),
                  buildTableRow("Member Name 2", _addMember.nameController2!.text),
                  buildTableRow("Member 2 D.O.B", _addMember.dob2!.text),
                  buildTableRow("MobileNO 2 ", _addMember.numberController2!.text),
                  buildTableRow("Address ", _addMember.addressController!.text),
                  buildTableRow("Residence ", _addMember.residenceController!.text),
                  buildTableRow("Email ", _addMember.emailController!.text),
                  buildTableRow("City ", _addMember.cityController!.text),
                ],
              ),
              // pw.Table(
              //   border: pw.TableBorder.all(width: 1),
              //   children: [
              //     buildTableRow("Guest Id", _controller.guestIdController.text),
              //     buildTableRow("Date Of Joining", _controller.dateInput.toString()),
              //     buildTableRow("Member Name 1", nameController1.text),
              //     buildTableRow("Member 1 D.O.B", dateInput1.text),
              //     buildTableRow("MobileNO 1 ", numberController1.text),
              //     buildTableRow("Member Name 2", nameController2.text),
              //     buildTableRow("Member 2 D.O.B", dateInput2.text),
              //     buildTableRow("MobileNO 2 ", numberController2.text),
              //     buildTableRow("Address ", addressController.text),
              //     buildTableRow("Residence ", residenceController.text),
              //     buildTableRow("Email ", emailController.text),
              //     buildTableRow("City ", cityController.text),
              //   ],
              // ),
              pw.Header(
                text: "Membership Details",
                level: 1,
                textStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              pw.Table(
                border: pw.TableBorder.all(width: 1),
                children: [
                  buildTableRow("Tenure", _addMember.dropdownTenure),
                  buildTableRow("Validity", _addMember.validityController!.text),
                  buildTableRow("Type", _addMember.dropdownType),
                  buildTableRow("Season", _addMember.dropdownSeason),
                  buildTableRow("Apartment", _addMember.dropdownApartment),
                ],
              ),
            ],
          );
        },
      ),
    );

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.fromLTRB(10,20,10,10),
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Table(
                border: pw.TableBorder.all(width: 1),
                children: [
                  buildTableRow("Occupancy", _addMember.occupancyController!.text),
                  buildTableRow("AMC(Amount) + GST", _addMember.amcController!.text),
                  buildTableRow("AMC(1st Due Date)", _addMember.amcDueController!.text),
                  buildTableRow("DSA-Code", _loginController.usernameController1.text),
                  buildTableRow("EMP-Code", _addMember.empCodeController!.text),
                  buildTableRow("RCI Enrollment", _addMember.rciController!.text),
                ],
              ),
              pw.Header(
                text: "Payment Details",
                level: 1,
                textStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              pw.Table(
                border: pw.TableBorder.all(width: 1),
                children: [
                  buildTableRow("Total Cost", _addMember.totalCostController!.text),
                  buildTableRow("Purchase Price", _addMember.purchaseController!.text),
                  buildTableRow("Admin Charges", _addMember.adminController!.text),
                  buildTableRow("Round Off Amount", _addMember.roundOffController!.text),
                  buildTableRow("Pre Amount", _addMember.preAmoController!.text),
                  buildTableRow("Initial Payment", _addMember.initialPayController!.text),
                  buildTableRow("Mode Of Initial Payment", _addMember.purchaseController!.text),
                  buildTableRow("Balance", _addMember.balanceController!.text),
                  buildTableRow("No of EMIs", _addMember.noOfEmiController!.text),
                  buildTableRow("EMI", _addMember.emiController!.text),
                  buildTableRow("EMI Start Date", _addMember.emiDateInput!.text),
                  buildTableRow("Manager Name", _addMember.managerNameController!.text),
                  buildTableRow("Rep-Name", _addMember.repNameController!.text),
                  buildTableRow("Remarks", _addMember.remarkController!.text),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.TableRow buildTableRow(String label, String value) {
    return pw.TableRow(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Text(
            label,
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          ),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Text(
            value,
            style: const pw.TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
