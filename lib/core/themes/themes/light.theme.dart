import 'package:flutter/material.dart';
import '/core/themes/colors/light.color.dart';
import '../styles/light.style.dart';

abstract class LightTheme {
  /// Light Theme Data
  /// returns [ThemeData]
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: LightColor.scaffoldBackgroundColor,
        useMaterial3: true,
        textTheme: LightStyle(),
        inputDecorationTheme: _inputDecorationTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        dialogTheme: _dialogTheme,
        listTileTheme: _listTileTheme,
      );

  // Input decoration theme
  static get _inputDecorationTheme => const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          height: .1,
        ),
      );

  // Elevated button theme
  static get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.orange),
          foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          )),
          textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.normal,
          )),
        ),
      );

  /// Dialog theme
  static get _dialogTheme => DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
        ),
      );

  static get _listTileTheme => const ListTileThemeData(
        style: ListTileStyle.list,
        textColor: Colors.black54,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      );
}
