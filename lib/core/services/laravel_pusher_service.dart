import 'package:camp_app/core/services/dio_service.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';

class LaravelPusherService {
  late final LaravelFlutterPusher pusher;

  final options = PusherOptions(
    host: 'https://camp-app-hackathon.herokuapp.com',
    cluster: 'eu',
  );

  final _key = '96eea42a52ac0c1ea55f';

  LaravelPusherService() {
    pusher = LaravelFlutterPusher(
      _key,
      options,
      enableLogging: true,
    );

    pusher.subscribe('chat').bind(
          'MessageSent',
          (event) => print(
            'my-event =>' + event.toString(),
          ),
        );
  }
}
