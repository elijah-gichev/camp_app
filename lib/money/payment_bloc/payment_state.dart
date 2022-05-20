part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentDone extends PaymentState {}

class PaymentAreYouSure extends PaymentState {
  final double sum;

  PaymentAreYouSure(this.sum);
}

class PaymentCancellation extends PaymentState {}

class PaymentFailure extends PaymentState {
  final String msg;
  PaymentFailure(this.msg);
}
