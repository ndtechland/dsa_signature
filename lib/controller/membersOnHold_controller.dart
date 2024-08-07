import 'dart:convert';

import 'package:dsa_app/apiServices/api_service.dart';
import 'package:dsa_app/controller/newUserHolding_controller.dart';
import 'package:dsa_app/model/memberOnHold_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/generateMaf_model1.dart';
import 'generateMaf_controller.dart';
import 'getMembersOnHoldList_controller.dart';

class MembersOnHoldController extends GetxController {
  final RxBool isLoading = false.obs;
  var isSuccess = false.obs;
  final NewuserholdingController newuserholdingController = Get.put(NewuserholdingController());
  final GetMembersOnHoldListController membersOnHoldListController = Get.put(GetMembersOnHoldListController());
  TextEditingController? dateOfJoining,
      dob1,
      dob2,
      nameController2,
      numberController2,
      addressController,
      residenceController,
      emailController,
      cityController,
      pincodeController,
      phController,
      validityController,
      occupancyController,
      amcController,
      amcDueController,
      dsaCodeController,
      empCodeController,
      rciController,
      totalCostController,
      purchaseController,
      adminController,
      firstAmcController,
      roundOffController,
      preAmoController,
      initialPayController,
      balanceController,
      emiDateInput,
      managerNameController,
      repNameController,
      destinationController,
      nightStayController,
      dayStayController,
      adultOccupancyController,
      childOccupancyController,
      balanceOfferController,
      validityOfferController,
      remarkController,
      emiController,
      noOfEmiController,
      userNameController,
      otherCashController,
      otherCardController,
      otherOnlineController,
      otherChequeController,
      dateOfHolding
  ;
  final GlobalKey<FormState> membersOnHoldFormKey = GlobalKey<FormState>();
  // TextEditingController dob1 = TextEditingController();
  // TextEditingController dob2 = TextEditingController();
  // final TextEditingController nameController2 = TextEditingController();
  // final TextEditingController numberController2 = TextEditingController();
  // final TextEditingController addressController = TextEditingController();
  // final TextEditingController residenceController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController cityController = TextEditingController();
  // final TextEditingController pincodeController = TextEditingController();
  // final TextEditingController phController = TextEditingController();
  // final TextEditingController validityController = TextEditingController();
  // final TextEditingController occupancyController = TextEditingController();
  // final TextEditingController amcController = TextEditingController();
  // final TextEditingController amcDueController = TextEditingController();
  // final TextEditingController dsaCodeController = TextEditingController();
  // final TextEditingController empCodeController = TextEditingController();
  // final TextEditingController rciController = TextEditingController();
  // final TextEditingController totalCostController = TextEditingController();
  // final TextEditingController purchaseController = TextEditingController();
  // final TextEditingController adminController = TextEditingController();
  // final TextEditingController firstAmcController = TextEditingController();
  // final TextEditingController roundOffController = TextEditingController();
  // final TextEditingController preAmoController = TextEditingController();
  // final TextEditingController initialPayController = TextEditingController();
  // final TextEditingController balanceController = TextEditingController();
  // TextEditingController emiDateInput = TextEditingController();
  // final TextEditingController managerNameController = TextEditingController();
  // final TextEditingController repNameController = TextEditingController();
  // final TextEditingController destinationController = TextEditingController();
  // final TextEditingController nightStayController = TextEditingController();
  // final TextEditingController dayStayController = TextEditingController();
  // final TextEditingController adultOccupancyController = TextEditingController();
  // final TextEditingController childOccupancyController = TextEditingController();
  // final TextEditingController balanceOfferController = TextEditingController();
  // final TextEditingController validityOfferController = TextEditingController();
  // final TextEditingController remarkController = TextEditingController();
  // final TextEditingController emiController = TextEditingController();
  // final TextEditingController noOfEmiController = TextEditingController();
  String dropdownTenure = 'Select';
  String dropdownType = 'Regular';
  String dropdownSeason = 'Premium';
  String dropdownApartment = 'Select';
  String dropdownPayment = 'Select';
  String dropdownvalue2 = 'Select';
  String dropdownTicket = 'Select';

  bool specialOffer = false;
  bool onlyAccomodation = false;
  bool accomodation = false;
  bool breakfast = false;
  bool dinner = false;
  bool sightSeeing = false;
  bool airTicket = false;

