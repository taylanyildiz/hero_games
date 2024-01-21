import 'package:get/get.dart';
import '../controllers/login.controler.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
