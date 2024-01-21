import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/models/models.dart';
import '/core/models/hobby.model.dart';
import '/core/firebase/firebase-store.service.dart';
import '/core/dialogs/app.dialog.dart';
import '/core/firebase/firebase-auth.service.dart';

class HomeController extends GetxController with _Inputs {
  /// Firebase Auth servie
  final FirebaseAuthService authService = Get.find();
  String get uid => authService.user!.uid!;
  String get email => authService.user!.email!;

  /// Firebase store service
  final FirebaseStoreService storeService = Get.find();

  Stream<UserInfoModel?> get streamUserInfo {
    return storeService.streamUserInfo(uid);
  }

  Stream<List<Hobby>> get streamHobbies {
    return storeService.streamHobby(uid);
  }

  /// On Logout
  void onLogout() async {
    AppDialog.logout(authService.logout);
  }

  void onAddHobbie() async {
    if (!validate) return;
    unFocus();
    final hobby = Hobby(name: hobbyName);
    await AppDialog.loading(onBuild: () => storeService.addHobby(uid, hobby));
    hobbyController.clear();
  }
}

mixin _Inputs {
  GlobalKey<FormState> formKey = GlobalKey();
  bool get validate => formKey.currentState?.validate() ?? false;

  TextEditingController hobbyController = TextEditingController();
  String get hobbyName => hobbyController.text;

  FocusNode focusNode = FocusNode();

  void unFocus() {
    return focusNode.unfocus();
  }
}
