import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/store/base_api_mutation.model.dart';
import 'package:socialife/widgets/providers/future_content_wrapper.dart';
import 'package:socialife/widgets/providers/state_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ApiMutationProvider<T extends BaseApiMutationModel>
    extends StatefulWidget {
  final Widget? loadingWidget;
  final Widget Function(BuildContext context, BaseException error)?
      errorWidgetBuilder;
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  const ApiMutationProvider({
    required Key key,
    required this.builder,
    this.loadingWidget,
    this.errorWidgetBuilder,
  }) : super(key: key);

  @override
  State<ApiMutationProvider<T>> createState() => _ApiModelProviderState<T>();
}

class _ApiModelProviderState<T extends BaseApiMutationModel>
    extends State<ApiMutationProvider<T>> {
  final model = locator<T>();
  DateTime? lastRefetch;
  bool hasFetchedOnce = false;

  @override
  void initState() {
    super.initState();
    model.clear();
  }

  @override
  Widget build(BuildContext context) {
    return StateProvider<T>(builder: (context, model, child) {
      return FutureContentWrapper(
        isLoading: model.isLoading,
        isError: false,
        loadingWidget: widget.loadingWidget,
        errorWidget: widget.errorWidgetBuilder != null && model.error != null
            ? widget.errorWidgetBuilder!(context, model.error!)
            : null,
        error: model.error,
        child: widget.builder(context, model, child),
      );
    });
  }
}
