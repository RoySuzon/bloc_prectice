import 'package:testing_project/features/todo/domain/models/todo.dart';

abstract class TodoRepo {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodoById(String id);
  Future<void> deleteAllTodos();
}
