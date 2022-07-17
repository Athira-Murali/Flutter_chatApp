

import 'package:chate_app/repository/firebase_function.dart';
import 'package:chate_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController{
   final formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  onLoginFunction() {
    if (emailTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      _isLoading(true);

      logIn(emailTextController.text, passwordTextController.text).then((user) {
        if (user != null) {
          debugPrint("login Sucessfull");
          _isLoading(false);
          Get.to(const HomeScreen());
        } else {
          debugPrint("Login failed");
          _isLoading(false);
        }
      });
    } else {
      // showErrorSnackbar(
      //     title: "Please fill form correctly", message: e.toString());
       debugPrint("Please fill form correctly");
    }
  }
}
