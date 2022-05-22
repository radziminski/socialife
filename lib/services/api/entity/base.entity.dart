import 'package:socialife/types.dart';

abstract class BaseEntity {
  late DateTime createdAt;
  late DateTime editedAt;
  late int id;

  BaseEntity(Json json) {
    id = json['id'];
    createdAt = DateTime.parse(json['createdAt']);
    editedAt = DateTime.parse(json['editedAt']);
  }
}
