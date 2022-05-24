import 'package:flutter/material.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/store/event.model.dart';
import 'package:socialife/widgets/providers/api_model_provider.dart';

class EventProvider extends StatelessWidget {
  final bool isListProvider;
  final bool isItemProvider;
  final bool showLoader;
  final int? itemId;
  final Widget? loadingWidget;
  final Widget Function(BuildContext context, BaseException error)?
      errorWidgetBuilder;
  final Widget Function(
      BuildContext context, EventModelSingleton model, Widget? child) builder;

  const EventProvider({
    required Key key,
    required this.builder,
    this.isListProvider = false,
    this.isItemProvider = false,
    this.itemId,
    this.loadingWidget,
    this.errorWidgetBuilder,
    this.showLoader = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApiModelProvider<EventModelSingleton>(
      key: key ?? const Key('Event provider'),
      builder: builder,
      isItemProvider: isItemProvider,
      isListProvider: isListProvider,
      itemId: itemId,
      loadingWidget: loadingWidget,
      errorWidgetBuilder: errorWidgetBuilder,
      showLoader: showLoader,
    );
  }
}
