import 'package:camp_app/core/models/account.dart';
import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:dio/dio.dart';

class OperationService {
  final DioService dioService;

  OperationService(
    this.dioService,
  );

  Future<Account> getUserAccount({
    required int userId,
  }) async {
    try {
      final response = await dioService.client.post(
        '/operations',
        data: {
          'user_id': userId,
        },
      );

      return Account.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Что-то пошло не так!');
    }
  }

  Future<List<Operation>> getParentChildrenOperations({
    required int parentId,
  }) async {
    try {
      final operationsRaw = await dioService.client.post(
        '/operations',
        data: {
          'parent_id': parentId,
        },
      );

      final operations = List<Operation>.from(
        operationsRaw.data['operations'].map(
          (content) => Operation.fromJson(content),
        ),
      );

      return operations;
    } on DioError catch (e) {
      throw Exception('Что-то пошло не так!');
    }
  }
}
