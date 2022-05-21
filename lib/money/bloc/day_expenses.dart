import 'dart:convert';

class DayExpenses {
  final DateTime date;
  final double expenses;

  DayExpenses(this.date, this.expenses);

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch / 1000,
      'expense': expenses,
    };
  }

  factory DayExpenses.fromMap(Map<String, dynamic> map) {
    return DayExpenses(
      DateTime.fromMillisecondsSinceEpoch(map['date'] * 1000),
      map['expense']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DayExpenses.fromJson(Map<String, dynamic> source) =>
      DayExpenses.fromMap(source);
}
