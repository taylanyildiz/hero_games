import 'package:get/get.dart';
import '../../core/firebase/firebase-auth.service.dart';
import '../../core/firebase/firebase-store.service.dart';
import '../controllers/splash.controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.put(FirebaseStoreService());
    Get.put(FirebaseAuthService());
  }
}
