import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/theme_cubit.dart';
import 'package:todo_app/features/task/bloc/todo_bloc.dart';
import 'package:todo_app/features/task/data/models/todo_model.dart';
import 'package:todo_app/features/task/view/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart' as AppTheme;



void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('settings');
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');


  runApp(
    BlocProvider(
    create: (_) => TodoBloc(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Todo App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: context.watch<ThemeCubit>().state,
            home: Todo(),
          );
        },
      ),
    );
  }
}
