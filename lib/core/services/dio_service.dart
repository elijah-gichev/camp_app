import 'package:dio/dio.dart';

class DioService {
  final Dio client;

  DioService(this.client) {
    client.options.validateStatus = (status) {
      return status! >= 200 && status < 500;
    };
  }

  static const devBaseUrl = 'https://camp-app-hackathon.herokuapp.com/api';

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