  @override
  void onInit() {
    super.onInit();
    dateOfJoining= TextEditingController();
    // dob1.text;
    // dob2.text;
    // validityController.text;
    // amcDueController.text;
    dob1 = TextEditingController();
    dob2 = TextEditingController();
    nameController2 = TextEditingController();
    numberController2 = TextEditingController();
    addressController = TextEditingController();
    residenceController = TextEditingController();
    emailController = TextEditingController();
    cityController = TextEditingController();
    pincodeController = TextEditingController();
    phController = TextEditingController();
    validityController = TextEditingController();
    occupancyController = TextEditingController();
    amcController = TextEditingController();
    amcDueController = TextEditingController();
    dsaCodeController = TextEditingController();
    empCodeController = TextEditingController();
    rciController = TextEditingController();
    totalCostController = TextEditingController();
    purchaseController = TextEditingController();
    adminController = TextEditingController();
    firstAmcController = TextEditingController();
    roundOffController = TextEditingController();
    preAmoController = TextEditingController();
    initialPayController = TextEditingController();
    balanceController = TextEditingController();
    emiDateInput = TextEditingController();
    managerNameController = TextEditingController();
    repNameController = TextEditingController();
    destinationController = TextEditingController();
    nightStayController = TextEditingController();
    dayStayController = TextEditingController();
    adultOccupancyController = TextEditingController();
    childOccupancyController = TextEditingController();
    balanceOfferController = TextEditingController();
    validityOfferController = TextEditingController();
    remarkController = TextEditingController();
    emiController = TextEditingController();
    noOfEmiController = TextEditingController();
    userNameController = TextEditingController();
    otherOnlineController = TextEditingController();
    otherCashController = TextEditingController();
    otherCardController = TextEditingController();
    otherChequeController = TextEditingController();
    dateOfHolding = TextEditingController();
    // Initializations can go here
  }

