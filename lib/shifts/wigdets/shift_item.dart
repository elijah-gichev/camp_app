import 'package:camp_app/core/constants/routes.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:camp_app/core/widgets/button.dart';
import 'package:camp_app/main.dart';
import 'package:camp_app/shifts/models/shift.dart';
import 'package:camp_app/shifts/wigdets/child_activity.dart';
import 'package:camp_app/shifts/wigdets/operation_view_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShiftItem extends StatelessWidget {
  final Shift shift;
  ShiftItem(this.shift, {Key? key}) : super(key: key);

  final items = <Widget>[
    OperationViewWrapper(
      operation: Operation.sample(
        getIt<UserService>().user!,
      ),
    ),
    const ChildActivity(
      activityName: 'Квадроцикл',
      userName: 'Андрей',
    ),
    OperationViewWrapper(
      operation: Operation.sample(
        getIt<UserService>().user!,
      ),
    ),
    const ChildActivity(
      activityName: 'Бассейн',
      userName: 'Катя',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    items.shuffle();

    return Container(
      //height: 350.h,
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
              if (shift.isCurrent)
                Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: const Text(
                    'Сейчас идёт',
                    style: TextStyle(
                      color: Color(0xffE6492D),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
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
              items[0],
              SizedBox(
                height: 16.h,
              ),
              items[1],
              SizedBox(height: 16.h),
              items[2],
              SizedBox(height: 16.h),
              Container(
                width: 0.95.sw,
                height: 45.h,
                child: Button(
                  text: 'Смотреть всю активность',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.shift,
                      arguments: shift,
                    );
                  },
                  bgColor: const Color(0xffEDEFFF),
                  textColor: const Color(0xff4D5DFA),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
