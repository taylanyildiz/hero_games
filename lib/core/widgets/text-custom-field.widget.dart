import 'package:flutter/material.dart';

typedef ValidatorBuilder = String? Function(String? input);

class TextFieldSecret {
  ValueNotifier<bool>? obscureTextNotifier;
  TextFieldSecret([bool? secret]) {
    obscureTextNotifier = ValueNotifier(secret ?? false);
  }

  bool get obscureText => obscureTextNotifier?.value ?? false;

  void setObscure() {
    obscureTextNotifier?.value = !obscureText;
  }
}

class TextCustomField extends StatelessWidget {
  TextCustomField({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.secret = false,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.maxLines = 1,
    this.minLines,
    this.constraints,
    this.contentPadding,
    this.enabled = true,
    this.style,
    this.focusNode,
    this.autoFocus = false,
    this.inputType,
  })  : assert(!secret || suffixIcon == null),
        fieldSecret = TextFieldSecret(secret);

  /// Text field controller
  final TextEditingController? controller;

  /// Text field validator
  final ValidatorBuilder? validator;

  /// Hint text
  final String? hintText;

  /// Field suffix icon
  final Widget? suffixIcon;

  /// Field prefix icon
  final Widget? prefixIcon;

  /// Secret field
  /// Don't set true if use the [suffixIcon]
  /// default false
  final bool secret;

  /// Input border
  final InputBorder? border;

  /// Enabled border
  final InputBorder? enabledBorder;

  /// Focused border
  final InputBorder? focusedBorder;

  /// Disabled border
  final InputBorder? disabledBorder;

  /// Error border
  final InputBorder? errorBorder;

  /// Focused error border
  final InputBorder? focusedErrorBorder;

  /// Field secret
  final TextFieldSecret fieldSecret;

  /// Field max lines
  final int maxLines;

  /// Field min lines
  final int? minLines;

  /// Field decoration constrants
  final BoxConstraints? constraints;

  /// Enabled condition
  final bool enabled;

  /// Padding content
  final EdgeInsets? contentPadding;

  /// Input decoration style
  final TextStyle? style;

  /// Focus node
  final FocusNode? focusNode;

  /// Auto focus
  /// default [false]
  final bool autoFocus;

  /// Text input type
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      key: key,
      valueListenable: fieldSecret.obscureTextNotifier!,
      builder: (context, value, child) {
        return TextFormField(
          controller: controller,
          obscureText: value,
          validator: validator,
          maxLines: maxLines,
          minLines: minLines,
          enabled: enabled,
          style: style,
          autofocus: autoFocus,
          focusNode: focusNode,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: _suffixIcon,
            prefixIcon: prefixIcon,
            border: border,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            disabledBorder: disabledBorder,
            focusedErrorBorder: focusedErrorBorder,
            contentPadding: contentPadding ?? (maxLines == 1 ? const EdgeInsets.only(left: 10.0) : null),
            constraints: constraints,
          ),
        );
      },
    );
  }

  Widget? get _suffixIcon {
    if (secret) return _visibilityButton;
    return suffixIcon;
  }

  Widget? get _visibilityButton {
    return ValueListenableBuilder(
      valueListenable: fieldSecret.obscureTextNotifier!,
      builder: (context, bool value, child) {
        return IconButton(
          onPressed: () {
            fieldSecret.setObscure();
          },
          icon: Icon(value ? Icons.visibility : Icons.visibility_off),
        );
      },
    );
  }
}
