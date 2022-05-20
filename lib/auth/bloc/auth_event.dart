part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthInProgress extends AuthEvent {
  final String phone;

  AuthInProgress({
    required this.phone,
  });
}
