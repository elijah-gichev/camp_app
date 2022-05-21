part of 'data_loading_cubit.dart';

abstract class OperationLoadingState extends Equatable {
  const OperationLoadingState();

  @override
  List<Object> get props => [];
}

class DataLoadingInitial extends OperationLoadingState {}

class DataLoadingInProgress extends OperationLoadingState {}

class DataLoadingFailure extends OperationLoadingState {
  final String msg;
  const DataLoadingFailure(
    this.msg,
  );
}

class DataLoadingDone extends OperationLoadingState {
  final List<DayEntry> entries;

  const DataLoadingDone(this.entries);
  @override
  List<Object> get props => [entries];
}
