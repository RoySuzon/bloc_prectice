import 'package:equatable/equatable.dart';
import 'package:testing_project/features/todo/domain/models/todo.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class FetchTodosEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String title;
  final String description;

  const AddTodoEvent({required this.title, this.description = ""});

  @override
  List<Object> get props => [title, description];
}

class DeleteTodoEvent extends TodoEvent {
  final Todo todo;

  const DeleteTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class UpdateTodoEvent extends TodoEvent {
  final String todo;

  const UpdateTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class ClearCompletedEvent extends TodoEvent {}
