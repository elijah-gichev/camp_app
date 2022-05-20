import 'package:camp_app/core/models/user.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:dio/dio.dart';

class AuthService {
  final DioService dioService;

  AuthService(
    this.dioService,
  );

  Future<User> login({
    required String phone,
  }) async {
    try {
      var res = await dioService.client.post(
        '/auth/login',
        data: {
          "phone": phone,
        },
      );

      Map<String, dynamic> body = (res.data as Map<String, dynamic>);

      final user = User.fromMap(body);

      return user;
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        throw UserNotFoundException('Данный пользователь не найден!');
      }

      throw OtherException('Что-то пошло не так!');
    }
  }
}

class AuthException implements Exception {
  final String msg;
  AuthException(this.msg);
}

class UserNotFoundException extends AuthException {
  UserNotFoundException(String msg) : super(msg);
}

class OtherException extends AuthException {
  OtherException(String msg) : super(msg);
}
