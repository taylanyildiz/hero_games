import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConfig {
  static String get appName => "Hero Games";
  static Locale get locale => Get.locale ?? const Locale('en', 'en_US');
  static List<Locale> get supportedLocales => const [
        Locale('tr', 'TR'),
        Locale('en', 'en_US'),
      ];
}
