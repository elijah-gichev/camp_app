import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/shifts/models/activity.dart';

class DayEntry {
  DateTime date;
  final List<Operation> operations;

  final List<Activity>? activities;

  DayEntry(
    this.date,
    this.operations, {
    this.activities,
  });
}
