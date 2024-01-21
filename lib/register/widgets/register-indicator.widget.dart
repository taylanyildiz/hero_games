import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hero_game/register/controllers/register.controller.dart';

class RegisterIndicator extends GetView<RegisterController> {
  const RegisterIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.pageController,
      builder: (context, child) {
        return Container(
          width: (Get.size.width / 3) * (controller.pageEnum.page + 1),
          height: 10.0,
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4.0),
              bottomRight: Radius.circular(4.0),
            ),
          ),
        );
      },
    );
  }
}
