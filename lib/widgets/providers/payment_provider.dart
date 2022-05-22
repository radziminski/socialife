import 'package:flutter/material.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/store/Payment.model.dart';
import 'package:socialife/widgets/providers/api_model_provider.dart';

class PaymentProvider extends StatelessWidget {
  final bool isListProvider;
  final bool isItemProvider;
  final int? itemId;
  final Widget? loadingWidget;
  final Widget Function(BuildContext context, BaseException error)?
      errorWidgetBuilder;
  final Widget Function(
      BuildContext context, PaymentModelSingleton model, Widget? child) builder;

  const PaymentProvider({
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
    return ApiModelProvider<PaymentModelSingleton>(
      key: key ?? const Key('Payment provider'),
      builder: builder,
      isItemProvider: isItemProvider,
      isListProvider: isListProvider,
      itemId: itemId,
      loadingWidget: loadingWidget,
      errorWidgetBuilder: errorWidgetBuilder,
    );
  }
}
