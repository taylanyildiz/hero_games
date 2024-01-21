import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';
import '../controllers/login.controler.dart';

class RegisterButton extends GetView<LoginController> {
  const RegisterButton({
    super.key,
  });

  void _onTap() {
    controller.onRegister();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Get.textTheme.bodyMedium,
        children: [
          TextSpan(text: TranslateHelper.doNotAcccount),
          TextSpan(
              text: TranslateHelper.account,
              recognizer: TapGestureRecognizer()..onTap = _onTap,
              style: Get.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              )),
          const TextSpan(text: " ?"),
        ],
      ),
    );
  }
}
