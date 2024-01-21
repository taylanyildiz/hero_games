import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/splash/widgets/splash-circle.widget.dart';
import '../controllers/splash.controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return const Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SplashCircle(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
