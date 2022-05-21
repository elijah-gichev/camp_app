import 'package:bloc/bloc.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/utils/converter.dart';
import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:camp_app/money/services/operation_service.dart';
import 'package:equatable/equatable.dart';

part 'data_loading_state.dart';

class OperationLoadingCubit extends Cubit<OperationLoadingState> {
  final OperationService operationService;
  OperationLoadingCubit(this.operationService) : super(DataLoadingInitial());

  void loadData(int parentId, List<Operation> additionalOperations) async {
    try {
      emit(DataLoadingInProgress());

      final opers = await operationService.getParentChildrenOperations(parentId: parentId);

      final entries = convertToDayEntries([...opers, ...additionalOperations]);

      emit(DataLoadingDone(entries));
    } catch (e) {
      emit(const DataLoadingFailure('Что-то пошло не так!'));
    }
  }
}
