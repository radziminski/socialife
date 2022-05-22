import 'package:flutter/material.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/widgets/error/error_card.dart';
import 'package:socialife/widgets/loader/Loader.dart';

class FutureContentWrapper<Error extends BaseException>
    extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  final BaseException? error;
  final Widget? child;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Function()? onReload;

  const FutureContentWrapper({
    Key? key,
    required this.isLoading,
    required this.isError,
    this.child,
    this.error,
    this.loadingWidget,
    this.errorWidget,
    this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget ??
          const Center(
            child: Loader(),
          );
    }
    if (isError) {
      return errorWidget ??
          ErrorCard(
            error: error ?? const UnknownException(),
            onReload: onReload,
          );
    }

    return child ?? Container();
  }
}
