import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:camp_app/core/utils/date.dart';
import 'package:camp_app/money/bloc/day_entry.dart';
import 'package:camp_app/money/widgets/operation_view.dart';
import 'package:flutter/material.dart';

class DayOfOperationsItem extends StatelessWidget {
  const DayOfOperationsItem({Key? key, required this.dayEntry})
      : super(key: key);

  final DayEntry dayEntry;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      shadowColor: const Color(0x33000000),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dayEntry.date.formatDate(),
              style: AppFonts.bold.copyWith(fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dayEntry.operations.length,
                  itemBuilder: (c, i) =>
                      OperationView(operation: dayEntry.operations[i]),
                  separatorBuilder: (c, i) => divider,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const Divider divider = Divider(
    height: 24,
    thickness: .5,
    color: Color(0xFFEFEFEF),
  );
}
