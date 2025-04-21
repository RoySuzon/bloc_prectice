import 'package:testing_project/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:testing_project/features/todo/data/models/todo_model.dart';
import 'package:testing_project/features/todo/domain/entities/todo_entity.dart';
import 'package:testing_project/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTodo(TodoEntity todo) async => await localDataSource
      .addTodo(TodoModel(id: todo.id, title: todo.title, isDone: todo.isDone));

  @override
  Future<void> deleteTodo(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<TodoEntity>> getTodos() async {
    return await localDataSource.getTodos();
  }

  @override
  Future<void> updateTodo(String id) async {
    await localDataSource.toggleTodoStatus(id);
  }
}
