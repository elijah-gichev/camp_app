import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:camp_app/core/services/dio_service.dart';

class PaymentService {
  final DioService dioService;

  PaymentService(
    this.dioService,
  );

  Future<void> pay({
    required int sellerId,
    required double sum,
  }) async {
    try {
      await dioService.client.post(
        '/product/buy',
        data: {'seller_id': sellerId, 'sum': sum},
      );
    } on DioError catch (e) {
      if (e.response!.statusCode == 403) {
        throw NotEnoughtMoney('Недостаточно денег!');
      }

      throw OtherMoneyException('Что-то пошло не так!');
    }
  }
}

class PaymentException implements Exception {
  final String msg;
  PaymentException(this.msg);
}

class NotEnoughtMoney extends PaymentException {
  NotEnoughtMoney(String msg) : super(msg);
}

class OtherMoneyException extends PaymentException {
  OtherMoneyException(String msg) : super(msg);
}

class PaymentArgument {
  final int sellerId;
  final double sum;

  PaymentArgument({
    required this.sellerId,
    required this.sum,
  });

  PaymentArgument copyWith({
    int? sellerId,
    double? sum,
  }) {
    return PaymentArgument(
      sellerId: sellerId ?? this.sellerId,
      sum: sum ?? this.sum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'seller_id': sellerId,
      'sum': sum,
    };
  }

  factory PaymentArgument.fromMap(Map<String, dynamic> map) {
    return PaymentArgument(
      sellerId: map['seller_id']?.toInt() ?? 0,
      sum: map['sum']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentArgument.fromJson(String source) => PaymentArgument.fromMap(json.decode(source));

  @override
  String toString() => 'PaymentArgument(sellerId: $sellerId, sum: $sum)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentArgument && other.sellerId == sellerId && other.sum == sum;
  }

  @override
  int get hashCode => sellerId.hashCode ^ sum.hashCode;
}
