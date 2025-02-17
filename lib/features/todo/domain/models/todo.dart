// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final int id;
  final String title;
  final String description;
  final bool completed;
  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
  });

  Todo toggleCompleted() {
    return copyWith(completed: !completed);
  }

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}
