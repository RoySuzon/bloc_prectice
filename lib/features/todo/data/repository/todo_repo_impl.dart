// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:testing_project/features/todo/domain/models/todo.dart';
import 'package:testing_project/features/todo/domain/repository/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  final TodoDataSource todoDataSource;
  TodoRepoImpl({
    required this.todoDataSource,
  });

  @override
  Future<void> addTodo(Todo todo) async {
    todoDataSource.todos.add(todo);
  }

  @override
  Future<void> deleteAllTodos() async {
    todoDataSource.todos.clear();
  }

  @override
  Future<void> deleteTodoById(String id) async {
    todoDataSource.todos.removeWhere((element) => element.id.toString() == id);
  }

  @override
  Future<List<Todo>> getTodos() async {
    return await Future.value(todoDataSource.todos);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final index =
        todoDataSource.todos.indexWhere((element) => element.id == todo.id);
    todoDataSource.todos[index] = todo;
  }
}

class TodoDataSource {
  final List<Todo> todos = [];
}
