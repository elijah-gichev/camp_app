import 'dart:async';

import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:camp_app/money/bloc/money_event.dart';
import 'package:camp_app/money/bloc/money_state.dart';
import 'package:camp_app/money/services/operation_service.dart';
import 'package:collection/collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  final OperationService operationService;
  final UserService userService;

  late final StreamSubscription<DatabaseEvent> subs;

  DatabaseReference childOperationEventsRef = FirebaseDatabase.instance.ref("/childOperationEvents");

  int childId = 0;

  MoneyBloc({required this.operationService, required this.userService}) : super(MoneyInitial()) {
    on<MoneyDataLoadRequested>((event, emit) async {
      await _loadData(emit, event.isInBackground);
    });
    on<MoneyPayPressed>((event, emit) async {
      emit(MoneyNavToPay());
    });
    subs = childOperationEventsRef.limitToLast(1).onChildAdded.listen((DatabaseEvent event) async {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      if (childId == data['childId'] as int) {
        add(MoneyDataLoadRequested(isInBackground: true));
      }
    });
  }

  Future<void> _loadData(Emitter<MoneyState> emit, bool isInBackground) async {
    try {
      if (!isInBackground) {
        emit(MoneyLoadInProgress());
      }
      final account = await operationService.getUserAccount(userId: userService.user!.id);

      if (state is MoneyLoadSuccess && isInBackground) {
        final oldOperations = (state as MoneyLoadSuccess).dayEntries.map((e) => e.operations).flattened;
        for (var element in account.operations) {
          if (!oldOperations.map((e) => e.id).contains(element.id)) {
            element.showAppearAnim = true;
          }
        }
      }

      emit(MoneyLoadSuccess(
        expenses: account.expenses,
        dayEntries: _convertToDayEntries(account.operations),
        balance: account.owner.cash,
      ));

      childId = account.owner.id;
    } on Exception catch (error) {
      if (!isInBackground) {
        emit(MoneyLoadError(error));
      }
    }
  }

  List<DayEntry> _convertToDayEntries(List<Operation> operations) {
    final List<DayEntry> days = [];
    groupBy(operations.sortedBy((Operation o) => o.created_at).reversed, (Operation o) {
      return DateFormat('yyyyMMdd').format(o.created_at);
    }).forEach((key, value) {
      days.add(DayEntry(DateTime.parse(key), value));
    });
    return days;
  }

  @override
  Future<void> close() {
    subs.cancel();
    return super.close();
  }
}
