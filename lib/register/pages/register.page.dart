import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hero_game/register/pages/pages.dart';
import '../controllers/register.controller.dart';
import '../widgets/widgets.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RegisterIndicator(),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: const [
                  RegisterEmailPage(),
                  RegisterInfoPage(),
                  RegisterPasswordPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
