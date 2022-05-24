// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class BaseException implements Exception {
  final int code;
  final String title;
  final String? description;
  final IconData? icon;

  const BaseException({
    required this.code,
    required this.title,
    this.description,
    this.icon,
  });
}

class RequestException extends BaseException {
  RequestException({
    required int code,
    required String title,
    String? description,
    IconData? icon,
  }) : super(code: code, title: title, description: description, icon: icon);
}

class UnauthorizedException extends RequestException {
  UnauthorizedException({String? description})
      : super(
          code: 401,
          title: 'Unauthorized',
          description: description,
        );
}

class InvalidCredentialsException extends RequestException {
  InvalidCredentialsException({String? description})
      : super(
          code: 401,
          title: 'Invalid email or password',
        );
}

class ForbiddenException extends RequestException {
  ForbiddenException({String? description})
      : super(
          code: 401,
          title: 'You are not authorized to view this content',
          description: description,
        );
}

class UnavailableException extends RequestException {
  UnavailableException({String? description})
      : super(
          code: 500,
          title:
              'Our servers are temporarily unavailable, please try again later',
          description: description,
        );
}

class UnknownException extends BaseException {
  const UnknownException({String? title, String? description})
      : super(
          code: 1,
          title: title ?? 'Something went wrong',
          description: description,
        );
}

class UnknownRequestException extends RequestException {
  UnknownRequestException({String? title, String? description})
      : super(
          code: 1,
          title: title ?? 'Something went wrong with the request',
          description: description,
        );
}

class DisconnectedException extends RequestException {
  DisconnectedException({String? description})
      : super(
          code: 2,
          title: 'No internet connection',
          description:
              'Make sure you are connected to the internet and try again',
        );
}

class AppInitException extends BaseException {
  AppInitException()
      : super(
          code: 3,
          title: 'Something went wrong with initializing the app',
          description: 'Make sure you have internet connection and try again',
        );
}

class BadRequestException extends RequestException {
  BadRequestException({String? title, String? description})
      : super(
          code: 400,
          title: title ?? 'Invalid request',
          description: description ??
              'Make sure you provided data is correct and try again',
        );
}

class RequiredException extends RequestException {
  RequiredException(String fieldName)
      : super(
          code: 5,
          title: '"$fieldName" is required',
          icon: Icons.error_outline,
        );
}
