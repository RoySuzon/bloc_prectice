import 'package:hive/hive.dart';
import '../models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo(TodoModel todo);
  Future<void> deleteTodo(String id);
  Future<void> toggleTodoStatus(String id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  static const String boxName = "todos";

  Future<Box> _getBox() async {
    return await Hive.openBox(boxName);
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    final box = await _getBox();
    return box.values
        .map((e) => TodoModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    final box = await _getBox();
    await box.put(todo.id, todo.toJson());
  }

  @override
  Future<void> deleteTodo(String id) async {
    final box = await _getBox();
    await box.delete(id);
  }

  @override
  Future<void> toggleTodoStatus(String id) async {
    final box = await _getBox();
    final data = box.get(id);
    if (data != null) {
      final todo = TodoModel.fromJson(Map<String, dynamic>.from(data));
      final updated = todo.copyWith(isDone: !todo.isDone);
      await box.put(id, updated.toJson());
    }
  }
}
