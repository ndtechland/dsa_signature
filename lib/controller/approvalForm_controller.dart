import 'dart:async';

import 'package:dsa_app/apiServices/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/approvalForm_model.dart';
import '../model/mafList_model.dart';
import 'addMember_controller.dart';
import 'mafList_controller.dart';
import 'membersOnHold_controller.dart';

class ApprovalFormController extends GetxController {
  var isLoading = false.obs;
  final MemberController _memberController = Get.put(MemberController());
  final AddMemberController _addMemberController = Get.put(AddMemberController());
  final MembersOnHoldController _membersOnHoldController = Get.put(MembersOnHoldController());

  TextEditingController? approvalNum,
      member1name,
      dateInput,
      dsaCode,
      mafNum,
      member1dob,
      member2name,
      member2dob,
      address,
      city,
      mobile1,
      mobile2,
      pincode,
      email,
      appartment,
      occupancy,
      tenure,
      season,
      amcAmount,
      amcDueDate,
      preAmount,
      dateOfHolding,
      rciEnrollment,
      purchasePrice,
      adminCharges,
      totalCost,
      initialPayment,
      balance,
      mop,
      dateOfJoining,
      emi,
      numOfEmi,
      emiStartDate,
      offerDestination,
      offerStayDays,
      offerStayNights,
      offerNoOfAdults,
      offerNoOfChild,
      offerOnlyAccomodation,
      offerAccomodation,
      offerBreakfast,
      offerDinner,
      offerSightSeeing,
      offerNoOfAirTickets,
      offerAirTicketsType,
      offerBalanceAmount,
      offerValidity,
      offerIncludeRemark,
      repName,
      managerName;

  @override
  void onInit() {
    super.onInit();
    fetchApprovalForm();
    fetchOnHoldApprovalForm();
    approvalNum = TextEditingController();
    member1name = TextEditingController();
    dateInput = TextEditingController();
    mafNum = TextEditingController();
    member1dob = TextEditingController();
    member2name = TextEditingController();
    member2dob = TextEditingController();
    address = TextEditingController();
    city = TextEditingController();
    mobile1 = TextEditingController();
    mobile2 = TextEditingController();
    pincode = TextEditingController();
    email = TextEditingController();
    appartment = TextEditingController();
    occupancy = TextEditingController();
    tenure = TextEditingController();
    season = TextEditingController();
    amcAmount = TextEditingController();
    amcDueDate = TextEditingController();
    preAmount = TextEditingController();
    dateOfHolding = TextEditingController();
    rciEnrollment = TextEditingController();
    purchasePrice = TextEditingController();
    adminCharges = TextEditingController();
    totalCost = TextEditingController();
    initialPayment = TextEditingController();
    balance = TextEditingController();
    mop = TextEditingController();
    dateOfJoining = TextEditingController();
    emi = TextEditingController();
    numOfEmi = TextEditingController();
    emiStartDate = TextEditingController();
    offerDestination = TextEditingController();
    offerStayDays = TextEditingController();
    offerStayNights = TextEditingController();
    offerNoOfAdults = TextEditingController();
    offerNoOfChild = TextEditingController();
    offerOnlyAccomodation = TextEditingController();
    offerAccomodation = TextEditingController();
    offerBreakfast = TextEditingController();
    offerDinner = TextEditingController();
    offerSightSeeing = TextEditingController();
    offerNoOfAirTickets = TextEditingController();
    offerAirTicketsType = TextEditingController();
    offerBalanceAmount = TextEditingController();
    offerValidity = TextEditingController();
    offerIncludeRemark = TextEditingController();
    repName = TextEditingController();
    managerName = TextEditingController();
  }

  RxString cvUrl = ''.obs;
  ApprovalFormModel? getjobdetailbyidModel;

  Future<bool> fetchApprovalForm() async {
    isLoading(true);
    //await _addMemberController.checkAddMember();
    //await _membersOnHoldController.checkHoldAddMember();
    getjobdetailbyidModel = await ApiProvider.getApprovalForm();
    print("dob:$member1dob");
    print("approval try 1");

    if (getjobdetailbyidModel?.data?.dsaCode == null) {
      print("approval try 2");
      isLoading(true);
      print("nulllllllllllllll");
      getjobdetailbyidModel = await ApiProvider.getApprovalForm(
        // relatedjobapi?.data.map((e)=>e.id) as String
      );
      return false;
    }
    if (getjobdetailbyidModel?.data?.dsaCode != null) {
      print("dsaCode ApprovAL:${getjobdetailbyidModel?.data?.dsaCode}");

      //Get.to(() => TotalPrice());
      isLoading(false);
      return true;
    }
    return true;
  }
  Future<bool> fetchOnHoldApprovalForm() async {
    isLoading(true);
    //await _addMemberController.checkAddMember();
    //await _membersOnHoldController.checkHoldAddMember();
    getjobdetailbyidModel = await ApiProvider.getHoldMemberApprovalForm();
    print("dob:$member1dob");
    print("approval on hold try 1");

    if (getjobdetailbyidModel?.data?.dsaCode == null) {
      print("approval on hold try 2");
      isLoading(true);
      getjobdetailbyidModel = await ApiProvider.getHoldMemberApprovalForm(
        // relatedjobapi?.data.map((e)=>e.id) as String
      );
      return false;
    }
    if (getjobdetailbyidModel?.data?.dsaCode != null) {
      print("dsaCode ApprovAL on hold:${getjobdetailbyidModel?.data?.dsaCode}");

      //Get.to(() => TotalPrice());
      isLoading(false);
      return true;
    }
    return true;
  }

  @override
  void onClose() {
    approvalNum?.dispose();
    member1name?.dispose();
    dateInput?.dispose();
    dsaCode?.dispose();
    mafNum?.dispose();
    member1dob?.dispose();
    member2name?.dispose();
    member2dob?.dispose();
    address?.dispose();
    city?.dispose();
    mobile1?.dispose();
    mobile2?.dispose();
    pincode?.dispose();
    email?.dispose();
    appartment?.dispose();
    occupancy?.dispose();
    tenure?.dispose();
    season?.dispose();
    amcAmount?.dispose();
    amcDueDate?.dispose();
    preAmount?.dispose();
    dateOfHolding?.dispose();
    rciEnrollment?.dispose();
    purchasePrice?.dispose();
    adminCharges?.dispose();
    totalCost?.dispose();
    initialPayment?.dispose();
    balance?.dispose();
    mop?.dispose();
    dateOfJoining?.dispose();
    emi?.dispose();
    numOfEmi?.dispose();
    emiStartDate?.dispose();
    offerDestination?.dispose();
    offerStayDays?.dispose();
    offerStayNights?.dispose();
    offerNoOfAdults?.dispose();
    offerNoOfChild?.dispose();
    offerOnlyAccomodation?.dispose();
    offerAccomodation?.dispose();
    offerBreakfast?.dispose();
    offerDinner?.dispose();
    offerSightSeeing?.dispose();
    offerNoOfAirTickets?.dispose();
    offerAirTicketsType?.dispose();
    offerBalanceAmount?.dispose();
    offerValidity?.dispose();
    offerIncludeRemark?.dispose();
    repName?.dispose();
    managerName?.dispose();

    super.onClose();
  }
}
