part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoEntity> todos;
  TodoLoaded(this.todos);
  @override
  List<Object> get props => [todos];
}

class TodoLoading extends TodoState {}
