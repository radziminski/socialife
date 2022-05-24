import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/types.dart';

abstract class BaseEntity {
  late DateTime? createdAt;
  late DateTime? editedAt;
  late int id;

  BaseEntity(Json json) {
    id = json['id'];
    createdAt = parseNullableDate(json['createdAt']);
    editedAt = parseNullableDate(json['editedAt']);
  }
}
