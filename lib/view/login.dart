import 'package:dsa_app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import '../model/login_model.dart';
import '../services/request.dart';
import 'home.dart';
import 'package:dsa_app/view/widgets/apptext.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
  final FocusNode dsaFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();

  Future<void> handleLogin() async {
    if (_formKey.currentState!.validate()) {
      UserModel? user = await loginUserr(
        dsaCodeController.text,
        passLoginController.text,
      );

      if (user != null) {
        Get.to(() => const Home());
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: OrientationBuilder(builder: (context, orientation) {
        return LayoutBuilder(builder: (context, constraints) {
          var screenWidth = constraints.maxWidth;
          var screenHeight = constraints.maxHeight;

          var categoryWidth = orientation == Orientation.portrait
              ? screenWidth * 0.6
              : screenWidth * 0.4;
          var categoryHeight = orientation == Orientation.portrait
              ? screenHeight * 0.6
              : screenHeight * 0.6;
          var containerWidth = orientation == Orientation.portrait
              ? screenWidth * 0.6
              : screenWidth * 0.6;
          var containerHeight = orientation == Orientation.portrait
              ? screenHeight * 0.5
              : screenHeight * 0.4;

          return Obx(() => (loginController.isLoading.value)
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/sky.png"),
                    fit: BoxFit.fill,
                    opacity: 0.2,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: categoryHeight * 0.4,
                      width: categoryWidth * 0.5,
                      child: const Image(
                        image: AssetImage("assets/logo.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 0.0),
                      child: Form(
                        key: loginController.loginFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Login to your Account",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            AppText(
                              text: "DSA Code",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                              focusNode: dsaFocusNode,
                              controller:
                              loginController.usernameController1,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0)),
                                ),
                                hintText: 'Dsa Code',
                              ),
                            ),
                            const SizedBox(height: 10),
                            AppText(
                              text: "Password",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                              focusNode: passFocusNode,
                              controller:
                              loginController.passwordController1,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0)),
                                ),
                                hintText: 'Password',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  loginController.checkLogin();
                                  print("Login");
                                },
                                child: const Text("Login"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: screenWidth,
                        height: containerHeight * 0.6,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/travelll.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
        });
      }),
    );
  }
}
