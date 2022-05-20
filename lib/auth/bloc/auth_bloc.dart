import 'package:bloc/bloc.dart';
import 'package:camp_app/auth/service/auth_service.dart';
import 'package:camp_app/core/models/user.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:camp_app/core/services/local_user_service.dart';
import 'package:camp_app/core/services/user_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;
  final UserService userService;
  final DioService dioService;
  final LocalUserService localUserService;

  AuthBloc({
    required this.authService,
    required this.userService,
    required this.dioService,
    required this.localUserService,
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
        localUserService.saveLocalUser(resUser);

        emit(AuthLoadingDone(resUser));
      } on AuthException catch (e) {
        print(event.phone);
        emit(AuthLoadingFailure(e.msg));
      }
    });

    on<AuthCheckIsLogged>((event, emit) async {
      if (userService.hasUser) {
        print('logged');
        emit(AuthAlreadyLogged());
      }
      print('not logged');
    });
  }
}
