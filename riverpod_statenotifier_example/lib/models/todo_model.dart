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

  // Todo는 기본적으로 immutable합니다.
  // 기존에 만들어진 Todo의 configuration을 활용하여 새로운 Todo를 만들 때는
  // copyWith method를 활용합니다.

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
