import 'package:get/utils.dart';

const String emptyFields = "Please fill the field";
const String invalidEmail = "Please enter a valid email.";
const String invalidMobile = "Please enter a valid mobile number.";

abstract class ValidationStatus {}

class ValidationSuccess extends ValidationStatus {
  @override
  String toString() {
    return "success";
  }
}

class ValidationError extends ValidationStatus {
  final String errorMessage;

  ValidationError({required this.errorMessage});

  @override
  String toString() {
    return errorMessage;
  }
}

bool isValidEmail(String email) {
  return GetUtils.isEmail(email);
}

bool isValidName(String name) {
  return RegExp(r"^[A-Za-z][A-Za-z0-9_ ]{1,29}$").hasMatch(name);
}
