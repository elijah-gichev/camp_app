import 'package:flutter/foundation.dart';

@immutable
abstract class MoneyEvent {}

class MoneyDataLoadRequested extends MoneyEvent {}

class MoneyPayPressed extends MoneyEvent {}