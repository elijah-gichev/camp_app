import 'package:camp_app/core/constants/app_colors.dart';
import 'package:camp_app/core/constants/app_fonts.dart';
import 'package:camp_app/core/constants/app_strings.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/core/widgets/appbar.dart';
import 'package:camp_app/main.dart';
import 'package:camp_app/money/widgets/operation_view.dart';
import 'package:camp_app/shifts/models/shift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ShiftsScreen extends StatelessWidget {
  const ShiftsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CampAppBar(
            text: 'Список смен',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShiftItem(
                    Shift(
                      isCurrent: true,
                      title: '1 Смена 2022',
                      allDate: 'Заезд 1-3 июня',
                    ),
                  ),
                  ShiftItem(
                    Shift(
                      isCurrent: true,
                      title: '1 Смена 2022',
                      allDate: 'Заезд 1-3 июня',
                    ),
                  ),
                  ShiftItem(
                    Shift(
                      isCurrent: true,
                      title: '1 Смена 2022',
                      allDate: 'Заезд 1-3 июня',
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

class ShiftItem extends StatelessWidget {
  final Shift shift;
  const ShiftItem(this.shift, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: 0.95.sw,
      child: Card(
        margin: const EdgeInsets.only(top: 4, bottom: 4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        shadowColor: Color(0x33000000),
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SizedBox(height: 10.h),
              if (shift.isCurrent)
                const Text(
                  'Сейчас идёт',
                  style: TextStyle(
                    color: Color(0xffE6492D),
                    fontSize: 15,
                  ),
                ),
              SizedBox(height: 8.h),
              Text(
                shift.title,
                style: TextStyle(
                  fontSize: 28.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Text(
                  shift.allDate,
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              OperationViewWrapper(
                  operation: Operation.sample(
                getIt<UserService>().user!,
              )),
              SizedBox(
                height: 16.h,
              ),
              OperationViewWrapper(
                  operation: Operation.sample(
                getIt<UserService>().user!,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class OperationViewWrapper extends StatelessWidget {
  final Operation operation;

  const OperationViewWrapper({Key? key, required this.operation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffFFECEB),
        borderRadius: BorderRadius.circular(16.0.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(70, 70, 70, 0.1),
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
            //offset: Offset(0, 0),
          ),
        ],
      ),
      height: 70.h,
      width: 0.95.sw,
      child: Center(
        child: OperationView(
          operation: operation,
        ),
      ),
    );
  }
}
