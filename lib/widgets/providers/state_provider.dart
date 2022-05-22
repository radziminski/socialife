import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';

class StateProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onInit;
  final Function(T)? onDispose;

  const StateProvider({
    Key? key,
    required this.builder,
    this.onInit,
    this.onDispose,
  }) : super(key: key);

  @override
  _StateProviderState<T> createState() => _StateProviderState<T>();
}

class _StateProviderState<T extends ChangeNotifier>
    extends State<StateProvider<T>> {
  final T model = locator<T>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50)).then((_) {
      if (mounted && widget.onInit != null) {
        widget.onInit!(model);
      }
    });
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
