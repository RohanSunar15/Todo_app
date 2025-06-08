import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theme/theme_cubit.dart';
import 'package:todo_app/features/task/bloc/todo_bloc.dart';
import 'package:todo_app/features/task/bloc/todo_event.dart';
import 'package:todo_app/features/task/bloc/todo_state.dart';
import 'package:todo_app/features/task/widget/add_todo_dialog.dart';
import 'package:todo_app/features/task/widget/todo_tile.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(LoadTasks());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App',),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(
                context.read<ThemeCubit>().state == ThemeMode.light
                    ? Icons.wb_sunny_outlined
                    : Icons.nightlight_round,
              ),
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
          ),
          // Icon(Icons.nightlight_outlined),
        ],
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) async {
          if (state is TaskAdded) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('New Task Added Successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
          } else if (state is TaskDeleted) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Task Deleted Successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
          }else if (state is TaskEdited) {
            await Future.delayed(Duration(seconds: 1));
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Task Edited Successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is TaskLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: state.todos[index].title,
                  taskCompleted: state.todos[index].isCompleted,
                  onChanged: (_) =>
                      context.read<TodoBloc>().add(ToggleTodoStatus(index)),
                  onSelected: (value){
                    if (value == 'edit') {
                      _controller.text = state.todos[index].title; // Pre-fill the current title
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddTodoDialog(
                            controller: _controller,
                            onSave: () {
                              final updatedText = _controller.text.trim();
                              if (updatedText.isNotEmpty) {
                                context.read<TodoBloc>().add(
                                  EditTask(index: index, updatedName: updatedText),
                                );
                                _controller.clear();
                                Navigator.of(context).pop();
                              }
                            },
                            onCancel: () {
                              _controller.clear();
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    } else if (value == 'delete') {
                      context.read<TodoBloc>().add(DeleteTask(index: index));
                    }
                  },
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTodoDialog(
                controller: _controller,
                onSave: () {
                  final text = _controller.text.trim();
                  if (text.isNotEmpty) {
                    context.read<TodoBloc>().add(AddTask(taskName: text));
                    _controller.clear();
                    Navigator.of(context).pop();
                  }
                },
                onCancel: () {
                  _controller.clear();
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
