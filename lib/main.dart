// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/animation.dart';
import 'package:testing_project/bloc/counter/counter_bloc.dart';
import 'package:testing_project/bloc/image_picker/image_picker_bloc.dart';
import 'package:testing_project/bloc/switch/switch_bloc.dart';
import 'package:testing_project/features/todo/bloc/todo_bloc.dart';
import 'package:testing_project/features/todo/bloc/todo_event.dart';
import 'package:testing_project/features/todo/data/repository/todo_repo_impl.dart';
import 'package:testing_project/features/todo/domain/use_case/todo_use_case.dart';
import 'package:testing_project/ui/elements_list.dart';
import 'package:testing_project/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(
            create: (context) => TodoBloc(TodoUseCase(
                repo: TodoRepoImpl(todoDataSource: TodoDataSource())))
              ..add(FetchTodosEvent()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ElementsList(),
      ),
    );
  }
}
