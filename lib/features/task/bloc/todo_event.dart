sealed class TodoEvent {}

class LoadTasks extends TodoEvent{}

class ToggleTodoStatus extends TodoEvent {
  final int index;

  ToggleTodoStatus(this.index);

  @override
  List<Object> get props => [index];
}

class AddTask extends TodoEvent{
  final String taskName;

  AddTask({required this.taskName});

  @override
  List<Object> get props => [taskName];
}


class DeleteTask extends TodoEvent {
  final int index;

  DeleteTask({required this.index});
}

class EditTask extends TodoEvent {
  final int index;
  final String updatedName;

  EditTask({required this.index, required this.updatedName});
}