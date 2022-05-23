import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/store/base_api_mutation.model.dart';
import 'package:socialife/widgets/providers/future_content_wrapper.dart';
import 'package:socialife/widgets/providers/state_provider.dart';

class ApiMutationProvider<T extends BaseApiMutationModel>
    extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  const ApiMutationProvider({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<ApiMutationProvider<T>> createState() => _ApiModelProviderState<T>();
}

class _ApiModelProviderState<T extends BaseApiMutationModel>
    extends State<ApiMutationProvider<T>> {
  final model = locator<T>();

  @override
  void initState() {
    super.initState();
    model.clear();
  }

  @override
  Widget build(BuildContext context) {
    return StateProvider<T>(builder: (context, model, child) {
      return FutureContentWrapper(
        isLoading: false,
        isError: false,
        child: widget.builder(context, model, child),
      );
    });
  }
}
