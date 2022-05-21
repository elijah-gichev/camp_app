part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

// class CartEditingState extends CartState {
//   final bool dataGet;
//   final BlocKey key;
//   final bool exit;
//   CartEditingState(this.key, {this.dataGet = false, this.exit = false});

//   @override
//   List<Object> get props => [dataGet, key];
// }

// class GeolocationDisableState extends CartState {
//   final bool dataGet;
//   final BlocKey key;
//   GeolocationDisableState(this.key, {this.dataGet = false});

//   @override
//   List<Object> get props => [dataGet, key];
// }

// // ignore: must_be_immutable
class LoadingState extends CartState {
  String title;

  LoadingState({required this.title});

  @override
  List<Object> get props => [title];
}

// class CheckoutState extends CartState {
//   @override
//   List<Object> get props => [];
// }

// class CloseState extends CartState {
//   @override
//   List<Object> get props => [];
// }

// class AfterGeoCheckoutState extends CartState {
//   final Order order;

//   AfterGeoCheckoutState({this.order});

//   @override
//   List<Object> get props => [order];
// }

// class LastQuestion extends CartState {
//   final Order order;

//   LastQuestion({this.order});
//   @override
//   List<Object> get props => [order];
// }
