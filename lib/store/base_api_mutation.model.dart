import 'package:flutter/foundation.dart';
import 'package:socialife/services/exception/exceptions.dart';

abstract class BaseApiMutationModel<P, T> extends ChangeNotifier {
  final Future<T> Function(P payload)? mutateFn;

  BaseApiMutationModel({this.mutateFn}) : super();

  bool isLoading = false;
  bool isError = false;
  bool isSuccess = false;
  BaseException? error;
  T? lastResult;

  void setIsLoading(bool isLoadingValue) {
    isLoading = isLoadingValue;
    notifyListeners();
  }

  void setIsSuccess(bool isSuccessValue) {
    isSuccess = isSuccessValue;
    notifyListeners();
  }

  void setError(bool isErrorValue, {BaseException? error}) {
    isError = isErrorValue;
    error = error;
    notifyListeners();
  }

  void setLastResult(T lastResult) {
    lastResult = lastResult;
    notifyListeners();
  }

  void mutate(
    P payload, {
    Function(T result)? onSuccess,
    Function(Object error)? onError,
  }) async {
    if (isLoading || mutateFn == null) return;

    try {
      clear();
      setIsLoading(true);

      final result = await mutateFn!.call(payload);

      lastResult = result;
      isSuccess = true;
      notifyListeners();

      onSuccess?.call(result);
    } catch (error) {
      onError?.call(error);
      if (kDebugMode) {
        print('Model error of type ${error.runtimeType}');
        print(error);
      }
      if (error is BaseException) {
        setError(
          true,
          error: error,
        );
        return;
      }
      if (kDebugMode) {
        rethrow;
      }
      setError(true, error: const UnknownException());
    } finally {
      setIsLoading(false);
    }
  }

  void clear() {
    isError = false;
    isSuccess = false;
    isLoading = false;
    lastResult = null;
    notifyListeners();
  }
}
