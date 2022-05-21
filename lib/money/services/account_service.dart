import 'package:camp_app/core/models/account.dart';
import 'package:camp_app/core/models/user.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:dio/dio.dart';

class AccountService {
  final DioService dioService;

  AccountService(this.dioService);

  Future<List<User>> getChildren({
    required int userId,
  }) async {
    try {
      final response = await dioService.client.post(
        '/child/list',
        data: {
          'parent_id': userId,
        },
      );

      return List<User>.from(response.data.map((s) => User.fromMap(s)));
    } on DioError catch (e) {
      throw Exception('Что-то пошло не так!');
    }
  }
}
