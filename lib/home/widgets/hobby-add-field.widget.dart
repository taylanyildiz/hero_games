import 'package:flutter/material.dart';
import '/core/widgets/widgets.dart';

class AddHobbyField extends TextOutlinedField {
  AddHobbyField({
    super.key,
    required super.controller,
    required this.onAdd,
    super.validator,
    super.focusNode,
  });

  /// Add hobby button click
  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: super.build(context)),
        const SizedBox(width: 3.0),
        PrimaryButton(
          height: 47.0,
          onPressed: onAdd,
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}
