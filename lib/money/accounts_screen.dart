import 'package:camp_app/core/constants/app_strings.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/core/widgets/appbar.dart';
import 'package:camp_app/core/widgets/loading.dart';
import 'package:camp_app/core/widgets/show_snackbar.dart';
import 'package:camp_app/main.dart';
import 'package:camp_app/money/bloc/accounts_bloc.dart';
import 'package:camp_app/money/bloc/accounts_event.dart';
import 'package:camp_app/money/bloc/accounts_state.dart';
import 'package:camp_app/money/services/account_service.dart';
import 'package:camp_app/money/widgets/account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CampAppBar(text: AppStrings.myAccounts),
        Expanded(
          child: BlocProvider(
            create: (context) => AccountsBloc(
              AccountService(getIt<DioService>()),
              getIt<UserService>(),
            )..add(AccountsDataLoadRequested()),
            child: BlocConsumer<AccountsBloc, AccountsState>(
              builder: (BuildContext context, state) {
                if (state is AccountsLoadSuccess) {
                  return ListView.builder(
                      itemCount: state.accounts.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: AccountView(account: state.accounts[index]),
                          ));
                }
                return loading();
              },
              listener: (BuildContext context, Object? state) {
                if (state is AccountsLoadError) {
                  showSnackBar(
                      context: context, message: state.error.toString());
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
