import 'package:dio/dio.dart';

class DioService {
  final authTokenHeaderName = 'id';

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

  void addIdInterceptor(int id) {
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers[authTokenHeaderName] = id;
        },
        // onResponse: (Response response) => responseInterceptor(response),
        // onError: (DioError dioError) => errorInterceptor(dioError),
      ),
    );
  }
}

// class _TokenInterceptor extends AuthInterceptor {
//   final authTokenHeaderName = 'X-Auth-Token';

//   String? authToken;

//   _TokenInterceptor({this.authToken});

//   @override
//   Future<dynamic> onRequest(RequestOptions options) {
//     if (authToken != null) {
//       options.headers[authTokenHeaderName] = authToken;
//     }

//     return super.onRequest(options);
//   }
// }
