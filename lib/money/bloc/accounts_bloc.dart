import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/money/bloc/accounts_event.dart';
import 'package:camp_app/money/bloc/accounts_state.dart';
import 'package:camp_app/money/bloc/money_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/account_service.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final AccountService accountService;
  final UserService userService;

  AccountsBloc(this.accountService, this.userService)
      : super(AccountsInitial()) {
    on<AccountsDataLoadRequested>((event, emit) async {
      await _loadData(emit);
    });
  }

  Future<void> _loadData(Emitter<AccountsState> emit) async {
    try {
      emit(AccountsLoadInProgress());
      final accounts =
          await accountService.getChildren(userId: userService.user!.id);
      emit(AccountsLoadSuccess(accounts: accounts));
    } on Exception catch (error) {
      emit(AccountsLoadError(error));
    }
  }
}
