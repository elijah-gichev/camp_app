import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/money/widgets/operation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperationViewWrapper extends StatelessWidget {
  final Operation operation;

  const OperationViewWrapper({Key? key, required this.operation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffFFECEB),
        borderRadius: BorderRadius.circular(16.0.r),
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
