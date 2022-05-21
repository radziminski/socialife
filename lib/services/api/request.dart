import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:socialife/constants/config.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/auth/auth.dart';
import 'package:socialife/types.dart';

enum RequestMethod {
  get,
  post,
  patch,
  delete,
}

/// Singleton
class RequestService {
  static const skipAuthHeader = 'x-skip-auth';
  static const removeNullsHeader = 'x-remove-nulls';
  final Dio client = Dio();

  RequestService() {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    client.interceptors.add(PrettyDioLogger());
    client.interceptors.add(RetryInterceptor(
      dio: client,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 1),
        Duration(seconds: 2),
      ],
    ));
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: _authInterceptor,
      ),
    );
  }

  void _authInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    String? token = locator<AuthService>().accessToken;
    if (token == null) {
      return handler.next(options);
    }

    if (options.headers[skipAuthHeader]) {
      options.headers.remove(skipAuthHeader);

      return handler.next(options);
    }

    if (options.headers[removeNullsHeader]) {
      options.headers.remove(removeNullsHeader);
      options.data = removeNullsFromPayload(options.data);
    }

    options.headers.addAll({'Authorization': 'Bearer ' + token});

    return handler.next(options);
  }

  Future<Result> request<Payload, Result>({
    required String route,
    RequestMethod method = RequestMethod.get,
    Payload? payload,
    bool skipAuth = false,
    bool removeNulls = true,
  }) async {
    try {
      final RequestOptions options = RequestOptions(
        method: geRequestMethodString(method),
        path: route,
        baseUrl: kApiBaseUrl,
        data: payload,
        contentType: Headers.jsonContentType,
        headers: {
          // ignore: unnecessary_string_interpolations
          '$skipAuthHeader': skipAuth,
          // ignore: unnecessary_string_interpolations
          '$removeNullsHeader': removeNulls,
        },
      );

      final Response<Result> response = await client.fetch<Result>(options);

      if (response.data == null) {
        throw Exception('Received null data');
      }

      return response.data!;
    } catch (e) {
      throw Exception();
    }
  }

  static String geRequestMethodString(RequestMethod method) {
    switch (method) {
      case RequestMethod.get:
        return 'get';
      case RequestMethod.post:
        return 'post';
      case RequestMethod.patch:
        return 'patch';
      case RequestMethod.delete:
        return 'delete';
      default:
        throw Exception('Unsupported method');
    }
  }

  static Json removeNullsFromPayload(Json payload) {
    final newPayload = {...payload};

    newPayload.removeWhere(
      (key, value) => value == null,
    );

    return newPayload;
  }
}

final request = locator<RequestService>().request;
