import 'package:camp_app/core/models/operation.dart';
import 'package:camp_app/core/services/dio_service.dart';
import 'package:dio/dio.dart';

class OperationService {
  final DioService dioService;

  OperationService(
    this.dioService,
  );

  Future<List<Operation>> getUserOperations({
    required int userId,
  }) async {
    try {
      final operationsRaw = await dioService.client.post(
        '/operations',
        data: {
          'user_id': userId,
        },
      );

      final operations = List<Operation>.from(
        operationsRaw.data.map(
          (content) => Operation.fromJson(content),
        ),
      );

      return operations;
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
        operationsRaw.data.map(
          (content) => Operation.fromJson(content),
        ),
      );

      return operations;
    } on DioError catch (e) {
      throw Exception('Что-то пошло не так!');
    }
  }
}
