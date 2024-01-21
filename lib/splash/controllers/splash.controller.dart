import 'dart:async';
import 'package:get/get.dart';
import '/core/firebase/firebase-auth.service.dart';
import '/core/routes/app.routes.dart';

class SplashController extends GetxController {
  /// Firebase auth service
  final FirebaseAuthService authService = Get.find();

  Timer? timer;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3)).then((value) => checkUserExists());
    super.onReady();
  }

  Future<void> checkUserExists() async {
    final user = authService.user;
    if (user != null) return Get.offNamed(AppRoutes.home);
    Get.offNamed(AppRoutes.login);
  }
}
