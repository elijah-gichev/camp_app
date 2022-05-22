import 'package:camp_app/core/services/dio_service.dart';

class BoomService {
  final DioService dioService;

  BoomService(this.dioService);

  Future<void> postShake(double longitude, double latitude) async {
    try {
      await dioService.client.post(
        '/child/coordinates',
        data: {'longitude': longitude, 'latitude': latitude},
      );
    } catch (e) {
      throw Exception('Что-то пошло не так!');
    }
  }
}
