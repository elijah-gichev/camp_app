import 'dart:convert';

import 'package:camp_app/money/services/payment_service.dart';

class QRCodeParser {
  static PaymentArgument parse(String code) {
    print(code);
    final res = PaymentArgument.fromJson(code);
    return res;
  }
}
