import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({
    super.key,
    this.title,
  });

  /// Empty title
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_box_outline_blank, size: 40),
            if (title != null) ...[
              Text(
                title!,
                style: Get.textTheme.bodyLarge,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
