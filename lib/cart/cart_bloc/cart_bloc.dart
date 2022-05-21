import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_states.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(LoadingState(title: "Загружаем вашу корзину")) {
    on<UpdateEvent>((event, emit) async {});
  }
}
