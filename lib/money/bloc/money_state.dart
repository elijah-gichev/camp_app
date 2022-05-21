import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:camp_app/money/bloc/day_expenses.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class MoneyState {}

class MoneyInitial extends MoneyState {}

class MoneyLoadInProgress extends MoneyState {}

class MoneyLoadSuccess extends MoneyState {
  final List<DayExpenses> expenses;
  final List<DayEntry> dayEntries;
  final double balance;

  MoneyLoadSuccess({required this.expenses, required this.dayEntries, required this.balance});
}

class MoneyLoadError extends MoneyState {
  final Exception error;

  MoneyLoadError(this.error);
}

class MoneyNavToPay extends MoneyState {}
