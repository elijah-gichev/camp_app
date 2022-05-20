import 'dart:math';
import 'package:camp_app/core/enums/role.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/models/shop.dart';
import 'package:camp_app/core/models/user.dart';
import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:camp_app/money/bloc/money_event.dart';
import 'package:camp_app/money/bloc/money_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  MoneyBloc() : super(MoneyInitial()) {
    on<MoneyDataLoadRequested>((event, emit) async {
      await _loadData(emit);
    });
    on<MoneyPayPressed>((event, emit) async {
      emit(MoneyNavToPay());
    });
  }

  Future<void> _loadData(Emitter<MoneyState> emit) async {
    try {
      emit(MoneyLoadInProgress());
      final testUser = User(
        id: 0,
        name: "имя",
        email: "имейл",
        phone: "89458578467",
        role: Role.child,
        cash: 10000,
      );
      final operations = [
        Operation(
            0, -100, DateTime.now(), testUser, Shop("пятерочка", "продукты")),
        Operation(
            0, 100, DateTime.now(), testUser, Shop("пятерочка", "продукты")),
        Operation(
            0, -100, DateTime.now(), testUser, Shop("пятерочка", "продукты")),
        Operation(
            0, -100, DateTime.now(), testUser, Shop("пятерочка", "продукты")),
      ];
      emit(MoneyLoadSuccess(
        dayEntries: _convertToDayEntries(operations),
        balance: operations.first.buyer.cash,
      ));
    } on Exception catch (error) {
      emit(MoneyLoadError(error));
    }
  }

  List<DayEntry> _convertToDayEntries(List<Operation> operations) {
    final List<DayEntry> days = [];
    groupBy(operations.sortedBy((Operation o) => o.created_at).reversed,
        (Operation o) {
      return DateFormat('yyyyMMdd').format(o.created_at);
    }).forEach((key, value) {
      days.add(DayEntry(DateTime.parse(key), value));
    });
    return days;
  }

}
