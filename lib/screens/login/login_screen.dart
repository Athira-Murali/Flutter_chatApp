import 'package:chate_app/screens/login/login_controller.dart';
import 'package:chate_app/screens/register/register_screen.dart';
import 'package:chate_app/widgets/custom_button.dart';
import 'package:chate_app/widgets/reusable.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Obx((() => LoadingOverlay(
              isLoading: controller.isLoading,
              child: GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: SafeArea(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(36.0),
                              child: Form(
                                  key: controller.formKey,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 200,
                                          child: Image.asset(
                                              "assets/images/work.png"),
                                        ),
                                        ReusableTextField(
                                            context: context,
                                            text: 'enter email',
                                            icon: Icons.mail,
                                            isPasswordType: false,
                                            controller:
                                                controller.emailTextController),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ReusableTextField(
                                            context: context,
                                            text: 'enter password',
                                            icon: Icons.lock,
                                            isPasswordType: true,
                                            controller: controller
                                                .passwordTextController),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomButton(
                                            context: context,
                                            onPressed: () =>
                                                controller.onLoginFunction(),
                                            title: 'Login'),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                                "Don't have an account?"),
                                            GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      const RegisterationScreen());
                                                },
                                                child: const Text(
                                                  "SignUp",
                                                  style: TextStyle(
                                                      color: Colors.purple,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ))
                                          ],
                                        )
                                      ])),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )))));
        });
  }
}


  

 

  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await _auth
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .then((uid) => {
  //                 Fluttertoast.showToast(msg: "Login successful"),
  //                 Get.to(HomeScreen())
  //               });
  //     } on FirebaseAuthException catch (error) {
  //       switch (error.code) {
  //         case "invalid - email":
  //           errorMessage = "your email address appers to be malformed";

  //           break;

  //         case "wrong- password":
  //           errorMessage = "your password is wrong.";
  //           break;

  //         case "user-not-found":
  //           errorMessage = "User with this email doesn't exist.";
  //           break;
  //         case "user-disabled":
  //           errorMessage = "User with this email has been disabled.";
  //           break;
  //         case "too-many-requests":
  //           errorMessage = "Too many requests";
  //           break;
  //         case "operation-not-allowed":
  //           errorMessage = "Signing in with Email and Password is not enabled.";
  //           break;
  //         default:
  //           errorMessage = "An undefined Error happened.";
  //       }
  //       Fluttertoast.showToast(msg: errorMessage!);
  //       print(error.code);
  //     }
  //   }
  // }

