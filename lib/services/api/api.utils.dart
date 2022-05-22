import 'package:socialife/types.dart';

DateTime? parseNullableDate(String? date) {
  if (date == null) {
    return null;
  }

  return parseDate(date);
}

DateTime parseDate(String date) => DateTime.parse(date);

List<T> parseList<T>(List<dynamic>? jsonList, T Function(Json json) transform) {
  if (jsonList == null) {
    return [];
  }

  List<T> results = [];

  for (final item in jsonList) {
    results.add(transform(item));
  }

  return results;
}
