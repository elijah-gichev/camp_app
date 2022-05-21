part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class UpdateEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class RemoveEvent extends CartEvent {
  final String itemID;

  const RemoveEvent({required this.itemID});

  @override
  List<Object> get props => [itemID];
}

class AddEvent extends CartEvent {
  final String itemID;

  const AddEvent({required this.itemID});

  @override
  List<Object> get props => [itemID];
}

class DecrementEvent extends CartEvent {
  final String itemID;

  const DecrementEvent({required this.itemID});

  @override
  List<Object> get props => throw UnimplementedError();
}

class CloseCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class CheckoutEvent extends CartEvent {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class CorrectData extends CartEvent {
  const CorrectData();

  @override
  List<Object> get props => throw UnimplementedError();
}

// class AfterGeoCheckout extends CartEvent {
//   final Order order;

//   const AfterGeoCheckout({this.order});

//   @override
//   List<Object> get props => [order];
// }

// class FinalCheck extends CartEvent {
//   final Order order;

//   const FinalCheck(this.order);

//   @override
//   List<Object> get props => [order];
// }

class ToChat extends CartEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class Start extends CartEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class ExitCart extends CartEvent {
  @override
  List<Object> get props => [];
}
