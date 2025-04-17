import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/features/todo/bloc/todo_bloc.dart';
import 'package:testing_project/features/todo/bloc/todo_event.dart';
import 'package:testing_project/features/todo/bloc/todo_state.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoBloc>().add(const AddTodoEvent(
              title: "New Todo", description: "New Todo Description"));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("This is home page of it!"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        // bloc: TodoBloc(TodoUseCase(repo: TodoRepoImpl(todoDataSource: TodoDataSource())))..add(FetchTodosEvent()),
        builder: (context, state) {
          if (state is ToDoLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(state.todos[index].id.toString()),
                  onDismissed: (direction) {
                    context
                        .read<TodoBloc>()
                        .add(DeleteTodoEvent(state.todos[index]));
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    leading: Text((index+1).toString()),
                    title: Text(state.todos[index].title),
                    subtitle: Text(state.todos[index].description),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
