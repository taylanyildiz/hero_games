import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        text: "",
        style: Get.textTheme.bodyMedium,
        children: [
          const TextSpan(text: "You don't have an "),
          TextSpan(
              text: "account",
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
