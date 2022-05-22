import 'package:flutter/material.dart';
import 'package:socialife/services/exception/exceptions.dart';

class FutureContentWrapper<Error extends BaseException>
    extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  final Error? error;
  final Widget? child;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  const FutureContentWrapper({
    Key? key,
    required this.isLoading,
    required this.isError,
    this.child,
    this.error,
    this.loadingWidget,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget ??
          const Center(
            child: CircularProgressIndicator(),
          );
    }
    if (isError) {
      return errorWidget ??
          Center(
            child: Text(
              error?.title ?? 'Something wen wrong',
            ),
          );
    }

    return child ?? Container();
  }
}
