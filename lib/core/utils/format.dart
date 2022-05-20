import 'dart:ui';
import 'package:camp_app/core/constants/app_colors.dart';
import 'package:intl/intl.dart';

extension DoubleMoneyFormatter on double {
  String formatMoney({String currency = "₽"}) {
    final moneyFormat = NumberFormat("#,##0$currency", "en_US");
    return moneyFormat.format(this);
  }

  String formatPercentDifference() {
    var s = '';
    if (this > .0) {
      s += '+';
    }
    final format = NumberFormat("#.##", "en_US");
    s += format.format(this) + '%';
    return s;
  }

  Color priceColor() {
    if(this > 0) {
      return AppColors.green;
    } else if(this == 0) {
      return AppColors.darkBlue;
    } else {
      return AppColors.red;
    }
  }
}

extension IntMoneyFormatter on int {
  String formatMoney() {
    final moneyFormat = NumberFormat("#,##0₽", "en_US");
    return moneyFormat.format(this);
  }
}