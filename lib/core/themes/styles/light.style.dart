import 'package:flutter/material.dart';

class LightStyle extends TextTheme {
  @override
  TextStyle? get headlineMedium => const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle? get headlineSmall => const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: Colors.black38,
      );

  @override
  TextStyle? get labelMedium => const TextStyle(
        color: Colors.white,
        fontSize: 17.0,
      );

  @override
  TextStyle? get labelLarge => const TextStyle(
        color: Colors.black,
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle? get bodyMedium => const TextStyle(
        color: Colors.black,
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle? get bodyLarge => const TextStyle(
        color: Colors.black,
        fontSize: 17.0,
      );
}
