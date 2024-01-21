import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';

abstract class LoginValidator {
  static String? emailValidator(String? input) {
    if (input?.isEmpty ?? true) return TranslateHelper.emailRequired;
    if (!GetUtils.isEmail(input!)) return TranslateHelper.invalidEmail;
    return null;
  }

  static String? passwordValidator(String? input) {
    if (input?.isEmpty ?? true) return TranslateHelper.passwordRequired;
    return null;
  }
}
