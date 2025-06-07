import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final bool isCompleted;

  @HiveField(2)
  final DateTime createdAt;

  TodoModel({
    required this.title,
    this.isCompleted = false,
    required this.createdAt,
  });

  TodoModel copyWith({
    String? title,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return TodoModel(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
