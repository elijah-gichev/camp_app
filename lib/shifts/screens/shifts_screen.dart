import 'package:camp_app/core/widgets/appbar.dart';
import 'package:camp_app/shifts/models/shift.dart';
import 'package:camp_app/shifts/wigdets/shift_item.dart';

import 'package:flutter/material.dart';

class ShiftsScreen extends StatefulWidget {
  const ShiftsScreen({Key? key}) : super(key: key);

  @override
  State<ShiftsScreen> createState() => _ShiftsScreenState();
}

class _ShiftsScreenState extends State<ShiftsScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      scrollController.animateTo(200, duration: const Duration(seconds: 1), curve: Curves.easeInOutCubic);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const CampAppBar(
            text: 'Список смен',
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  ShiftItem(
                    Shift(
                      isCurrent: false,
                      title: '2 Смена 2022',
                      allDate: 'Заезд 20-30 июня',
                    ),
                  ),
                  ShiftItem(
                    Shift(
                      isCurrent: true,
                      title: '1 Смена 2022',
                      allDate: 'Заезд 20 мая-3 июня',
                    ),
                  ),
                  ShiftItem(
                    Shift(
                      isCurrent: false,
                      title: '3 Смена 2022',
                      allDate: 'Заезд 1-14 июля',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
