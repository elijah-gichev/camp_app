import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleBlock extends StatelessWidget {
  const TitleBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Мой заказ',
          style: TextStyle(
            fontSize: 32.h,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'кол-во товаров',
          style: TextStyle(
            fontSize: 18.h,
          ),
        ),
      ],
    );
  }
}
