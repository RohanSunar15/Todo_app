import 'package:todo_app/features/task/data/models/todo_model.dart';

sealed class TodoState {}

final class TodoInitial extends TodoState {}


class TaskLoaded extends TodoState {
  final List<TodoModel> todos;

  TaskLoaded(this.todos);
}

class TaskAdded extends TodoState{}