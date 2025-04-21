import 'package:testing_project/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({required super.id, required super.title, required super.isDone});

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      TodoModel(id: json['id'], title: json['title'], isDone: json["isDone"]);

  Map<String, dynamic> toJson() => {"id": id, "title": title, "isDone": isDone};

  TodoModel copyWith({required bool isDone}) =>
      TodoModel(id: id, title: title, isDone: isDone);
}
