import 'package:flutter/material.dart';
import 'package:forge_ai/core/constants/app_colors.dart';
import 'package:forge_ai/features/training/widgets/training_date_picker_content.dart';

class TrainingDatePickerSheet extends StatefulWidget {
  const TrainingDatePickerSheet({super.key, required this.initialDate});

  final DateTime initialDate;

  static Future<DateTime?> show(BuildContext context) {
    return showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      barrierColor: AppColors.textDark.withValues(alpha: 0.28),
      builder: (context) =>
          TrainingDatePickerSheet(initialDate: DateTime.now()),
    );
  }

  @override
  State<TrainingDatePickerSheet> createState() =>
      _TrainingDatePickerSheetState();
}

class _TrainingDatePickerSheetState extends State<TrainingDatePickerSheet> {
  late DateTime _selectedDate;

  static const _statuses = [
    'Upper',
    'Rest',
    'Lower',
    'Zone',
    'Full',
    'Mob',
    'Rest',
  ];
  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = _dateOnly(widget.initialDate);
  }

  @override
  Widget build(BuildContext context) {
    final status = _statusForDate(_selectedDate);

    return SafeArea(
      top: false,
      child: TrainingDatePickerContent(
        firstDate: _dateOnly(
          widget.initialDate,
        ).subtract(const Duration(days: 30)),
        lastDate: _dateOnly(widget.initialDate).add(const Duration(days: 60)),
        selectedDate: _selectedDate,
        dateLabel: _selectedDateLabel,
        status: status,
        onDateSelected: (date) => setState(() => _selectedDate = date),
        onSelectDate: () => Navigator.of(context).pop(_selectedDate),
      ),
    );
  }

  String get _selectedDateLabel {
    final month = _months[_selectedDate.month - 1];
    return '$month ${_selectedDate.day} Training';
  }

  String _statusForDate(DateTime date) {
    return _statuses[(date.weekday - 1) % _statuses.length];
  }

  DateTime _dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);
}
