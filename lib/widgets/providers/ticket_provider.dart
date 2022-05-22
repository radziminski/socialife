import 'package:flutter/material.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/store/ticket.model.dart';
import 'package:socialife/widgets/providers/api_model_provider.dart';

class TicketProvider extends StatelessWidget {
  final bool isListProvider;
  final bool isItemProvider;
  final int? itemId;
  final Widget? loadingWidget;
  final Widget Function(BuildContext context, BaseException error)?
      errorWidgetBuilder;
  final Widget Function(
      BuildContext context, TicketModelSingleton model, Widget? child) builder;

  const TicketProvider({
    required Key key,
    required this.builder,
    this.isListProvider = false,
    this.isItemProvider = false,
    this.itemId,
    this.loadingWidget,
    this.errorWidgetBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApiModelProvider<TicketModelSingleton>(
      key: key ?? const Key('Ticket provider'),
      builder: builder,
      isItemProvider: isItemProvider,
      isListProvider: isListProvider,
      itemId: itemId,
      loadingWidget: loadingWidget,
      errorWidgetBuilder: errorWidgetBuilder,
    );
  }
}
