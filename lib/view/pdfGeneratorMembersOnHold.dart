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
import '../controller/membersOnHold_controller.dart';
import '../controller/newUserHolding_controller.dart';
import '../model/getMembersOnHoldList_model.dart';
class PdfGeneratorMembersOnHold extends StatelessWidget {
  const PdfGeneratorMembersOnHold({super.key});

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
    final MemberData selectedMember;
    final ByteData bytes = await rootBundle.load('assets/logo.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    final GenerateMafController _controller = Get.put(GenerateMafController());
    final LoginController _loginController = Get.put(LoginController());
    final AddMemberController _addMember = Get.put(AddMemberController());
    final MemberController _memberController = Get.put(MemberController());
    final MembersOnHoldController _memberOnHoldController = Get.put(MembersOnHoldController());
    final NewuserholdingController newuserholdingController = Get.put(NewuserholdingController());
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
                  buildTableRow("User Name",  _memberOnHoldController.userNameController!.text),
                  //buildTableRow("Guest ID",  selectedMember.mafNumber),
                  buildTableRow("Date Of Joining", _memberOnHoldController.dateOfJoining!.text),
                  buildTableRow("Date Of Holding", _memberOnHoldController.dateOfHolding!.text),
                  buildTableRow("Member Name 1", newuserholdingController.nameController.text),
                  buildTableRow("Member 1 D.O.B", _memberOnHoldController.dob1!.text),
                  buildTableRow("MobileNO 1 ", newuserholdingController.mobileController.text),
                  buildTableRow("Member Name 2", _memberOnHoldController.nameController2!.text),
                  buildTableRow("Member 2 D.O.B", _memberOnHoldController.dob2!.text),
                  buildTableRow("MobileNO 2 ", _memberOnHoldController.numberController2!.text),
                  buildTableRow("Address ", _memberOnHoldController.addressController!.text),
                  buildTableRow("Residence ", _memberOnHoldController.residenceController!.text),
                  buildTableRow("Email ", _memberOnHoldController.emailController!.text),
                  buildTableRow("City ", _memberOnHoldController.cityController!.text),
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
                  buildTableRow("Tenure", _memberOnHoldController.dropdownTenure),
                  buildTableRow("Validity", _memberOnHoldController.validityController!.text),
                  buildTableRow("Type", _memberOnHoldController.dropdownType),
                  buildTableRow("Season", _memberOnHoldController.dropdownSeason),
                  buildTableRow("Apartment", _memberOnHoldController.dropdownApartment),
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
                  buildTableRow("Occupancy", _memberOnHoldController.occupancyController!.text),
                  buildTableRow("AMC(Amount) + GST", _memberOnHoldController.amcController!.text),
                  buildTableRow("AMC(1st Due Date)", _memberOnHoldController.amcDueController!.text),
                  buildTableRow("DSA-Code", _loginController.usernameController1.text),
                  buildTableRow("EMP-Code", _memberOnHoldController.empCodeController!.text),
                  buildTableRow("RCI Enrollment", _memberOnHoldController.rciController!.text),
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
                  buildTableRow("Total Cost", _memberOnHoldController.totalCostController!.text),
                  buildTableRow("Purchase Price", _memberOnHoldController.purchaseController!.text),
                  buildTableRow("Admin Charges", _memberOnHoldController.adminController!.text),
                  buildTableRow("Round Off Amount", _memberOnHoldController.roundOffController!.text),
                  buildTableRow("Pre Amount", _memberOnHoldController.preAmoController!.text),
                  buildTableRow("Initial Payment", _memberOnHoldController.initialPayController!.text),
                  buildTableRow("Mode Of Initial Payment", _memberOnHoldController.purchaseController!.text),
                  buildTableRow("Balance", _memberOnHoldController.balanceController!.text),
                  buildTableRow("No of EMIs", _memberOnHoldController.noOfEmiController!.text),
                  buildTableRow("EMI", _memberOnHoldController.emiController!.text),
                  buildTableRow("EMI Start Date", _memberOnHoldController.emiDateInput!.text),
                  buildTableRow("Manager Name", _memberOnHoldController.managerNameController!.text),
                  buildTableRow("Rep-Name", _memberOnHoldController.repNameController!.text),
                  buildTableRow("Remarks", _memberOnHoldController.remarkController!.text),
                  //buildTableRow("Date Of Holding", _memberOnHoldController.dateOfHolding!.text),
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
