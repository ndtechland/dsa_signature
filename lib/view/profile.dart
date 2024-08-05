// import 'package:dsa_app/constant.dart';
// import 'package:dsa_app/view/widgets/appbar.dart';
// import 'package:dsa_app/view/widgets/apptext.dart';
// import 'package:flutter/material.dart';
// class Profile extends StatelessWidget {
//   const Profile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             AppBarr(),
//             Expanded(child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Center(
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundColor: blue,
//
//                     ),
//                   ),
//                   const SizedBox(height: 10,),
//                   AppText(text: "ND Techland Pvt Ltd", size: 18),
//                   const SizedBox(height: 10,),
//                   AppText(text: "text", size: 16),
//                 ],
//               ),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'dart:math';

import 'package:dsa_app/view/widgets/textConstant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../constant.dart';
import '../controller/profile_controller.dart';
import '../model/profile_model.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  final ProfileController _getprofilee = Get.put(ProfileController());
  // UserProfileUodateController _userProfileUodateController =
  // Get.put(UserProfileUodateController());

  // static const String id = 'Profile';

  Profile({Key? key}) : super(key: key);
  GetProfileModel? getprofileModel;

  int selectID = 1;
  String dropdownValueDay = '2';
  String dropdownValueMonth = 'July';
  String dropdownValueYear = '1990';
  String dropdownValueCountry = 'India';
  String dropdownValueZip = '110096';

  // final TextEditingController _nameController = TextEditingController(
  //     // text: _getprofilee.getprofileModel.response.fullName
  //     );

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body:
      Obx(
            () => (_getprofilee.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            :
            SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: _buildHeader(context)),
              const SizedBox(height: 8),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("DSA Code",
                          //"${_getprofilee.getprofileModel?.response!.emailId.toString()}",
                          style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8,),
                        Text(
                          "${_getprofilee.getprofileModel?.data!.dsaCode.toString()}",
                          style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text("Email:",
                          //"${_getprofilee.getprofileModel?.response!.emailId.toString()}",
                          style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8,),
                        Text(
                          "${_getprofilee.getprofileModel?.data!.email.toString()}",
                          style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Mobile:',
                          // "${_getprofilee.getprofileModel?.response!.mobileNumber.toString()}",
                          style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8,),
                        Text(
                           "${_getprofilee.getprofileModel?.data!.mobile.toString()}",
                          style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address:",
                          style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          height: 100,
                          width: 240,
                          //color: Colors.pink,
                          child: Wrap(
                            children:[ Text(
                              //overflow: TextOverflow.ellipsis,
                               "${_getprofilee.getprofileModel?.data!.address.toString()}",
                              style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w500,
                              // overflow: TextOverflow.ellipsis
                              ),
                            ),]
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text('JoiningDate:',
                          // "${_getprofilee.getprofileModel?.response!.mobileNumber.toString()}",
                          style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8,),
                        Text(
                          "${_getprofilee.getprofileModel?.data!.joiningDate.toString()}",
                          style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),),
              ),

            ],
          ),
        ),
      )
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: blue,
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: <Color>[blue, gold]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const SizedBox(height: 16),
            IconButton(
                onPressed: () {
                  Get.to(Home());
                  // Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white,size: 30,)),
            // Text(
            //   'Profile',
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: 'medium',
            //       fontSize: 20),
            // ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0,0.0,0,0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Text("${_getprofilee.getprofileModel?.data?.name?.substring(0,1)}",style: TextStyle(
                        color: blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "${_getprofilee.getprofileModel?.data!.name.toString()}",
                    style: TextStyle(
                        fontSize: 24, fontFamily: 'medium', color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),


          ],
        ));
  }

  ///pdf:downlload...
  // Future<File?> pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );
  //   if (result == null) return null;
  //   return File(result.paths.first ?? '');
  // }

  Future<File> loadPdfFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }

  //final file = File('example.pdf');
  //await file.writeAsBytes(await pdf.save());

  // void openPdf(BuildContext context, File file, String url) =>
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => PdfViewerPage(
  //           file: file,
  //           url: url,
  //         ),
  //       ),
  //     );
}