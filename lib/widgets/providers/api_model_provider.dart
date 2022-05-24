import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/store/base_api.model.dart';
import 'package:socialife/widgets/providers/future_content_wrapper.dart';
import 'package:socialife/widgets/providers/state_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ApiModelProvider<T extends BaseApiModel> extends StatefulWidget {
  final bool isListProvider;
  final bool isItemProvider;
  final bool showLoader;
  final int? itemId;
  final Widget? loadingWidget;
  final Widget Function(BuildContext context, BaseException error)?
      errorWidgetBuilder;
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  const ApiModelProvider({
    required Key key,
    required this.builder,
    this.isListProvider = false,
    this.isItemProvider = false,
    this.showLoader = true,
    this.itemId,
    this.loadingWidget,
    this.errorWidgetBuilder,
  }) : super(key: key);

  @override
  State<ApiModelProvider<T>> createState() => _ApiModelProviderState<T>();
}

class _ApiModelProviderState<T extends BaseApiModel>
    extends State<ApiModelProvider<T>> {
  final model = locator<T>();
  DateTime? lastRefetch;
  bool hasFetchedOnce = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      if (mounted) {
        fetchList();
        fetchItem();
      }
    });
  }

  void fetchList({bool hard = false}) {
    if (!widget.isListProvider) {
      return;
    }

    lastRefetch = DateTime.now();

    if (model.isListSuccess && model.itemsList != null && !hard) {
      model.refetchList();
      return;
    }

    model.getList();
    hasFetchedOnce = true;
  }

  void fetchItem({bool hard = false}) {
    if (!widget.isItemProvider || !mounted) {
      return;
    }

    final itemId = widget.itemId;

    if (itemId == null) {
      if (kDebugMode) {
        print('Using item model provider with null id value!');
      }
      return;
    }

    lastRefetch = DateTime.now();

    if (model.isSuccess[itemId] != null &&
        model.isSuccess[itemId]! &&
        model.items[itemId] != null &&
        !hard) {
      model.refetchItem(itemId);
      return;
    }

    model.getItem(itemId);
  }

  bool checkIfLoading() {
    if (widget.isListProvider || !mounted) {
      return model.isLoadingList;
    }

    if (!widget.isItemProvider) {
      return false;
    }

    final itemId = widget.itemId;

    if (itemId == null) {
      if (kDebugMode) {
        print('Using item model provider with null id value!');
      }
      return false;
    }
    return model.isLoading[widget.itemId] ?? false;
  }

  bool checkIfError() {
    if (widget.isListProvider) {
      return model.isListError;
    }

    if (!widget.isItemProvider) {
      return false;
    }

    final itemId = widget.itemId;

    if (itemId == null) {
      if (kDebugMode) {
        print('Using item model provider with null id value!');
      }
      return false;
    }
    return model.isError[widget.itemId] ?? false;
  }

  BaseException? getError() {
    if (widget.isListProvider) {
      return model.listError;
    }

    if (!widget.isItemProvider) {
      return null;
    }

    final itemId = widget.itemId;

    if (itemId == null) {
      if (kDebugMode) {
        print('Using item model provider with null id value!');
      }
      return null;
    }
    return model.errors[widget.itemId];
  }

  @override
  Widget build(BuildContext context) {
    final error = getError();

    return StateProvider<T>(builder: (context, model, child) {
      return VisibilityDetector(
        key: widget.key ?? const Key('unknown'),
        onVisibilityChanged: (visibilityInfo) {
          final visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 20 &&
              lastRefetch != null &&
              DateTime.now().difference(lastRefetch!).inSeconds > 15 &&
              hasFetchedOnce &&
              mounted) {
            fetchList();
            fetchItem();
          }
        },
        child: FutureContentWrapper(
          isLoading: checkIfLoading() && widget.showLoader,
          isError: checkIfError(),
          loadingWidget: widget.loadingWidget,
          errorWidget: widget.errorWidgetBuilder != null && error != null
              ? widget.errorWidgetBuilder!(context, error)
              : null,
          error: error,
          child: widget.builder(context, model, child),
          onReload: () {
            fetchList(hard: true);
            fetchItem(hard: true);
          },
        ),
      );
    });
  }
}
