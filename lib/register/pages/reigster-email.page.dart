import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';
import '/register/validators/reigster.validator.dart';
import '/register/data/register-caption.data.dart';
import '/core/widgets/widgets.dart';
import '/register/controllers/register.controller.dart';
import '/register/widgets/widgets.dart';

class RegisterEmailPage extends GetView<RegisterController> {
  const RegisterEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.emailKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterCaption(caption: emailCaption),
              TextOutlinedLabelField(
                label: TranslateHelper.email,
                inputType: TextInputType.emailAddress,
                controller: controller.emailController,
                prefixIcon: const Icon(Icons.mail),
                validator: RegisterValidator.emailValidator,
              ),
              _buildNextButton,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildNextButton {
    return RegisterNextButton(
      onPressed: controller.onNextPage,
      title: TranslateHelper.next,
    );
  }
}
