import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/widgets/widgets.dart';
import '/core/extension/extension.dart';

class ExpandableDateTimePicker extends StatefulWidget {
  ExpandableDateTimePicker({
    super.key,
    required this.label,
    required this.onChanged,
    DateTime? dateTime,
    this.minDate,
    this.maxDate,
    this.validator,
  }) : dateTime = dateTime ?? DateTime.now();

  /// Lable of picker
  final String label;

  /// Selected Date
  final DateTime dateTime;

  /// Min
  final DateTime? minDate;

  /// Max
  final DateTime? maxDate;

  /// When changed
  final Function(DateTime date) onChanged;

  /// Validator
  final String? Function(String? input)? validator;

  @override
  State<ExpandableDateTimePicker> createState() => _ExpandableDateTimePickerState();
}

class _ExpandableDateTimePickerState extends State<ExpandableDateTimePicker> {
  /// Picked date
  late DateTime date;

  /// Date Text controller
  late TextEditingController dateController;

  /// Expandable controller
  late ExpandableController controller;

  @override
  void initState() {
    controller = ExpandableController(initialExpanded: false);
    dateController = TextEditingController(text: "test");
    date = widget.dateTime;
    initDate();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExpandableDateTimePicker oldWidget) {
    if (oldWidget.dateTime != widget.dateTime) {
      WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
        date = widget.dateTime;
        initDate();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void initDate() {
    dateController.text = "${date.locale()}";
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: controller,
      theme: const ExpandableThemeData(
        hasIcon: false,
        tapHeaderToExpand: true,
        useInkWell: false,
      ),
      header: _header,
      collapsed: const SizedBox(),
      expanded: _buildDatePicker,
    );
  }

  Widget get _header {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 80.0),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label,
            style: Get.theme.inputDecorationTheme.labelStyle,
          ),
        ),
        Expanded(
          child: TextUnderlinedField(
            enabled: false,
            controller: dateController,
            suffixIcon: const Icon(Icons.calendar_month),
            constraints: const BoxConstraints(maxHeight: 35.0),
            validator: widget.validator,
          ),
        ),
      ],
    );
  }

  Widget get _buildDatePicker {
    return Container(
      height: 150.0,
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: Get.textTheme.bodySmall,
          ),
        ),
        child: CupertinoDatePicker(
          minimumDate: widget.minDate,
          maximumDate: widget.maxDate?.copyWith(hour: date.hour + 1),
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (date) {
            this.date = date.copyWith(
              hour: 0,
              minute: 0,
              microsecond: 0,
              millisecond: 0,
            );
            initDate();
            widget.onChanged.call(this.date);
          },
        ),
      ),
    );
  }
}
