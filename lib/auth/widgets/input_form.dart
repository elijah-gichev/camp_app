import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputForm extends StatelessWidget {
  const InputForm({Key? key, required this.title, required this.textField})
      : super(key: key);

  final String title;
  final Widget textField;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          height: 59.h,
          child: textField,
          decoration:  BoxDecoration(
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
        ),

      ],
    );
  }
}
