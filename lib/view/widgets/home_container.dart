// // // import 'package:flutter/material.dart';
// // // Widget FormContainer(){
// // // return Container(
// // //     width: w/2,
// // //     height: h/20,
// // //     //color: Colors.pinkAccent,
// // //     child: TextField(
// // //       controller: mainApplicantController,
// // //     ));
// // // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hirejobindia/components/styles.dart';
// import 'package:hirejobindia/constants/static_text.dart';
//
// import '../../../components/responsive_text.dart';
// import '../../../controllers/company_controllers/company_controller.dart';
// import '../../../controllers/company_detail_by_com_id/company_detail_by_id_controller.dart';
// import 'company_detail.dart';
// import 'home.dart';
//
// class Company extends StatelessWidget {
//   static const String id = 'Company';
//
//   final RxBool isLoading = false.obs;
//
//   Company({Key? key}) : super(key: key);
//
//   // List<Item> companyList = <Item>[
//   //   const Item('lib/assets/images/n3.png', 'Prince Tech'),
//   //   const Item('lib/assets/images/n2.png', 'Global Info'),
//   //   const Item('lib/assets/images/n1.png', 'Monarch IT'),
//   //   const Item('lib/assets/images/n4.png', 'Prince PVT. LTD.'),
//   //   const Item('lib/assets/images/n3.png', 'Rammurthi Tech'),
//   //   const Item('lib/assets/images/n2.png', 'Fcc Info'),
//   //   const Item('lib/assets/images/n1.png', 'Monar IT'),
//   //   const Item('lib/assets/images/n4.png', 'Soft PVT. LTD.'),
//   // ];
//
//   final AllcompanyController _allcompanyController =
//   Get.put(AllcompanyController());
//   final CompanyDetailController _companyDetailController =
//   Get.put(CompanyDetailController());
//   bool _isLoading = false; // State variable to control loading indicator
//
//   void _startDelayedAction(BuildContext context) {
//     // Simulate delayed action
//     Future.delayed(Duration(milliseconds: 400), () {
//       print('Delayed action after 1 second');
//
//       // Navigate to CompanyDetail after delay
//       Get.to(CompanyDetail());
//
//       // Alternatively, if using Navigator.push:
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => CompanyDetail(),
//       //   ),
//       // );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       //drawer: const NavBar(),
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: const Text('Companies'),
//         centerTitle: true,
//         titleSpacing: 0,
//         leading: InkWell(
//             onTap: () {
//               Get.to(Home());
//             },
//             child: const Icon(Icons.arrow_back)),
//         // actions: [
//         //   IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
//         // ],
//         flexibleSpace: Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: <Color>[appColor2, appColor]),
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: OrientationBuilder(builder: (context, orientation) {
//         return LayoutBuilder(builder: (context, constraints) {
//           var screenWidth = constraints.maxWidth;
//           var screenHeight = constraints.maxHeight;
//
//           var imageWidth = orientation == Orientation.portrait
//               ? screenWidth * 0.55
//               : screenWidth * 0.3;
//           var imageHeight = orientation == Orientation.portrait
//               ? screenHeight * 0.2
//               : screenHeight * 0.4;
//
//           var categoryWidth = orientation == Orientation.portrait
//               ? screenWidth * 0.5
//               : screenWidth * 0.4;
//           var categoryHeight = orientation == Orientation.portrait
//               ? screenHeight * 0.12
//               : screenHeight * 0.45;
//
//           var textfieldWidth2 = orientation == Orientation.portrait
//               ? screenWidth * 0.84
//               : screenWidth * 0.87;
//           var textfieldHeight2 = orientation == Orientation.portrait
//               ? screenHeight * 0.15
//               : screenHeight * 0.4;
//
//           return Obx(
//                 () => (_allcompanyController.isLoading.value || isLoading.value)
//                 ? Center(child: CircularProgressIndicator())
//                 : Column(
//               children: [
//                 Container(
//                   //width: screenWidth * 0.97,
//                   height: imageHeight * 0.5,
//                   color: appColor,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16, vertical: 3),
//                   child: SizedBox(
//                     width: screenWidth * 0.97,
//                     height: screenHeight * 0.14,
//                     child: TextField(
//                       cursorColor: appColor,
//                       onChanged: (value) =>
//                           _allcompanyController.filterCaompany(value),
//                       autofocus: false,
//                       style: TextStyle(fontSize: 15.0, color: appColor),
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: appColor,
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: 'Enter Company Name',
//                         contentPadding: const EdgeInsets.only(
//                             left: 10.0, bottom: 12.0, top: 13.0),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: appColor),
//                           borderRadius: BorderRadius.circular(25.7),
//                         ),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: appColor),
//                           borderRadius: BorderRadius.circular(25.7),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: _allcompanyController.foundcompany.isEmpty
//                       ? Center(
//                     child: Text("No Company Found"),
//                   )
//                       : Container(
//                     margin: const EdgeInsets.all(8),
//                     child: GridView.builder(
//                       gridDelegate:
//                       SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 12.0,
//                         mainAxisSpacing: 12.0,
//                       ),
//                       itemCount:
//                       _allcompanyController.foundcompany.length,
//                       itemBuilder: (context, index) {
//                         final category = _allcompanyController
//                             .foundcompany[index];
//                         if (category.id == null) return Container();
//                         return InkWell(
//                           onTap: () async {
//                             await _allcompanyController
//                                 .companyListApi();
//                             _allcompanyController.update();
//
//                             // _companyDetailController.companydetailbyIdApi(
//                             //     category.id
//                             // );
//                             await _companyDetailController
//                                 .companydetailbyIdApi(
//                                 _allcompanyController
//                                     .foundcompany[index].id
//                                     ?.toInt());
//                             _companyDetailController.update();
//
//                             // Delay execution for 2 seconds
//                             await Future.delayed(
//                                 Duration(milliseconds: 400), () {
//                               // Get.to(CompanyDetail());
//
//                               _startDelayedAction(context);
//                               // print(
//                               //     'Delayed action after 2 seconds');
//                               ///
//                               // Get.to(CompanyDetail());
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //     builder: (context) =>
//                               //         CompanyDetail(),
//                               //   ),
//                               // );
//                               // Add your code here that you want to execute after the delay
//                             });
//                             // Future.delayed(Duration(seconds: 2),
//                             //     () {
//                             //
//                             //   print(
//                             //       'Delayed action after 2 seconds');
//                             //   Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //       builder: (context) =>
//                             //           CompanyDetail(),
//                             //     ),
//                             //   );
//                             //   // Add your code here that you want to execute after the delay
//                             // });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   offset: Offset(0, 0),
//                                   blurRadius: 1,
//                                   color:
//                                   Color.fromRGBO(0, 0, 0, 0.16),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.all(
//                                   Radius.circular(6)),
//                             ),
//                             child: Column(
//                               mainAxisAlignment:
//                               MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.only(
//                                       right: 0),
//                                   height: categoryHeight * 0.5,
//                                   width: categoryWidth * 0.29,
//                                   child: ClipOval(
//                                     clipBehavior: Clip.none,
//                                     child: category?.companyImage !=
//                                         null
//                                         ? Image.network(
//                                       FixedText.imgurl +
//                                           category
//                                               .companyImage
//                                               .toString(),
//                                       //color: appColor,
//                                       fit: BoxFit.contain,
//                                       errorBuilder: (context,
//                                           error, stackTrace) {
//                                         return Image.asset(
//                                           'lib/assets/logo/noimageavlble.jpg',
//                                           // width:
//                                           //     categoryWidth *
//                                           //         0.2,
//                                           // height:
//                                           //     categoryHeight *
//                                           //         0.3,
//                                           //color: appColor,
//                                           fit: BoxFit.fill,
//                                         );
//                                       },
//                                     )
//                                         : Image.network(
//                                       'https://ih1.redbubble.net/image.5098928927.2456/flat,750x,075,f-pad,750x1000,f8f8f8.u2.jpg',
//                                       fit: BoxFit.fill,
//                                     ), // Provide a fallback image URL
//                                   ),
//                                 ),
//                                 SizedBox(
//                                     height: categoryHeight * 0.05),
//                                 responsiveText(
//                                   context: context,
//                                   text:
//                                   "${category?.organizationName ?? 'Unknown Company'}",
//                                   fontSizePortrait: 10,
//                                   fontSizeLandscape: 17,
//                                   color: Colors.black,
//                                 ),
//                                 // boldTextcat(category?.postedtype ??
//                                 //     'Unknown Category'),
//                                 SizedBox(
//                                     height: categoryHeight * 0.1),
//                                 greyTextSmall(
//                                   '(${category?.noofopening ?? 'Not Found'} jobs)',
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//       }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class HomeContainer extends StatelessWidget {
  final VoidCallback onTap; // Change to VoidCallback
  final String text;
  final double w;
  final double h;
  final Color color;
  final IconData icon;
  final double iconSize;
  final double textSize;
  final double radius;
  const HomeContainer({
    super.key,
    required this.onTap,
    required this.text,
    required this.h,
    required this.w,
    required this.color,
    required this.icon,
    required this.iconSize,
    required this.textSize,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
//Widget HomeContainer(Function onpressed, String text, Icon icon, Color color) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h,
          width: w,
          decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 0, 18, 0),
              child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
               Text(text,
                        style:
                        GoogleFonts.roboto(fontSize: textSize, color: Colors.black)),
                CircleAvatar(
                  radius: radius,
                  backgroundColor: color==home1?home2:home1,
                    child: Icon(icon,size: iconSize,)
                ),
              ]))),
    );
  }
}
class HomeContainer1 extends StatelessWidget {
  final VoidCallback onTap; // Change to VoidCallback
  final String text;
  final double w;
  final double h;
  final Color color;
  //final Icon icon;
  const HomeContainer1({
  super.key,
  required this.onTap,
  required this.text,
  required this.h,
  required this.w,
  required this.color,
  //required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: w,
        height: h,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12)
        ),
        margin: const EdgeInsets.fromLTRB(18,10,0,0),
        padding: const EdgeInsets.all(15),
        child:
           Text(text,
            style: GoogleFonts.roboto(
              //fontWeight: FontWeight.bold,
              fontSize: 22,
              //color: Colors.white,
            ),
        ),
      ),
    );
  }
}
