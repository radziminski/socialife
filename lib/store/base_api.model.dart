import 'package:flutter/foundation.dart';
import 'package:socialife/services/api/entity/base.entity.dart';
import 'package:socialife/services/exception/exceptions.dart';

abstract class BaseApiModel<T extends BaseEntity> extends ChangeNotifier {
  final Future<List<T>> Function()? fetchList;
  final Future<T> Function(int id)? fetchItem;

  BaseApiModel({this.fetchList, this.fetchItem}) : super();

  bool isLoadingList = false;
  bool isFetchingList = false;
  bool isListError = false;
  bool isListSuccess = false;
  BaseException? listError;
  List<T>? itemsList;

  Map<int, bool?> isLoading = {};
  Map<int, bool?> isFetching = {};
  Map<int, bool?> isError = {};
  Map<int, bool?> isSuccess = {};
  Map<int, BaseException?> errors = {};
  Map<int, T> items = {};

  void setIsLoading(int id, bool isLoadingValue) {
    isLoading[id] = isLoadingValue;
    isFetching[id] = isLoadingValue;
    notifyListeners();
  }

  void setIsLoadingList(bool isLoadingListValue) {
    isLoadingList = isLoadingListValue;
    isFetchingList = isLoadingListValue;
    notifyListeners();
  }

  void setIsFetching(int id, bool isFetchingValue) {
    isFetching[id] = isFetchingValue;
    notifyListeners();
  }

  void setIsFetchingList(bool isFetchingAllValue) {
    isFetchingList = isFetchingAllValue;
    notifyListeners();
  }

  void setIsSuccess(int id, bool isSuccessValue) {
    isSuccess[id] = isSuccessValue;
    notifyListeners();
  }

  void setListSuccess(bool isSuccessValue) {
    isListSuccess = isSuccessValue;
    notifyListeners();
  }

  void setError(int id, bool isErrorValue, {BaseException? error}) {
    isError[id] = isErrorValue;
    errors[id] = error;
    notifyListeners();
  }

  void setListError(bool isListErrorValue, {BaseException? error}) {
    isListError = isListErrorValue;
    listError = error;
    notifyListeners();
  }

  void setList(List<T>? itemsListValue) {
    itemsList = itemsListValue;
    notifyListeners();
  }

  void setItem(T item) {
    items[item.id] = item;
    notifyListeners();
  }

  void getList({
    Function(List<T> result)? onSuccess,
    Function(Object error)? onError,
    bool isRefetching = false,
  }) async {
    if (isLoadingList || isFetchingList || fetchList == null) return;

    try {
      if (!isRefetching) {
        setListError(false);
        setListSuccess(false);
        setIsLoadingList(true);
      } else {
        setIsFetchingList(true);
      }

      final result = await fetchList!.call();

      for (final item in result) {
        if (items[item.id] == null) {
          setItem(item);
        }
      }

      itemsList = result;
      isListSuccess = true;
      notifyListeners();

      onSuccess?.call(result);
    } catch (error) {
      onError?.call(error);
      if (kDebugMode) {
        print('Model error of type ${error.runtimeType}');
        print(error);
      }
      if (error is BaseException) {
        setListError(
          true,
          error: error,
        );
        return;
      }
      if (kDebugMode) {
        rethrow;
      }
      setListError(true, error: UnknownException());
    } finally {
      !isRefetching ? setIsLoadingList(false) : setIsFetchingList(false);
    }
  }

  void getItem(
    int id, {
    Function(T result)? onSuccess,
    Function(Object error)? onError,
    bool isRefetching = false,
  }) async {
    if (isLoadingList || isFetchingList || fetchItem == null) return;

    try {
      if (!isRefetching) {
        setIsSuccess(id, false);
        setIsLoading(id, true);
        setError(id, false);
      } else {
        setIsFetching(id, true);
      }

      final result = await fetchItem!.call(id);

      setItem(result);
      setError(id, false);
      setIsSuccess(id, true);

      onSuccess?.call(result);
    } catch (error) {
      onError?.call(error);

      if (kDebugMode) {
        print('Model error:');
        print(error);
      }
      if (error is BaseException) {
        setError(
          id,
          true,
          error: error,
        );
        return;
      }
      if (kDebugMode) {
        rethrow;
      }
      setError(id, true, error: UnknownException());
      setIsSuccess(id, false);
    } finally {
      !isRefetching ? setIsLoading(id, false) : setIsFetching(id, false);
    }
  }

  void invalidateList() {
    itemsList = null;
    notifyListeners();

    getList();
  }

  void invalidateItem(int id) {
    items.remove(id);
    notifyListeners();

    getItem(id);
  }

  void clear() {
    isLoadingList = false;
    isFetchingList = false;
    isListError = false;
    isListSuccess = false;
    listError = null;
    itemsList = null;

    isLoading = {};
    isFetching = {};
    isError = {};
    isSuccess = {};
    errors = {};
    items = {};
  }

  void refetchList() {
    getList(isRefetching: true);
  }

  void refetchItem(int id) {
    getItem(id, isRefetching: true);
  }
}
