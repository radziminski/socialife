import 'package:flutter/material.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/store/organization_event.model.dart';
import 'package:socialife/widgets/providers/api_model_provider.dart';

class OrganizationEventProvider extends StatelessWidget {
  final bool isListProvider;
  final bool isItemProvider;
  final int? itemId;
  final Widget? loadingWidget;
  final Widget Function(BuildContext context, BaseException error)?
      errorWidgetBuilder;
  final Widget Function(BuildContext context,
      OrganizationEventModelSingleton model, Widget? child) builder;

  const OrganizationEventProvider({
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
    return ApiModelProvider<OrganizationEventModelSingleton>(
      key: key ?? const Key('OrganizationEvent provider'),
      builder: builder,
      isItemProvider: isItemProvider,
      isListProvider: isListProvider,
      itemId: itemId,
      loadingWidget: loadingWidget,
      errorWidgetBuilder: errorWidgetBuilder,
    );
  }
}
