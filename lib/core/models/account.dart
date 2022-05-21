import 'dart:convert';

import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/models/shop.dart';
import 'package:camp_app/core/models/user.dart';
import 'package:camp_app/money/bloc/day_expenses.dart';

class Account {
  final User owner;
  final List<DayExpenses> expenses;
  final List<Operation> operations;

  Account(
    this.owner,
    this.expenses,
    this.operations,
  );

  Account copyWith({
    User? owner,
    List<DayExpenses>? expenses,
    List<Operation>? operations,
  }) {
    return Account(
      owner ?? this.owner,
      expenses ?? this.expenses,
      operations ?? this.operations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': owner,
      'expenses': expenses,
      'operations': operations,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      User.fromMap(map['user']),
      List<DayExpenses>.from((map['expenses'] as List<dynamic>)
          .map((e) => DayExpenses.fromMap(e as Map<String, dynamic>))),
      List<Operation>.from((map['operations'] as List<dynamic>)
          .map((e) => Operation.fromMap(e as Map<String, dynamic>))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(Map<String, dynamic> source) =>
      Account.fromMap(source);

}
