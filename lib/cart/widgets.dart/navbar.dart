import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Итого:',
                style: TextStyle(
                  fontSize: 16.h,
                ),
              ),
              Text('cartBloc.order.getPrice',
                  style: TextStyle(
                    fontSize: 10.h,
                  )),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 220.w,
              height: 52.h,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.w), bottomLeft: Radius.circular(10.w)),
              ),
              child: Center(
                child: Text(
                  'Заказать',
                  style: TextStyle(
                    fontSize: 18.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
