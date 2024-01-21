import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';
import '/register/validators/reigster.validator.dart';
import '/register/data/register-caption.data.dart';
import '/core/widgets/widgets.dart';
import '/register/controllers/register.controller.dart';
import '/register/widgets/widgets.dart';

class RegisterPasswordPage extends GetView<RegisterController> {
  const RegisterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (_) {
      return Scaffold(
        body: Form(
          key: controller.passwordKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterCaption(caption: passwordCaption),
                TextOutlinedLabelField(
                  label: TranslateHelper.password,
                  secret: true,
                  controller: controller.passwordController,
                  prefixIcon: const Icon(Icons.password),
                  validator: RegisterValidator.passwordValidator,
                ),
                const SizedBox(height: 10.0),
                TextOutlinedLabelField(
                  label: TranslateHelper.confirmPassword,
                  secret: true,
                  controller: controller.confPasswordController,
                  prefixIcon: const Icon(Icons.password),
                  validator: (input) => RegisterValidator.confPasswordValidator(input, controller.password),
                ),
                _buildNextButton,
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget get _buildNextButton {
    return RegisterNextButton(
      onPressed: controller.onNextPage,
      title: TranslateHelper.done,
    );
  }
}
