import 'package:camp_app/core/widgets/main_button.dart';
import 'package:camp_app/kid/main/ui/kid_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChildrenPaymentDialog extends StatelessWidget {
  const ChildrenPaymentDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      content: SizedBox(
        height: 380.h,
        width: 200.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Icon(
              Icons.currency_ruble,
              size: 120.r,
              color: KidTheme.of(context).buttonTextColor,
            ),
            Text(
              'Согласны ли вы купить?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: KidTheme.of(context).buttonTextColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 200.w,
              child: MainButton(
                linearGradient: LinearGradient(
                  colors: [
                    KidTheme.of(context).buttonColor,
                    KidTheme.of(context).buttonColor,
                  ],
                ),
                minimumSize: Size(double.infinity, 65.h),
                textColor: KidTheme.of(context).buttonTextColor,
                text: 'Купить',
                fontSize: 20.sp,
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ),
            Spacer(),
            SizedBox(
              width: 200.w,
              child: MainButton(
                textColor: KidTheme.of(context).buttonTextColor,
                linearGradient: LinearGradient(
                  colors: [
                    KidTheme.of(context).buttonColor,
                    KidTheme.of(context).buttonColor,
                  ],
                ),
                minimumSize: Size(double.infinity, 65.h),
                text: 'Отменить',
                fontSize: 20.sp,
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
