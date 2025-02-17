// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:testing_project/features/todo/domain/models/todo.dart';
import 'package:testing_project/features/todo/domain/repository/todo_repo.dart';

class TodoUseCase {
  final TodoRepo repo;
  TodoUseCase({
    required this.repo,
  });

  void addTodo({required String title, String description = ''}) {
    int id = DateTime.now().millisecondsSinceEpoch;
    repo.addTodo(Todo(
      id: id,
      title: title,
      description: description,
      completed: false,
    ));
  }

  void removeTodo(String id) {
    repo.deleteTodoById(id);
  }

  void updateTodo(Todo todo) {
    repo.updateTodo(todo);
  }

  Future<List<Todo>> getTodos() async {
    return repo.getTodos();
  }
}
