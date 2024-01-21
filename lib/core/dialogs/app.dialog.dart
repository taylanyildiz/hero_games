import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '/core/dialogs/widgets/widgets.dart';
import '/core/localization/translate.helper.dart';

class AppDialog {
  /// Open dialog
  static Future<T?> open<T>(
    Widget dialog, {
    Color barrierColor = Colors.black38,
    bool barrierDismissible = true,
  }) {
    return Get.dialog(
      dialog,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
    );
  }

  static Future<T?> loading<T>({bool close = true, FutureOr<T?> Function()? onBuild}) async {
    open(const LoadingDialog(), barrierDismissible: false);
    if (onBuild == null) return null;
    final result = await onBuild.call();
    if (close || Get.isSnackbarOpen) {
      if (Get.isSnackbarOpen) {
        /// Wait until snackbar closes
        await Future.delayed(const Duration(milliseconds: 3100));
      }
      Get.back();
    }
    return result;
  }

  static Future<void> logout(FutureOr<dynamic> Function() onBuild) async {
    final result = await open(ConfirmDialog(
      title: TranslateHelper.logout,
      description: TranslateHelper.sureLogout,
    ));
    if (result == true) {
      loading(close: false, onBuild: onBuild);
    }
  }
}
