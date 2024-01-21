import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';

abstract class RegisterValidator {
  static String? emailValidator(String? input) {
    if (input?.isEmpty ?? true) return TranslateHelper.emailRequired;
    if (!GetUtils.isEmail(input!)) return TranslateHelper.invalidEmail;
    return null;
  }

  static String? nameValidator(String? input) {
    if (input?.isEmpty ?? true) return TranslateHelper.nameRueqired;
    if (GetUtils.isAlphabetOnly(input!) && input.length < 2) return TranslateHelper.invalidName;
    return null;
  }

  static String? bioValidator(String? input) {
    if (input?.isEmpty ?? true) return TranslateHelper.biographyRequired;
    if (input!.length < 2) return TranslateHelper.invalidBiography;
    return null;
  }

  static String? passwordValidator(String? input) {
    if (input?.isEmpty ?? true) return TranslateHelper.passwordRequired;
    if (input!.length < 6) return TranslateHelper.weakPassword;
    return null;
  }

  static String? confPasswordValidator(String? input, String? passwd) {
    if (input?.isEmpty ?? true) return TranslateHelper.passwordRequired;
    if (input!.length < 6) return TranslateHelper.weakPassword;
    if (passwd != input) return TranslateHelper.notComparePasswords;
    return null;
  }

  static String? birthDateValidator(String? input) {
    if (input?.isEmpty ?? true) return TranslateHelper.birthDateRequired;
    if (!GetUtils.isDateTime(input!)) return TranslateHelper.invalidBirthdate;
    ;
    return null;
  }
}
