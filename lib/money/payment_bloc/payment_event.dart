part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class PaymentInProgress extends PaymentEvent {
  final String code;
  PaymentInProgress(this.code);
}

class PaymentConfirmed extends PaymentEvent {
  // final String code;
  //const PaymentСonfirmed();
}

class PaymentNotConfirmed extends PaymentEvent {
  // final String code;
  //const PaymentСonfirmed();
}
