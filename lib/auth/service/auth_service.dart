import 'package:camp_app/core/models/user.dart';
import 'package:camp_app/core/services/dio_service.dart';

class AuthService {
  final DioService dioService;

  AuthService(
    this.dioService,
  );

  final String fakePhone = '+12345678910';
  Future<User> login({
    required String phone,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    if (phone == fakePhone) {
      return User.fake();
    }

    throw UserNotFoundException('Данный пользователь не найден!');
  }
}

class UserNotFoundException implements Exception {
  final String msg;
  UserNotFoundException(this.msg);
}
