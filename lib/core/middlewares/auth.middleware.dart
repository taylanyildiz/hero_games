import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/firebase/firebase-auth.service.dart';
import '/core/routes/app.routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    FirebaseAuthService authService = Get.find();
    if (authService.user == null && route != AppRoutes.login) {
      return RouteSettings(name: AppRoutes.login);
    }
    return super.redirect(route);
  }
}
