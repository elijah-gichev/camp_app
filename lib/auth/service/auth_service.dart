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

class MyException implements Exception {
  final String msg;
  MyException(this.msg);
}

class UserNotFoundException extends MyException {
  UserNotFoundException(String msg) : super(msg);
}

class OtherException extends MyException {
  OtherException(String msg) : super(msg);
}
