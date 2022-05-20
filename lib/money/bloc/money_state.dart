import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class MoneyState {}

class MoneyInitial extends MoneyState {}

class MoneyLoadInProgress extends MoneyState {}

class MoneyLoadSuccess extends MoneyState {
  final List<DayEntry> dayEntries;
  final double balance;

  MoneyLoadSuccess({required this.dayEntries, required this.balance});
}

class MoneyLoadError extends MoneyState {
  final Exception error;

  MoneyLoadError(this.error);
}

class MoneyNavToPay extends MoneyState {}
