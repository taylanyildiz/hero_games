import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hero_game/core/extension/extension.dart';
import '/core/models/hobby.model.dart';

class HobbyListItem extends StatefulWidget {
  const HobbyListItem({
    super.key,
    required this.hobby,
  });

  /// Hobby
  final Hobby hobby;

  @override
  State<HobbyListItem> createState() => _HobbyListItemState();
}

class _HobbyListItemState extends State<HobbyListItem> {
  /// Hobby
  late Hobby hobby;

  /// mark newly created hobbies
  /// for 2 seconds
  bool isNew = false;

  /// Timer
  Timer? timer;

  @override
  void initState() {
    hobby = widget.hobby;
    _setTimer();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HobbyListItem oldWidget) {
    if (oldWidget.hobby != widget.hobby) {
      hobby = widget.hobby;
      if (mounted) _setTimer();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _setTimer() {
    if (hobby.date == null) return;
    setState(() => isNew = !hobby.date.biggerThanSec(5));
    if (!isNew) {
      timer?.cancel();
      timer = null;
      return;
    }
    timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 5) {
        timer.cancel();
        this.timer = null;
        setState(() => isNew = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isNew ? Colors.blue.withOpacity(.3) : null,
      child: ListTile(
        title: Text(widget.hobby.name ?? ""),
      ),
    );
  }
}
