part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoadingDone extends AuthState {
  final User user;

  AuthLoadingDone(this.user);
}

class AuthLoadingFailure extends AuthState {
  final String msg;
  AuthLoadingFailure(
    this.msg,
  );
}
