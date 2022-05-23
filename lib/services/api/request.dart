import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:socialife/constants/config.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/api/response/error.response.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/services/tokens/tokens_service.dart';
import 'package:socialife/types.dart';

enum RequestMethod {
  get,
  post,
  patch,
  delete,
}

class RequestServiceSingleton {
  static const skipAuthHeader = 'x-skip-auth';
  static const removeNullsHeader = 'x-remove-nulls';
  final Dio client = Dio();

  RequestServiceSingleton() {
    _setupInterceptors();
    client.options.baseUrl = kApiBaseUrl;
  }

  void _setupInterceptors() {
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: _authInterceptor,
      ),
    );
    client.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      request: true,
    ));
    client.interceptors.add(RetryInterceptor(
      dio: client,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 1),
        Duration(seconds: 2),
      ],
    ));
  }

  void _authInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    String? token = TokensService.getAccessToken();
    if (token == null) {
      return handler.next(options);
    }

    if (options.headers[skipAuthHeader]) {
      options.headers.remove(skipAuthHeader);

      return handler.next(options);
    }

    if (options.headers[removeNullsHeader] != null) {
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
      final Options options = Options(
        method: geRequestMethodString(method),
        headers: {
          // ignore: unnecessary_string_interpolations
          '$skipAuthHeader': skipAuth,
          // ignore: unnecessary_string_interpolations
          '$removeNullsHeader': removeNulls,
        },
      );

      final Response<Result> response = await client.request<Result>(
        route,
        data: payload,
        options: options,
      );

      if (response.data == null) {
        throw Exception('Received null data');
      }

      return response.data!;
    } catch (error) {
      if (error is DioError) {
        final response = error.response?.data != null
            ? ErrorResponse(error.response?.data)
            : null;
        if (error.response?.statusCode != null) {
          if (error.response!.statusCode == 401) {
            throw UnauthorizedException();
          }
          if (error.response!.statusCode == 403) {
            throw ForbiddenException();
          }
          if (error.response!.statusCode == 400) {
            throw BadRequestException(description: response?.message[0]);
          }
          if (error.response!.statusCode! > 500) {
            throw UnavailableException();
          }
          if (error.response!.statusCode == 500) {
            throw UnknownRequestException(description: response?.message[0]);
          }
        }

        throw DisconnectedException();
      } else {
        if (kDebugMode) {
          rethrow;
        }
        throw UnknownException();
      }
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

final request = locator<RequestServiceSingleton>().request;
