// ignore_for_file: public_member_api_docs, sort_constructors_first
// ToDo의 Model을 만듭니다.

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  Todo(
    String? id,
    this.description,
    this.completed,
  ) : id = id ?? uuid.v4();

  final String id;
  final String description;
  final bool completed;

  Todo copyWith({
    String? id,
    String? description,
    bool? completed,
  }) {
    return Todo(
      id ?? this.id,
      description ?? this.description,
      completed ?? this.completed,
    );
  }
}
