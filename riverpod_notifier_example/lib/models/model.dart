import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class Todo with _$Todo {
  factory Todo({
    required String id,
    required String description,
    required bool completed,
  }) = _Todo;
}
