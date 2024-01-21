import 'package:flutter/material.dart';
import 'text-outlined-field.widget.dart';

class TextOutlinedLabelField extends TextOutlinedField {
  TextOutlinedLabelField({
    super.key,
    required this.label,
    this.labelStyle,
    super.controller,
    super.prefixIcon,
    super.suffixIcon,
    super.secret,
    super.validator,
    super.hintText,
    super.maxLines,
    super.minLines,
    super.inputType,
  });

  /// Label of field
  final String label;

  /// Label style
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;
    final labelThemeStyle = theme.labelStyle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ?? labelThemeStyle,
        ),
        const SizedBox(height: 4.0),
        super.build(context),
      ],
    );
  }
}
