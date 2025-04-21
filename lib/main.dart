// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testing_project/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:testing_project/features/todo/data/repositories_impl/todo_repository_impl.dart';
import 'package:testing_project/features/todo/domain/usecases/get_todos_usecase.dart';
import 'package:testing_project/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:testing_project/features/todo/presentation/pages/todo_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TodoBloc(GetTodos(TodoRepositoryImpl(TodoLocalDataSourceImpl()))),
        )
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: TodoView(),
      ),
    );
  }
}
