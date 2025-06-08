import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/features/task/data/models/todo_model.dart';
import 'todo_event.dart';
import 'todo_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Box<TodoModel> todoBox = Hive.box<TodoModel>('todos');


  TodoBloc() : super(TodoInitial()) {
    on<LoadTasks>(loadTasks);
    on<ToggleTodoStatus>(toggleTodoStatus);
    on<AddTask>(addTask);
    on<DeleteTask>(deleteTask);
    on<EditTask>(editTask);
  }

  FutureOr<void> loadTasks(LoadTasks event, Emitter<TodoState> emit) {
    final todos = todoBox.values.toList();
    emit(TaskLoaded(todos));

  }

  FutureOr<void> toggleTodoStatus(ToggleTodoStatus event, Emitter<TodoState> emit) {
    final current = todoBox.getAt(event.index);
    if (current != null) {
      final updated = current.copyWith(isCompleted: !current.isCompleted);
      todoBox.putAt(event.index, updated);
      add(LoadTasks());
    }
  }

  FutureOr<void> addTask(AddTask event, Emitter<TodoState> emit) {
    final todo = TodoModel(
      title: event.taskName,
      createdAt: DateTime.now(),
    );
    todoBox.put(todo.title, todo);
    add(LoadTasks());
    emit(TaskAdded());
  }



  FutureOr<void> deleteTask(DeleteTask event, Emitter<TodoState> emit) {
    todoBox.deleteAt(event.index);
    add(LoadTasks());
    emit(TaskDeleted());
  }

  FutureOr<void> editTask(EditTask event, Emitter<TodoState> emit) {
    final current = todoBox.getAt(event.index);
    if (current != null) {
      final updated = current.copyWith(title: event.updatedName);
      todoBox.putAt(event.index, updated);
      add(LoadTasks());
      emit(TaskEdited());
    }
  }
}
