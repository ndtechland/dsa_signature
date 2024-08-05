import 'dart:async';

import 'package:dsa_app/apiServices/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/approvalForm_model.dart';
import '../model/mafList_model.dart';
import 'mafList_controller.dart';

class ApprovalFormController extends GetxController {
  var isLoading = false.obs;
  final MemberController _memberController = Get.put(MemberController());
  // static final box = GetStorage();
  // var approval = box.read("ApprovalNumber");
  TextEditingController? approvalNum,
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
  managerName
  ;
  @override
  void onInit() {
    super.onInit();
    fetchApprovalForm();
    approvalNum = TextEditingController();
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

  // GetMafListModel? relatedjobapi;

  Future<bool> fetchApprovalForm() async {
    isLoading(true);
    getjobdetailbyidModel = await ApiProvider.getApprovalForm();
print("dob:$member1dob");
    print("approval try 1");

    if (getjobdetailbyidModel?.data?.dsaCode == null) {
      print("approval try 2");

      isLoading(true);
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
  @override
  void onClose() {
    super.onClose();
  }

  // Future<void> fetchApprovalForm() async {
  // isLoading.value = true;
  // try {
  // final result = await ApiProvider.getApprovalForm(
  //     _memberController.members.data.map((e)=>e.id!.toString())
  //
  // );
  // if (result != null && result.status == 200 && result.data != null) {
  // approvalFormModel = result;
  // print("Fetched Approval Form Data: ${result.data}");
  // } else {
  // print("Failed to fetch approval form data");
  // }
  // } catch (e) {
  // print("Error fetching approval form data: $e");
  // } finally {
  // isLoading.value = false;
  // }
  // }
  }

