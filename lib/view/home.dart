import 'package:dsa_app/constant.dart';
import 'package:dsa_app/controller/login_controller.dart';
import 'package:dsa_app/view/home_phone.dart';
import 'package:dsa_app/view/home_tab.dart';
import 'package:dsa_app/view/login.dart';
import 'package:dsa_app/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/profile_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed:()async {
              await profileController.profileApi();
          Get.to(()=>Profile());
          },
            icon:Icon(Icons.account_circle_rounded,color: blue,size: 36,)),
        title: Container(
          decoration: const BoxDecoration(
           // color: Colors.white,
          ),
            child: const Image(image:AssetImage('assets/logo.png'),height: 70,width: 70,)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async{
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.clear();
            LoginController loginController = await LoginController();
            loginController.dispose();
            Get.to(()=>const LoginPage());
            print("logout");
          }, icon: const Icon(Icons.logout_outlined),color: blue,)
        ],
      ),
      body:
         const PhoneHome());


      // drawer: Drawer(
      //
      //   shadowColor: Colors.black,
      //   child: ListView(
      //     padding: const EdgeInsets.all(0),
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Color(0xff9E6A06),
      //         ), //BoxDecoration
      //         child: UserAccountsDrawerHeader(
      //           decoration: BoxDecoration(color: Color(0xff9E6A06),),
      //           accountName: Text(
      //             "DSA",
      //             style: TextStyle(fontSize: 18),
      //           ),
      //           accountEmail: Text("testing@gmail.com"),
      //           currentAccountPictureSize: Size.square(50),
      //           currentAccountPicture: CircleAvatar(
      //             backgroundColor: Color(0xff9E6A06),
      //             child: Text(
      //               "D",
      //               style: TextStyle(fontSize: 30.0, color: Colors.white),
      //             ), //Text
      //           ), //circleAvatar
      //         ), //UserAccountDrawerHeader
      //       ), //DrawerHeader
      //       ListTile(
      //         leading: const Icon(Icons.dashboard_rounded),
      //         title: const Text(' Dashboard '),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.attachment_rounded),
      //         title: const Text(' Accounting '),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.currency_rupee_rounded),
      //         title: const Text(' Add Payment '),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.account_circle_rounded),
      //         title: const Text(' User '),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.edit),
      //         title: const Text(' Change Password '),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),ListTile(
      //         //leading: const Icon(Icons.edit),
      //         title: const Text(' Change Sale/GRE Password '),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),ListTile(
      //         //leading: const Icon(Icons.edit),
      //         title: const Text(' Terms/Agreement(Accepted) '),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.logout),
      //         title: const Text('LogOut'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),

  }
}
