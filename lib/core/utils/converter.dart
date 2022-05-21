import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

List<DayEntry> convertToDayEntries(List<Operation> operations) {
  final List<DayEntry> days = [];
  groupBy(operations.sortedBy((Operation o) => o.created_at).reversed, (Operation o) {
    return DateFormat('yyyyMMdd').format(o.created_at);
  }).forEach((key, value) {
    days.add(DayEntry(DateTime.parse(key), value));
  });
  return days;
}
