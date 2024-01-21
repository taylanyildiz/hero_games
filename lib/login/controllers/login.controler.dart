import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hero_game/core/dialogs/app.dialog.dart';
import '/core/firebase/firebase-auth.service.dart';
import '/core/routes/app.routes.dart';

class LoginController extends GetxController with Inputs {
  FirebaseAuthService authService = Get.find();

  @override
  void onInit() {
    initInputs();
    super.onInit();
  }

  @override
  void dispose() {
    disposeInputs();
    super.dispose();
  }

  /// Login request
  Future<void> onLogin() async {
    if (!validate) return;
    AppDialog.loading(
      close: false,
      onBuild: () => authService.signIn(email, password),
    );
  }

  /// Register page open
  void onRegister() {
    Get.toNamed(AppRoutes.register);
  }
}

mixin Inputs {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool get validate => formKey.currentState?.validate() ?? false;

  late TextEditingController emailController;
  String get email => emailController.text;

  late TextEditingController passwordController;
  String get password => passwordController.text;

  @protected
  void initInputs() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @protected
  void disposeInputs() {
    emailController.dispose();
    passwordController.dispose();
  }
}
