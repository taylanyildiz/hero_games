import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'text-custom-field.widget.dart';

InputBorder _inputBorder({Color? color, double? width}) {
  return UnderlineInputBorder(
    borderRadius: BorderRadius.circular(3.0),
    borderSide: BorderSide(color: color ?? Colors.grey, width: width ?? 1.0),
  );
}

class TextUnderlinedField extends TextCustomField {
  TextUnderlinedField({
    super.key,
    super.hintText,
    super.controller,
    super.prefixIcon,
    super.suffixIcon,
    super.secret,
    super.validator,
    super.maxLines,
    super.minLines,
    super.enabled,
    super.constraints,
    super.contentPadding,
    super.focusNode,
    super.autoFocus,
  });

  @override
  InputBorder? get border => _inputBorder();

  @override
  InputBorder? get focusedBorder => _inputBorder(color: Colors.blue, width: 1.5);

  @override
  InputBorder? get errorBorder => _inputBorder(color: Colors.red);

  @override
  InputBorder? get focusedErrorBorder => _inputBorder(color: Colors.red, width: 1.5);

  @override
  TextStyle? get style => Get.textTheme.bodyMedium;
}
