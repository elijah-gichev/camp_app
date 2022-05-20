import 'package:dio/dio.dart';

class DioService {
  final Dio client;

  DioService(this.client);

  static const devBaseUrl = 'https://camp-app-hackathon.herokuapp.com';

  DioService.baseClient()
      : client = Dio(
          BaseOptions(
            baseUrl: devBaseUrl,
            contentType: Headers.jsonContentType,
          ),
        );

  void addInterceptor() {
    client.interceptors.add(
      InterceptorsWrapper(
          // onRequest: (RequestOptions options) => requestInterceptor(options),
          // onResponse: (Response response) => responseInterceptor(response),
          // onError: (DioError dioError) => errorInterceptor(dioError),
          ),
    );
  }
}