  Future<void> postMemberOnHold() async {
    isLoading.value = true;
    try {
      String? dateOfJoiningText = dateOfJoining?.text;
      String? member1DOBText = dob1?.text;
      String? member2DOBText = dob2?.text;
      String? validityText = validityController?.text;
      String? amcDueDateText = amcDueController?.text;
      String? emiStartDateText = emiDateInput?.text;
      String? dateofHoldingText = dateOfHolding?.text;

      print("DateOfJoiningInput: $dateOfJoiningText");
      print("Member1DOBInput: $member1DOBText");
      print("Member2DOBInput: $member2DOBText");
      print("ValidityInput: $validityText");
      print("AMCDueDateInput: $amcDueDateText");
      print("EMIStartDateInput: $emiStartDateText");
      print("DateOfHoldingInput: $dateofHoldingText");

      DateTime? dateOfJoininggg = parseDate(dateOfJoiningText!);
      DateTime? member1DOB = parseDate(member1DOBText!);
      DateTime? member2DOB = parseDate(member2DOBText!);
      DateTime? validity = parseDate(validityText!);
      DateTime? amcDueDate = parseDate(amcDueDateText!);
      DateTime? emiStartDate = parseDate(emiStartDateText!);
      DateTime? dateTimeOfHolding = parseDate(dateofHoldingText!);

      if (dateOfJoining == null) {
        Get.snackbar('Error', 'Please enter a valid Date of Joining in yyyy-MM-dd format');
        return;
      }
      if (member1DOB == null) {
        Get.snackbar('Error', 'Please enter a valid Member 1 DOB in yyyy-MM-dd format');
        return;
      }
      if (member2DOB == null) {
        Get.snackbar('Error', 'Please enter a valid Member 2 DOB in yyyy-MM-dd format');
        return;
      }
      if (validity == null) {
        Get.snackbar('Error', 'Please enter a valid Validity Date in yyyy-MM-dd format');
        return;
      }
      if (amcDueDate == null) {
        Get.snackbar('Error', 'Please enter a valid AMC Due Date in yyyy-MM-dd format');
        return;
      }
      if (emiStartDate == null) {
        Get.snackbar('Error', 'Please enter a valid EMI Start Date in yyyy-MM-dd format');
        return;
      }
      if (dateOfHolding == null) {
        Get.snackbar('Error', 'Please enter a valid Holding Start Date in yyyy-MM-dd format');
        return;
      }

      // int? tenure = int.tryParse(dropdownTenure);
      // int? amcAmount = int.tryParse(amcController.text);
      // int? rciEnrollment = int.tryParse(rciController.text);
      // int? totalCost = int.tryParse(totalCostController.text);
      // int? purchasePrice = int.tryParse(purchaseController.text);
      // int? adminCharges = int.tryParse(adminController.text);
      // int? amcFirstYear = int.tryParse(firstAmcController.text);
      // int? roundOff = int.tryParse(roundOffController.text);
      // int? preAmount = int.tryParse(preAmoController.text);
      // int? initialPayment = int.tryParse(initialPayController.text);
      // int? balance = int.tryParse(balanceController.text);
      // int? numberOfEMI = int.tryParse(noOfEmiController.text);
      // int? emi = int.tryParse(emiController.text);
      // int? nightStay = int.tryParse(nightStayController.text);
      // int? dayStay = int.tryParse(dayStayController.text);
      // int? adultOccupancy = int.tryParse(adultOccupancyController.text);
      // int? childOccupancy = int.tryParse(childOccupancyController.text);
      // int? balanceOffer = int.tryParse(balanceOfferController.text);
      // int? noOfAirtickets = int.tryParse(dropdownTicket);
      //
      // print("Tenure: $tenure");
      // print("AMC Amount: $amcAmount");
      // print("RCI Enrollment: $rciEnrollment");
      // print("Total Cost: $totalCost");
      // print("Purchase Price: $purchasePrice");
      // print("Admin Charges: $adminCharges");
      // print("AMC First Year: $amcFirstYear");
      // print("Round Off: $roundOff");
      // print("Pre Amount: $preAmount");
      // print("Initial Payment: $initialPayment");
      // print("Balance: $balance");
      // print("Number of EMI: $numberOfEMI");
      // print("EMI: $emi");
      // print("Night Stay: $nightStay");
      // print("Day Stay: $dayStay");
      // print("Adult Occupancy: $adultOccupancy");
      // print("Child Occupancy: $childOccupancy");
      // print("Balance Offer: $balanceOffer");
      // print("No of Air Tickets: $noOfAirtickets");

      // if (tenure == null || amcAmount == null || rciEnrollment == null || totalCost == null || purchasePrice == null ||
      //     adminCharges == null || amcFirstYear == null || roundOff == null || preAmount == null || initialPayment == null ||
      //     balance == null || numberOfEMI == null || emi == null || nightStay == null || dayStay == null || adultOccupancy == null ||
      //     childOccupancy == null || balanceOffer == null || noOfAirtickets == null) {
      //   Get.snackbar('Error', 'Please enter valid numeric values for all fields');
      //   return;
      // }
      // print("tenure:${int.parse(dropdownTenure)}");
      // print("amc:${int.parse(amcController.text)}");
      // print("total cost:${int.parse(totalCostController.text)}");
      // print("admin:${int.parse(adminController?.text)}");
      // print("1st amc:${int.parse(firstAmcController.text)}");
      // print("initial pay:${int.parse(initialPayController.text)}");
      // print("balance:${int.parse(balanceController.text)}");
      // print("noOfEmi:${int.parse(noOfEmiController.text)}");
      // print("Emi:${int.parse(emiController.text)}");
      // print("only accomo:${parseBool(onlyAccomodation.toString())}");
      final res = await ApiProvider.postMembersOnHold(
          dateOfJoininggg,
          newuserholdingController.dropdownvalue1,
          newuserholdingController.nameController.text,
          member1DOB,
          newuserholdingController.mobileController.text,
          dropdownvalue2,
          nameController2?.text,
          member2DOB,
          numberController2?.text,
          addressController?.text,
          residenceController?.text,
          newuserholdingController.emailController.text,
          cityController?.text,
          pincodeController?.text,
          dropdownTenure,
          validity,
          dropdownType,
          dropdownSeason,
          dropdownApartment,
          occupancyController?.text,
          amcController!.text,
          amcDueDate,
          dsaCodeController?.text,
          empCodeController?.text,
          rciController?.text,
          totalCostController!.text,
          purchaseController?.text,
          adminController!.text,
          firstAmcController!.text,
          roundOffController?.text,
          newuserholdingController.amountController.text,
          initialPayController!.text,
          newuserholdingController.dropdownPayment,
          otherCashController?.text, // otherCash
          otherCardController?.text, // otherCard
          otherOnlineController?.text, // otherOnline
          otherChequeController?.text, // otherCheque
          balanceController?.text,
          noOfEmiController!.text,
          emiController!.text,
          //parseToIntFromDouble(emiController.text),
          emiStartDate,
          managerNameController?.text,
          repNameController?.text,
          nightStayController?.text,
          dayStayController?.text,
          adultOccupancyController?.text,
          childOccupancyController?.text,
          onlyAccomodation,
          accomodation,
          breakfast,
          dinner,
          sightSeeing,
          balanceController?.text,
          validityOfferController?.text,
          remarkController?.text,
          dropdownTicket,
          airTicket,
          membersOnHoldListController.dropdownvalue,
          userNameController?.text,
          dateTimeOfHolding
      );

      // isSuccess.value = res.statusCode == 1;

      if (res.statusCode == 1) {
        print("status code 200");
        final responseBody = jsonDecode(res.body);

       // final result = postMemberOnHoldModelFromJson(res.body);
        print('Add Member: ${responseBody.message}');
      } else {
        print('Error: Failed to add member data');
      }
    } catch (e) {
      isSuccess.value = false;
      print('Errorrr: $e');

    } finally {
      isLoading.value = false;
    }
  }
  // @override
  // void onClose() {
  //   super.onClose();
  //   dob1.text;
  //   dob2.text;
  //   nameController2.text;
  //   numberController2.text;
  //   addressController.text;
  //   residenceController.text;
  //   emailController.text;
  //   cityController.text;
  //   pincodeController.text;
  //   phController.text;
  //   validityController.text;
  //   occupancyController.text;
  //   amcController.text;
  //   amcDueController.text;
  //   dsaCodeController.text;
  //   empCodeController.text;
  //   rciController.text;
  //   totalCostController.text;
  //   purchaseController.text;
  //   adminController.text;
  //   firstAmcController.text;
  //   roundOffController.text;
  //   preAmoController.text;
  //   initialPayController.text;
  //   balanceController.text;
  //   emiDateInput.text;
  //   managerNameController.text;
  //   repNameController.text;
  //   destinationController.text;
  //   nightStayController.text;
  //   dayStayController.text;
  //   adultOccupancyController.text;
  //   childOccupancyController.text;
  //   balanceOfferController.text;
  //   validityOfferController.text;
  //   remarkController.text;
  //   emiController.text;
  //   noOfEmiController.text;
  // }
  bool checkHoldAddMember() {
    final formState = membersOnHoldFormKey.currentState;
    if (formState != null ) {
      formState.save();
      postMemberOnHold();
      return true;
    }
    return true;

  }
  @override
  void onClose(){
    dateOfJoining?.dispose();
    dob1?.dispose();
    dob2?.dispose();
    nameController2?.dispose();
    numberController2?.dispose();
    addressController?.dispose();
    residenceController?.dispose();
    emailController?.dispose();
    cityController?.dispose();
    pincodeController?.dispose();
    phController?.dispose();
    validityController?.dispose();
    occupancyController?.dispose();
    amcController?.dispose();
    amcDueController?.dispose();
    dsaCodeController?.dispose();
    empCodeController?.dispose();
    rciController?.dispose();
    totalCostController?.dispose();
    purchaseController?.dispose();
    adminController?.dispose();
    firstAmcController?.dispose();
    roundOffController?.dispose();
    preAmoController?.dispose();
    initialPayController?.dispose();
    balanceController?.dispose();
    emiDateInput?.dispose();
    managerNameController?.dispose();
    repNameController?.dispose();
    destinationController?.dispose();
    nightStayController?.dispose();
    dayStayController?.dispose();
    adultOccupancyController?.dispose();
    childOccupancyController?.dispose();
    balanceOfferController?.dispose();
    validityOfferController?.dispose();
    remarkController?.dispose();
    emiController?.dispose();
    noOfEmiController?.dispose();
    userNameController?.dispose();
    otherOnlineController?.dispose();
    otherCashController?.dispose();
    otherCardController?.dispose();
    otherChequeController?.dispose();
    dateOfHolding?.dispose();
  }

}

bool parseBool(String value) {
  return value.toLowerCase() == 'true';
}

DateTime? parseDate(String value) {
  try {
    return DateTime.parse(value);
  } catch (e) {
    print('Error parsing date: $value - $e');
    return null;
  }
}
int parseToIntFromDouble(String value, {int defaultValue = 0}) {
  try {
    double parsedValue = double.parse(value);
    return parsedValue.toInt(); // Convert to int
  } catch (e) {
    // Handle error or log it
    print('Error parsing to int from double: $e');
    return defaultValue; // Return a default value if parsing fails
  }
}
double parseToDouble(String value, {double defaultValue = 0.0}) {
  try {
    return double.parse(value);
  } catch (e) {
    // Handle error or log it
    print('Error parsing to double: $e');
    return defaultValue; // Return a default value if parsing fails
  }
}
