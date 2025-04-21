import 'package:testing_project/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodos();
  Future<void> addTodo(TodoEntity todo);
  Future<void> updateTodo(String id);
  Future<void> deleteTodo(String id);
}
