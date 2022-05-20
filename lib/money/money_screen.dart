import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:camp_app/core/constants/app_strings.dart';
import 'package:camp_app/core/utils/format.dart';
import 'package:camp_app/core/widgets/two_rows_toolbar.dart';
import 'package:camp_app/money/widgets/day_of_operations_item.dart';
import 'package:camp_app/core/widgets/loading.dart';
import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:camp_app/money/bloc/money_bloc.dart';
import 'package:camp_app/money/bloc/money_event.dart';
import 'package:camp_app/money/bloc/money_state.dart';
import 'package:camp_app/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoneyScreen extends StatefulWidget {
  const MoneyScreen({Key? key}) : super(key: key);

  @override
  State<MoneyScreen> createState() => _MoneyScreenState();
}

class _MoneyScreenState extends State<MoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoneyBloc()..add(MoneyDataLoadRequested()),
      child: BlocConsumer<MoneyBloc, MoneyState>(
        listener: (context, state) {
          if (state is MoneyNavToPay) {
            _navigateToPay(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                TwoRowsToolbar(balance: _getBalance(state)),
                const Expanded(child: MoneyBody()),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.qr_code),
              onPressed: () {
                context.read<MoneyBloc>().add(MoneyPayPressed());
              },
            ),
          );
        },
      ),
    );
  }

  void _navigateToPay(BuildContext context) {
    Navigator.pushNamed(context, Routes.qrScanner).then(
        (value) => context.read<MoneyBloc>().add(MoneyDataLoadRequested()));
  }

  double _getBalance(MoneyState state) {
    if (state is MoneyLoadSuccess) {
      return state.balance;
    }
    return .0;
  }
}

class MoneyBody extends StatelessWidget {
  const MoneyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 20,
      onRefresh: () async {
        context.read<MoneyBloc>().add(MoneyDataLoadRequested());
      },
      child: BlocBuilder<MoneyBloc, MoneyState>(
        builder: (context, state) {
          if (state is MoneyLoadInProgress) {
            return loading();
          } else if (state is MoneyLoadSuccess) {
            return MoneyContent(dayEntries: state.dayEntries);
          }
          return Container();
        },
      ),
    );
  }
}

class MoneyContent extends StatelessWidget {
  final List<DayEntry> dayEntries;

  const MoneyContent({
    Key? key,
    required this.dayEntries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 86),
            itemCount: dayEntries.length,
            itemBuilder: (context, index) => DayOfOperationsItem(
              dayEntry: dayEntries[index],
            ),
          ),
        ),
      ],
    );
  }
}

class MoneySummary extends StatelessWidget {
  final double balance;

  const MoneySummary({Key? key, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(AppStrings.balance),
                Text(
                  balance.formatMoney(),
                  style: AppFonts.semibold.copyWith(fontSize: 32),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
