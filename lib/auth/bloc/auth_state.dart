part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingDone extends AuthState {
  final User user;

  AuthLoadingDone(this.user);

  @override
  String toString() => 'AuthLoadingDone(user: $user)';

  @override
  List<Object?> get props => [];
}

class AuthLoadingFailure extends AuthState {
  final String msg;
  AuthLoadingFailure(
    this.msg,
  );

  @override
  List<Object?> get props => [msg];
}

class AuthAlreadyLogged extends AuthState {
  final User user;

  AuthAlreadyLogged(this.user);

  @override
  List<Object?> get props => [user];
}
