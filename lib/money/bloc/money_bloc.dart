import 'dart:async';

import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/core/utils/converter.dart';
import 'package:camp_app/money/bloc/money_event.dart';
import 'package:camp_app/money/bloc/money_state.dart';
import 'package:camp_app/money/services/operation_service.dart';
import 'package:collection/collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  final OperationService operationService;
  final int childId;

  late final StreamSubscription<DatabaseEvent> subs;

  DatabaseReference childOperationEventsRef = FirebaseDatabase.instance.ref("/childOperationEvents");


  MoneyBloc({required this.operationService, required this.childId}) : super(MoneyInitial()) {
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
      final account = await operationService.getUserAccount(userId: childId);

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
        dayEntries: convertToDayEntries(account.operations),
        user: account.owner,
      ));
    } on Exception catch (error) {
      if (!isInBackground) {
        emit(MoneyLoadError(error));
      }
    }
  }

  @override
  Future<void> close() {
    subs.cancel();
    return super.close();
  }
}
