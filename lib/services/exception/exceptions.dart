// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class BaseException implements Exception {
  int code;
  String title;
  String? description;
  IconData? icon;

  BaseException({
    required this.code,
    required this.title,
    this.description,
    this.icon,
  });
}

class UnauthorizedException extends BaseException {
  UnauthorizedException({String? description})
      : super(
          code: 401,
          title: 'Unauthorized',
          description: description,
        );
}

class UnknownException extends BaseException {
  UnknownException({String? title, String? description})
      : super(
          code: 1,
          title: title ?? 'Unknown error',
          description: description,
        );
}
