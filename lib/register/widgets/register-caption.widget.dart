import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/register/controllers/register.controller.dart';
import '/register/entities/entities.dart';

class RegisterCaption extends GetView<RegisterController> {
  const RegisterCaption({
    super.key,
    required this.caption,
  });

  final RegisterCaptionEntity caption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: controller.onBack, icon: const Icon(Icons.arrow_back_ios)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption.title,
                  style: Get.textTheme.headlineMedium,
                ),
                Text(
                  caption.description,
                  style: Get.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
