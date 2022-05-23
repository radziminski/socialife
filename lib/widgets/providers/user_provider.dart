import 'package:flutter/material.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/store/user_model.dart';
import 'package:socialife/widgets/providers/future_content_wrapper.dart';
import 'package:socialife/widgets/providers/state_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class UserProvider extends StatefulWidget {
  final Widget? loadingWidget;
  final Widget Function(BuildContext context, BaseException error)?
      errorWidgetBuilder;
  final Widget Function(
      BuildContext context, UserModelSingleton model, Widget? child) builder;

  const UserProvider({
    required Key key,
    required this.builder,
    this.loadingWidget,
    this.errorWidgetBuilder,
  }) : super(key: key);

  @override
  State<UserProvider> createState() => _UserProviderState();
}

class _UserProviderState extends State<UserProvider> {
  final UserModelSingleton model = locator<UserModelSingleton>();
  DateTime? lastRefetch;

  @override
  void initState() {
    super.initState();
    if (model.user?.profile == null) {
      fetchUser();
    }
  }

  void fetchUser({bool hard = false}) {
    lastRefetch = DateTime.now();

    if (model.isSuccess && model.user != null && !hard) {
      model.getUser(isRefetching: true);
      return;
    }

    model.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StateProvider<UserModelSingleton>(
        builder: (context, model, child) {
          return VisibilityDetector(
            key: widget.key ?? const Key('unknown'),
            onVisibilityChanged: (visibilityInfo) {
              final visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 20 &&
                  lastRefetch != null &&
                  DateTime.now().difference(lastRefetch!).inSeconds > 15) {
                fetchUser();
              }
            },
            child: FutureContentWrapper(
              isLoading: model.isLoading,
              isError: model.isError,
              loadingWidget: widget.loadingWidget,
              errorWidget:
                  widget.errorWidgetBuilder != null && model.error != null
                      ? widget.errorWidgetBuilder!(context, model.error!)
                      : null,
              error: model.error,
              child: widget.builder(context, model, child),
              onReload: () {
                fetchUser(hard: true);
              },
            ),
          );
        },
      ),
    );
  }
}
