// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:testing_project/features/todo/domain/models/todo.dart';

class TodoState extends Equatable {
  final List<Todo> todos;
  const TodoState({this.todos = const []});
  @override
  List<Object> get props => [todos];

  TodoState copyWith({
    List<Todo>? todos,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
    );
  }
}

class ToDoLoadingState extends TodoState {
  const ToDoLoadingState();

  @override
  List<Object> get props => [];
}
