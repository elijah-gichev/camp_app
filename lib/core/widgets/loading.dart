import 'package:camp_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loading() {
  return const SpinKitWave(
    color: AppColors.mainColor,
    size: 20.0,
  );
}