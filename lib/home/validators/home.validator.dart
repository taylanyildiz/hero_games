import 'package:hero_game/core/localization/translate.helper.dart';

abstract class HomeValidator {
  static String? hobbieValidator(String? input) {
    if (input?.isEmpty ?? true) return TranslateHelper.requiredHobby;
    if (input!.length < 2) return TranslateHelper.invalidHobby;
    return null;
  }
}
