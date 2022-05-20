import 'package:bloc/bloc.dart';
import 'package:camp_app/auth/service/auth_service.dart';
import 'package:camp_app/core/models/user.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  final UserService userService;

  AuthBloc({
    required this.authService,
    required this.userService,
  }) : super(AuthInitial()) {
    on<AuthInProgress>((event, emit) async {
      try {
        emit(AuthLoading());

        final phone = event.phone;
        final resUser = await authService.login(phone: phone);

        userService.createUser(resUser);

        emit(AuthLoadingDone(resUser));
      } catch (e) {
        const msg = 'Что-то пошло не так!';
        emit(AuthLoadingFailure(msg));
      }
    });
  }
}
