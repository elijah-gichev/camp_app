import 'package:camp_app/core/models/operation.dart';

class DayEntry {
  DateTime date;
  final List<Operation> operations;

  DayEntry(this.date, this.operations);
}