import 'package:flutter/foundation.dart';
import 'package:socialife/locator.dart';
import 'package:socialife/services/exception/exceptions.dart';
import 'package:socialife/services/user/api/get_me.request.dart';
import 'package:socialife/services/user/entity/user.entity.dart';

class UserModelSingleton extends ChangeNotifier {
  bool isLoading = false;
  bool isFetching = false;
  bool isError = false;
  bool isSuccess = false;
  BaseException? error;
  User? user;
  bool didLogout = false;

  void setUser(User user) {
    user = user;
    isSuccess = true;
    isError = false;
    didLogout = false;
  }

  void getUser({
    Function(User result)? onSuccess,
    Function(Object error)? onError,
    bool isRefetching = false,
  }) async {
    if (isLoading || isFetching) return;

    try {
      isError = false;
      error = null;
      if (!isRefetching) {
        isSuccess = false;
        isLoading = true;
      }
      notifyListeners();

      final result = await getMe();

      user = result;
      isSuccess = true;
      notifyListeners();
      onSuccess?.call(result);
    } catch (error) {
      onError?.call(error);
      isError = true;
      if (kDebugMode) {
        print('Model error of type ${error.runtimeType}');
        print(error);
      }
      if (error is BaseException) {
        this.error = error;
        notifyListeners();
        return;
      }
      if (kDebugMode) {
        rethrow;
      }
      this.error = UnknownException();
      notifyListeners();
    } finally {
      isFetching = false;
      if (!isRefetching) {
        isLoading = false;
      }
    }
  }

  void invalidate() {
    user = null;
    getUser();
  }

  void logout() {
    user = null;
    isLoading = false;
    isFetching = false;
    isError = false;
    error = null;
    isSuccess = false;
    didLogout = true;
    notifyListeners();
  }

  void clearDidLogout() {
    didLogout = false;
    notifyListeners();
  }
}

// ignore: non_constant_identifier_names
final UserModel = locator<UserModelSingleton>();
