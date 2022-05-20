import 'package:bloc/bloc.dart';
import 'package:camp_app/auth/service/auth_service.dart';
import 'package:camp_app/core/models/user.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  final UserService userService;
  final DioService dioService;

  AuthBloc({
    required this.authService,
    required this.userService,
    required this.dioService,
  }) : super(AuthInitial()) {
    on<AuthInProgress>((event, emit) async {
      try {
        emit(AuthLoading());

        final phone = event.phone;
        final resUser = await authService.login(phone: phone).timeout(
              const Duration(seconds: 5),
            );

        userService.createUser(resUser);
        dioService.addIdInterceptor(resUser.id);

        emit(AuthLoadingDone(resUser));
      } on MyException catch (e) {
        print(event.phone);
        emit(AuthLoadingFailure(e.msg));
      }
    });
  }
}
