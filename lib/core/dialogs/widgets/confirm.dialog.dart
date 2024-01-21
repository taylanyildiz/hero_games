import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.description,
  });

  /// Dialog title
  final String title;

  /// Dialog description
  final String description;

  Widget adaptiveAction({required BuildContext context, required VoidCallback onPressed, required Widget child}) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(description),
      actions: [
        adaptiveAction(
          context: context,
          onPressed: () => Get.back(result: false),
          child: Text(TranslateHelper.cancel),
        ),
        adaptiveAction(
          context: context,
          onPressed: () => Get.back(result: true),
          child: Text(TranslateHelper.ok),
        ),
      ],
    );
  }
}
