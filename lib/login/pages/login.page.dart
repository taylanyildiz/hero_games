import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';
import '/login/validators/login.validator.dart';
import '/login/widgets/register-button.widget.dart';
import '../../core/widgets/widgets.dart';
import '../controllers/login.controler.dart';
import '/gen/assets.gen.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(tag: "logo", child: Assets.images.logo.image(width: 200.0)),
                  const SizedBox(height: 20.0),
                  TextOutlinedLabelField(
                    label: TranslateHelper.email,
                    controller: controller.emailController,
                    inputType: TextInputType.emailAddress,
                    suffixIcon: const Icon(Icons.email),
                    validator: LoginValidator.emailValidator,
                  ),
                  const SizedBox(height: 10.0),
                  TextOutlinedLabelField(
                    label: TranslateHelper.password,
                    controller: controller.passwordController,
                    secret: true,
                    validator: LoginValidator.passwordValidator,
                  ),
                  const SizedBox(height: 10.0),
                  const RegisterButton(),
                  const SizedBox(height: 15.0),
                  PrimaryButton(
                    width: Get.size.width,
                    onPressed: controller.onLogin,
                    title: TranslateHelper.login,
                    titleStyle: Get.textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
