import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.child,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.width,
  }) : assert((title == null || child == null) && (title != null || child != null));

  /// Called when the button is tapped.
  final void Function() onPressed;

  /// Child of button
  /// High priority than [title]
  final Widget? child;

  /// Title of button
  final String? title;

  /// Title style
  final TextStyle? titleStyle;

  /// Background color
  final Color? backgroundColor;

  /// Foreground color
  final Color? foregroundColor;

  /// Height fixed
  final double? height;

  /// Width fixed
  final double? width;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).elevatedButtonTheme.style;
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: style?.copyWith(
          backgroundColor: backgroundColor != null ? MaterialStatePropertyAll(backgroundColor) : null,
          foregroundColor: _foregroundColor,
          fixedSize: MaterialStatePropertyAll(Size(
            width ?? double.infinity,
            height ?? double.infinity,
          )),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: buttonChild(style),
      ),
    );
  }

  Widget buttonChild(ButtonStyle? style) {
    Widget? children = child;
    children ??= Text(title!, style: titleStyle);
    return children;
  }

  MaterialStateProperty<Color?>? get _foregroundColor {
    Color? color = foregroundColor ?? titleStyle?.color;
    if (color != null) return MaterialStatePropertyAll(color);
    return null;
  }
}
