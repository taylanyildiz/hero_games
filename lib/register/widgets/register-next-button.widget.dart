import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '/core/widgets/widgets.dart';

class RegisterNextButton extends PrimaryButton {
  const RegisterNextButton({
    super.key,
    required super.onPressed,
    required super.title,
  });

  @override
  double? get width => Get.size.width;

  @override
  TextStyle? get titleStyle => Get.textTheme.labelMedium;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: super.build(context),
    );
  }
}
