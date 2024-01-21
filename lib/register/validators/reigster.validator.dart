import 'package:get/get.dart';

abstract class RegisterValidator {
  static String? emailValidator(String? input) {
    if (input?.isEmpty ?? true) return "Email is required";
    if (!GetUtils.isEmail(input!)) return "Invalid email address";
    return null;
  }

  static String? nameValidator(String? input) {
    if (input?.isEmpty ?? true) return "Name is required";
    if (GetUtils.isAlphabetOnly(input!) && input.length < 2) return "Invalid name";
    return null;
  }

  static String? bioValidator(String? input) {
    if (input?.isEmpty ?? true) return "Biography is required";
    if (input!.length < 2) return "Invalid biography";
    return null;
  }

  static String? passwordValidator(String? input) {
    if (input?.isEmpty ?? true) return "Password is required";
    if (input!.length < 6) return "Weak password";
    return null;
  }

  static String? confPasswordValidator(String? input, String? passwd) {
    if (input?.isEmpty ?? true) return "Password is required";
    if (input!.length < 6) return "Weak password";
    if (passwd != input) return "Passwords do not match";
    return null;
  }

  static String? birthDateValidator(String? input) {
    if (input?.isEmpty ?? true) return "Birtdate is required";
    if (!GetUtils.isDateTime(input!)) return "Invalid date";
    return null;
  }
}
