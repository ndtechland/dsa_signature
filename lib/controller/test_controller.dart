// import 'dart:async';
//
// import 'package:dsa_app/model/approvalForm_model.dart';
// import 'package:dsa_app/model/mafList_model.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
//
// import '../apiServices/api_service.dart';
//
// class JobdetauilsbyJobIdController extends GetxController {
//   RxBool isLoading = true.obs;
//
//   //AllJibsController _allJibsController = Get.put(AllJibsController());
//
//   RxString cvUrl = ''.obs;
//
//   ApprovalFormModel? getjobdetailbyidModel;
//   //relatedjobapi;
//
//   GetMafListModel? relatedjobapi;
//
//   Future<void> jobdetailbyjobIdApi({String? jobListId}) async {
//     isLoading(true);
//     getjobdetailbyidModel = await ApiProvider.getApprovalForm(
//         relatedjobapi?.data.map((e)=>e.id) as String
//     );
//
//     if (getjobdetailbyidModel?.data?.dsaCode == null) {
//       Timer(
//         const Duration(seconds: 1),
//             () {
//           //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
//           //Get.to(() => MedicineCart());
//           //Get.to((page))
//           ///
//         },
//       );
//       isLoading(true);
//       getjobdetailbyidModel = await ApiProvider.getApprovalForm(
//           relatedjobapi?.data.map((e)=>e.id) as String
//       );
//     }
//     if (getjobdetailbyidModel?.data?.dsaCode != null) {
//       //Get.to(() => TotalPrice());
//       isLoading(false);
//     }
//   }
//
//   ///related job..
//   // String searchQuery = "";
//   //
//   // Future<void> relatedjobListApi({String? jobTitleid}) async {
//   //   isLoading(true);
//   //   relatedjobapi = await ApiProvider.RelatedJobsbyJobIdApi(jobTitleid);
//   //   print('Prince doctor list');
//   //   print(relatedjobapi);
//   //   if (relatedjobapi != null) {
//   //     //Get.to(() => TotalPrice());
//   //     isLoading(false);
//   //     foundSavedJobs.value = relatedjobapi!.response!;
//   //     //Get.to(()=>Container());
//   //   }
//   // }
//
//   @override
//   void onInit() {
//     super.onInit();
//     jobdetailbyjobIdApi();
//    // relatedjobListApi();
//   }
//
//   // RxList<ResponseJobRelated> foundSavedJobs = RxList<ResponseJobRelated>([]);
//   // void filterSavedJob(String searchsavejobName) {
//   //   List<ResponseJobRelated>? finalResult = [];
//   //   if (searchsavejobName.isEmpty) {
//   //     finalResult = relatedjobapi!.response;
//   //   } else {
//   //     finalResult = relatedjobapi!.response!
//   //         .where((element) => element.jobTitle
//   //         .toString()
//   //         .toLowerCase()
//   //         .contains(searchsavejobName.toString().toLowerCase().trim()))
//   //         .toList();
//   //   }
//   //   print(finalResult?.length);
//   //   foundSavedJobs.value = finalResult!;
//   // }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
// }