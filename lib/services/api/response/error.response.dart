import 'package:socialife/types.dart';

String capitalize(String str) {
  return "${str[0].toUpperCase()}${str.substring(1).toLowerCase()}";
}

class ErrorResponse {
  late int? statusCode;
  late List<String> message;
  late String? error;

  ErrorResponse(Json json) {
    statusCode = json['statusCode'];
    final jsonMessage = json['message'];
    print(jsonMessage);
    print(jsonMessage.runtimeType);
    if (jsonMessage.runtimeType == String) {
      message = [jsonMessage];
    } else {
      message = jsonMessage != null
          ? [...jsonMessage.map((message) => capitalize(message))]
          : ['Unknown error'];
    }

    error = json['error'];
  }
}
