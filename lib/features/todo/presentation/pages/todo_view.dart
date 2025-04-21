import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:testing_project/features/todo/data/repositories_impl/todo_repository_impl.dart';
import 'package:testing_project/features/todo/domain/entities/todo_entity.dart';
import 'package:testing_project/features/todo/presentation/bloc/todo_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TodoRepositoryImpl(TodoLocalDataSourceImpl())
              .addTodo(TodoEntity(id: "2", title: "title", isDone: false));
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: context.read<TodoBloc>()..add(LoadTodosEvent()),
        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            if (state.todos.isEmpty) {
              return Center(child: Text('No todos available'));
            }
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) =>
                  TodoCard(todo: state.todos[index]),
            );
          }
          // else if (state is TodoError) {
          //   return Center(child: Text('Error loading todos'));
          // }
          return Center(child: Text('No todos available'));
        },
      ),
    );
  }
}

class TodoCard extends StatelessWidget {
  final TodoEntity todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      trailing: Checkbox(
        value: todo.isDone,
        onChanged: (value) {
          // Handle checkbox change
        },
      ),
      onTap: () {
        // Handle card tap
      },
    );
  }
}
