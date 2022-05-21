import 'package:flutter/foundation.dart';

@immutable
abstract class MoneyEvent {}

class MoneyDataLoadRequested extends MoneyEvent {
  final bool isInBackground;

  MoneyDataLoadRequested({this.isInBackground = false});
}

class MoneyPayPressed extends MoneyEvent {}