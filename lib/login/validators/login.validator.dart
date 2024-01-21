import 'package:get/get.dart';

abstract class LoginValidator {
  static String? emailValidator(String? input) {
    if (input?.isEmpty ?? true) return "email is required";
    if (!GetUtils.isEmail(input!)) return "invalid email address";
    return null;
  }

  static String? passwordValidator(String? input) {
    if (input?.isEmpty ?? true) return "password is required";
    return null;
  }
}
