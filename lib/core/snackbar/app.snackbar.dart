import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarOptions {
  /// Snacbar background color
  final Color backgroundColor;

  /// Snackbar title
  final String title;

  /// Snackbar description
  final String? desc;

  /// Icon
  final Widget? icon;

  SnackBarOptions({
    required this.title,
    this.backgroundColor = Colors.transparent,
    this.desc,
    this.icon,
  });
}

abstract class AppSnackbar {
  static open(SnackBarOptions options) {
    bool nullDesc = options.desc == null;

    TextStyle titleStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    );

    TextStyle descStyle = const TextStyle(
      color: Colors.white54,
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    );

    Widget? title() {
      if (nullDesc) return null;
      return Text(
        options.title,
        style: titleStyle,
      );
    }

    Widget description() {
      return Text(
        options.desc ?? options.title,
        style: nullDesc ? titleStyle : descStyle,
      );
    }

    Widget? icon() {
      if (options.icon == null) return null;
      return Container(
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconTheme(
          data: const IconThemeData(color: Colors.black, size: 20.0),
          child: options.icon!,
        ),
      );
    }

    Get.showSnackbar(
      GetSnackBar(
        isDismissible: true,
        icon: icon(),
        duration: const Duration(milliseconds: 1500),
        backgroundColor: options.backgroundColor,
        dismissDirection: DismissDirection.up,
        titleText: title(),
        messageText: description(),
      ),
    );
  }

  static success(String title, [String? description]) {
    open(SnackBarOptions(
      title: title,
      desc: description,
      backgroundColor: Colors.green,
      icon: const Icon(Icons.done),
    ));
  }

  static warning(String title, [String? description]) {
    open(SnackBarOptions(
      title: title,
      desc: description,
      backgroundColor: Colors.orange,
      icon: const Icon(Icons.warning),
    ));
  }

  static error(String title, [String? description]) {
    open(SnackBarOptions(
      title: title,
      desc: description,
      backgroundColor: Colors.red,
      icon: const Icon(Icons.error),
    ));
  }
}
