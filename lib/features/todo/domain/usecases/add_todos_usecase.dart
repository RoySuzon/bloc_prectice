import 'package:testing_project/features/todo/domain/entities/todo_entity.dart';
import 'package:testing_project/features/todo/domain/repositories/todo_repository.dart';

class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<void> call(TodoEntity todo) async => await repository.addTodo(todo);
}
