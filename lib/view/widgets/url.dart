// // import 'package:dsa_app/apiServices/api_service.dart';
// // import 'package:dsa_app/model/addMember_model.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get_storage/get_storage.dart';
// //
// // import '../../controller/generateMaf_controller.dart';
// //
// //
// //
// // class AddMemberController extends GetxController {
// //   final RxBool isLoading = false.obs;
// //   final GenerateMafController generateController =
// //   Get.put(GenerateMafController());
// //
// //   final GlobalKey<FormState> addMemberFormKey = GlobalKey<FormState>();
// //   TextEditingController dob1 = TextEditingController();
// //   TextEditingController dob2 = TextEditingController();
// //   final TextEditingController nameController2 = TextEditingController();
// //   final TextEditingController numberController2 = TextEditingController();
// //   final TextEditingController addressController = TextEditingController();
// //   final TextEditingController residenceController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController cityController = TextEditingController();
// //   final TextEditingController pincodeController = TextEditingController();
// //   final TextEditingController phController = TextEditingController();
// //   final TextEditingController validityController = TextEditingController();
// //   final TextEditingController occupancyController = TextEditingController();
// //   final TextEditingController amcController = TextEditingController();
// //   final TextEditingController amcDueController = TextEditingController();
// //   final TextEditingController dsaCodeController = TextEditingController();
// //   final TextEditingController empCodeController = TextEditingController();
// //   final TextEditingController rciController = TextEditingController();
// //   final TextEditingController totalCostController = TextEditingController();
// //   final TextEditingController purchaseController = TextEditingController();
// //   final TextEditingController adminController = TextEditingController();
// //   final TextEditingController firstAmcController = TextEditingController();
// //   final TextEditingController roundOffController = TextEditingController();
// //   final TextEditingController preAmoController = TextEditingController();
// //   final TextEditingController initialPayController = TextEditingController();
// //   final TextEditingController balanceController = TextEditingController();
// //   TextEditingController emiDateInput = TextEditingController();
// //   final TextEditingController managerNameController = TextEditingController();
// //   final TextEditingController repNameController = TextEditingController();
// //   final TextEditingController destinationController = TextEditingController();
// //   final TextEditingController nightStayController = TextEditingController();
// //   final TextEditingController dayStayController = TextEditingController();
// //   final TextEditingController adultOccupancyController = TextEditingController();
// //   final TextEditingController childOccupancyController = TextEditingController();
// //   final TextEditingController balanceOfferController = TextEditingController();
// //   final TextEditingController validityOfferController = TextEditingController();
// //   final TextEditingController remarkController = TextEditingController();
// //   final TextEditingController emiController = TextEditingController();
// //   final TextEditingController noOfEmiController = TextEditingController();
// //   String dropdownTenure = 'Select';
// //   String dropdownType = 'Regular';
// //   String dropdownSeason = 'Premium';
// //   String dropdownApartment = 'Select';
// //   String dropdownPayment = 'Select';
// //   String dropdownvalue2 = 'Select';
// //   String dropdownTicket = 'Select';
// //
// //   bool specialOffer = false;
// //   bool onlyAccomodation = false;
// //   bool accomodation = false;
// //   bool breakfast = false;
// //   bool dinner = false;
// //   bool sightSeeing = false;
// //   bool airTicket = false;
// //   Future<void> postAddMember() async {
// //     isLoading.value = true;
// //     try {
// //       final res = await ApiProvider.addMemberApi(
// //           parseDate(generateController.dateInput.text)!,
// //           generateController.dropdownvalue,
// //           generateController.nameController.text,
// //           parseDate(dob1.text)!,
// //           generateController.numberController.text,
// //           dropdownvalue2,
// //           nameController2.text,
// //           parseDate(dob2.text)!,
// //           numberController2.text,
// //           addressController.text,
// //           residenceController.text,
// //           emailController.text,
// //           cityController.text,
// //           pincodeController.text,
// //           int.parse(dropdownTenure),
// //           parseDate(validityController.text)!,
// //           dropdownType,
// //           dropdownSeason,
// //           dropdownApartment,
// //           occupancyController.text,
// //           int.parse(amcController.text),
// //           parseDate(amcDueController.text)!,
// //           dsaCodeController.text,
// //           empCodeController.text,
// //           int.parse(rciController.text),
// //           int.parse(totalCostController.text),
// //           int.parse(purchaseController.text),
// //           int.parse(adminController.text),
// //           int.parse(firstAmcController.text),
// //           int.parse(roundOffController.text),
// //           int.parse(preAmoController.text),
// //           int.parse(initialPayController.text),
// //           dropdownPayment,
// //           0,
// //           0,
// //           0,
// //           0,
// //           int.parse(balanceController.text),
// //           int.parse(noOfEmiController.text),
// //           int.parse(emiController.text),
// //           parseDate(emiDateInput.text)!,
// //           managerNameController.text,
// //           repNameController.text,
// //           int.parse(nightStayController.text),
// //           int.parse(dayStayController.text),
// //           int.parse(adultOccupancyController.text),
// //           int.parse(childOccupancyController.text),
// //           parseBool(onlyAccomodation.toString()),
// //           parseBool(accomodation.toString()),
// //           parseBool(breakfast.toString()),
// //           parseBool(dinner.toString()),
// //           parseBool(sightSeeing.toString()),
// //           int.parse(balanceOfferController.text),
// //           validityOfferController.text,
// //           remarkController.text,
// //           int.parse(dropdownTicket.toString()),
// //           parseBool(airTicket.toString()).toString(),
// //           "mafNo");
// //       // final res = await ApiProvider.addMemberApi(
// //       //     dateOfJoining,
// //       //     preName,
// //       //     memberName1,
// //       //     member1DOB,
// //       //     mobile1,
// //       //     preName2,
// //       //     memberName2,
// //       //     member2DOB,
// //       //     mobile2,
// //       //     address,
// //       //     residenceNumber,
// //       //     email,
// //       //     city,
// //       //     pincode,
// //       //     tenure,
// //       //     validity,
// //       //     type,
// //       //     season,
// //       //     apartment,
// //       //     occupancy,
// //       //     amcAmount,
// //       //     amcDueDate,
// //       //     dsaCode,
// //       //     empCode,
// //       //     rciEnrollment,
// //       //     totalCost,
// //       //     purchasePrice,
// //       //     adminCharges,
// //       //     amcFirstYear,
// //       //     roundOffAmcFirstYearAmount,
// //       //     preAmount,
// //       //     initialPayment,
// //       //     modeOfPayment,
// //       //     otherCash,
// //       //     otherCard,
// //       //     otherOnline,
// //       //     otherCheque,
// //       //     balance,
// //       //     numberOfEMI,
// //       //     emi,
// //       //     emiStartDate,
// //       //     managerName,
// //       //     repName,
// //       //     offerStayNights,
// //       //     offerStayDays,
// //       //     offerNoOfAdults,
// //       //     offerNoOfChild,
// //       //     offerOnlyAccomodation,
// //       //     offerAccomodation,
// //       //     offerBreakfast,
// //       //     offerDinner,
// //       //     offerSightSeeing,
// //       //     offerBalanceAmount,
// //       //     offerValidity,
// //       //     offerIncludeRemark,
// //       //     offerNoOfAirtickets,
// //       //     airtTicketType,
// //       //     mafNo);
// //       if (res.statusCode == 1) {
// //         final result = postAddMemberModelFromJson(res.body);
// //         print('Add Member: ${result.message}');
// //       } else {
// //         // responseMessage.value = 'Failed to post data';
// //         print('Error: Failed to add member data');
// //       }
// //     } catch (e) {
// //       //isSuccess.value = false;
// //       print('Error: $e');
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   void checkAddMember() {
// //     print("try add 1");
// //     final formState = addMemberFormKey.currentState;
// //     if (formState != null && formState.validate()) {
// //       print("formstate addMember");
// //       formState.save();
// //       postAddMember();
// //     }
// //   }
// // }
// // bool parseBool(String value) {
// //   return value.toLowerCase() == 'true';
// // }
// // DateTime? parseDate(String value) {
// //   try {
// //     return DateTime.parse(value);
// //   } catch (e) {
// //     return null;
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hirejobindia/components/styles.dart';
// import 'package:hirejobindia/modules/all_pages/pages/forgot_password.dart';
// import 'package:hirejobindia/modules/all_pages/pages/registration_test.dart';
// import 'package:hirejobindia/widget/elevated_button.dart';
// import 'package:hirejobindia/widget/text_btn.dart';
//
// import '../../../controllers/employeee_controllersss/employee_login_controllers/employee_login_controllers.dart';
// import '../../../controllers/login_controllers/login_controllersss.dart';
// import '../../../controllers/registrationss/registration_controller.dart';
//
// class Login extends StatefulWidget {
//   static const String id = 'Login';
//   Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final LoginController _loginController = Get.put(LoginController());
//
//   final RegistrationController _registrationController =
//   Get.put(RegistrationController());
//
//   final EmployeeLoginController _employeeloginController =
//   Get.put(EmployeeLoginController());
//
//   final FocusNode _userFocusNode = FocusNode();
//   final FocusNode _userFocusNode2 = FocusNode();
//
//   // FocusNode for User login
//   final FocusNode _employeeFocusNode = FocusNode();
//   final FocusNode _employeeFocusNode2 = FocusNode();
//
//   // FocusNode for Employee login
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return OrientationBuilder(
//       builder: (context, orientation) {
//         return LayoutBuilder(
//           builder: (context, constraints) {
//             return Scaffold(
//               backgroundColor: Colors.white,
//               body: Obx(
//                     () => (_loginController.isLoading.value ||
//                     _employeeloginController.isLoading.value)
//                     ? Center(child: CircularProgressIndicator())
//                     : SingleChildScrollView(
//                   child: Center(
//                     child: DefaultTabController(
//                       length: 2,
//                       child: Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 24, vertical: 30),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 20.0,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 36,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.white, // Change color here
//                               ),
//                               child: TabBar(
//                                 labelColor:
//                                 Colors.white, // Selected text color
//                                 unselectedLabelColor: Colors.grey,
//                                 indicator: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(0),
//                                   color: appColor, // Change color here
//                                 ),
//                                 labelStyle: TextStyle(
//                                     color: Colors
//                                         .white), // Change selected text color to white
//                                 unselectedLabelStyle: TextStyle(
//                                     color: Colors
//                                         .grey), // Unselected text color
//                                 tabs: [
//                                   Tab(text: "User"),
//                                   Tab(text: "Employee"),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               height: 400, // Adjust as necessary
//                               child: TabBarView(
//                                 children: [
//                                   buildUserLoginForm(),
//                                   buildEmployeeLoginForm(),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               appBar: _buildAppBar(),
//               // PreferredSize(
//               //   preferredSize: Size.fromHeight(
//               //       MediaQuery.of(context).size.width >
//               //               MediaQuery.of(context).size.height
//               //           ? MediaQuery.of(context).size.height *
//               //               0.35 // Landscape mode
//               //           : MediaQuery.of(context).size.height *
//               //               0.2), // Portrait mode
//               //   child: AppBar(
//               //     automaticallyImplyLeading: false,
//               //     backgroundColor: logoColor,
//               //     flexibleSpace: responsiveContainer(
//               //       heightLandscape: size.height * 0.49,
//               //       heightPortrait: size.height * 0.29,
//               //       color: logoColor,
//               //       context: context,
//               //       child: Padding(
//               //         padding: const EdgeInsets.all(9.0),
//               //         child: Column(
//               //           mainAxisAlignment: MainAxisAlignment.end,
//               //           children: [
//               //             logoImg(),
//               //             responsiveText(
//               //                 text: 'Login With US!',
//               //                 fontSizeLandscape: 19,
//               //                 fontSizePortrait: 20,
//               //                 color: Colors.white,
//               //                 context: context),
//               //           ],
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget buildUserLoginForm() {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Obx(
//             () => _loginController.isLoading.value
//             ? Center(child: CircularProgressIndicator())
//             : Form(
//           key: _loginController.loginFormKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: Column(
//             children: [
//               textField2(
//                 hint: 'Username',
//                 suffixIcon: Icons.person_outline,
//                 controller: _loginController.usernameController1,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter username';
//                   }
//                   return null;
//                 },
//                 focusNode: _userFocusNode, // Assign FocusNode
//               ),
//               PasswordTextField(
//                 hint: 'Password',
//                 //suffixIcon: Icons.lock,
//                 controller: _loginController.passwordController1,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 focusNode: _userFocusNode2, // Assign FocusNode
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   MyTextButton(
//                     onPressed: () {
//                       Get.to(ForgotPassword());
//                     },
//                     text: 'Forgot Password',
//                     colors: appColor,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               MyElevatedButton(
//                 onPressed: () {
//                   if (_loginController.loginFormKey.currentState
//                       ?.validate() ??
//                       false) {
//                     _loginController.checkLogin();
//                   }
//                 },
//                 text: Text('Login'),
//                 height: 40,
//                 width: 200,
//               ),
//               const SizedBox(height: 24),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 1, horizontal: 24),
//                 height: 40,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         blackText("Don't have an account?"),
//                         MyTextButton(
//                           onPressed: () async {
//                             _registrationController.getStatepi();
//                             _registrationController.onInit();
//                             _registrationController.selectedState.value =
//                             null;
//                             await Future.delayed(
//                                 Duration(milliseconds: 800));
//                             Get.to(RegistrationPage());
//                           },
//                           colors: appColor,
//                           text: "Sign up",
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildEmployeeLoginForm() {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Obx(
//             () => _employeeloginController.isLoading.value
//             ? Center(child: CircularProgressIndicator())
//             : Form(
//           key: _employeeloginController.loginFormKey2,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: Column(
//             children: [
//               textField2(
//                 hint: 'Employee ID',
//                 suffixIcon: Icons.person_outline,
//                 controller: _employeeloginController.usernameController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Employee ID';
//                   }
//                   return null;
//                 },
//                 focusNode: _employeeFocusNode, // Assign FocusNode
//               ),
//               PasswordTextField(
//                 hint: 'Password',
//                 //suffixIcon: Icons.lock,
//                 controller: _employeeloginController.passwordController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 focusNode: _employeeFocusNode2, // Assign FocusNode
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   MyTextButton(
//                     onPressed: () {
//                       Get.to(ForgotPassword());
//                     },
//                     text: 'Forgot Password',
//                     colors: appColor,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               MyElevatedButton(
//                 onPressed: () {
//                   if (_employeeloginController.loginFormKey2.currentState
//                       ?.validate() ??
//                       false) {
//                     _employeeloginController.checkemployeeLogin();
//                   }
//                 },
//                 text: Text('E-Login'),
//                 height: 40,
//                 width: 200,
//               ),
//               const SizedBox(height: 34),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   PreferredSizeWidget _buildAppBar() {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(150),
//       child: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         flexibleSpace: _buildHeader(),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Container(
//         width: double.infinity,
//         height: 200,
//         //MediaQuery.of(context).size.height * 0.35,
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 appColor2,
//                 appColor,
//                 //appColor
//               ],
//             )),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Spacer(),
//             // SizedBox(
//             //   height: 15,
//             // ),
//             logoImg(),
//             const Text(
//               'Welcome to Hire Job India',
//               style: TextStyle(
//                   color: Colors.white, fontSize: 16, fontFamily: 'medium'),
//             ),
//             Text(
//               'Login With Us.'.toUpperCase(),
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'medium'),
//             ),
//           ],
//         ));
//   }
//
//   logoImg() {
//     return Image.asset(
//       'lib/assets/logo/hirelogo11.png',
//       width: 120,
//       height: 90,
//     );
//   }
// }