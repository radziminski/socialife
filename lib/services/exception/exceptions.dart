// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ExceptionBase {
  int code;
  String title;
  String? description;
  IconData? icon;

  ExceptionBase({
    required this.code,
    required this.title,
    this.description,
    this.icon,
  });
}

class UnauthorizedException extends ExceptionBase {
  UnauthorizedException({String? description})
      : super(
          code: 401,
          title: 'Unauthorized',
          description: description,
        );
}
