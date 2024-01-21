import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hero_game/login/validators/login.validator.dart';
import 'package:hero_game/login/widgets/register-button.widget.dart';
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
                    controller: controller.emailController,
                    key: const ValueKey("email"),
                    label: "Email",
                    inputType: TextInputType.emailAddress,
                    suffixIcon: const Icon(Icons.email),
                    validator: LoginValidator.emailValidator,
                  ),
                  const SizedBox(height: 10.0),
                  TextOutlinedLabelField(
                    controller: controller.passwordController,
                    key: const ValueKey("password"),
                    label: "Password",
                    secret: true,
                    validator: LoginValidator.passwordValidator,
                  ),
                  const SizedBox(height: 10.0),
                  const RegisterButton(),
                  const SizedBox(height: 15.0),
                  PrimaryButton(
                    width: Get.size.width,
                    onPressed: controller.onLogin,
                    title: "Login",
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
