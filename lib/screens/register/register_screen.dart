import 'package:chate_app/model/user_model.dart';
import 'package:chate_app/screens/home/home_screen.dart';
import 'package:chate_app/screens/login/login_screen.dart';
import 'package:chate_app/screens/register/register_controller.dart';
import 'package:chate_app/widgets/custom_button.dart';
import 'package:chate_app/widgets/reusable.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
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
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  body: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 200,
                                  child: Image.asset("assets/images/work.png"),
                                ),
                                //firstNameField,
                                ReusableTextField(
                                    context: context,
                                    text: "first name",
                                    icon: Icons.person_outlined,
                                    isPasswordType: false,
                                    controller: controller.firstnameController),
                                const SizedBox(
                                  height: 10,
                                ),
                                ReusableTextField(
                                    context: context,
                                    text: "second name",
                                    icon: Icons.person_outlined,
                                    isPasswordType: false,
                                    controller:
                                        controller.secondnameController),

                                const SizedBox(
                                  height: 10,
                                ),

                                ReusableTextField(
                                    context: context,
                                    text: "email",
                                    icon: Icons.mail,
                                    isPasswordType: false,
                                    controller: controller.emailController),
                                const SizedBox(
                                  height: 10,
                                ),
                                //passwordField,
                                ReusableTextField(
                                    context: context,
                                    text: "password",
                                    icon: Icons.lock,
                                    isPasswordType: true,
                                    controller: controller.passwordController),
                                const SizedBox(
                                  height: 10,
                                ),
                                ReusableTextField(
                                    context: context,
                                    text: "confirm password",
                                    icon: Icons.lock,
                                    isPasswordType: true,
                                    controller:
                                        controller.confirmpasswordController),

                                const SizedBox(
                                  height: 15,
                                ),
                                CustomButton(
                                    context: context,
                                    onPressed: () {
                                      controller.onRegisterFunction(
                                          controller.emailController.text,
                                          controller.passwordController.text);
                                    },
                                    title: 'sign Up'),
                               

                                const SizedBox(height: 20),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("have an account?"),
                                    GestureDetector(
                                        onTap: () {
                                          Get.to(const LoginScreen());
                                        },
                                        child: const Text(
                                          "Sign In",
                                          style: TextStyle(
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ))
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ))));
        });
  }
}
