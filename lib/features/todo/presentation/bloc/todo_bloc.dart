import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing_project/features/todo/domain/entities/todo_entity.dart';
import 'package:testing_project/features/todo/domain/usecases/get_todos_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;
  TodoBloc(this.getTodos) : super(TodoInitial()) {
    on<LoadTodosEvent>((event, emit) async {
      emit(TodoLoading());
      // await Future.delayed(Duration(seconds: 5));
      final todos = await getTodos.call();
      emit(TodoLoaded(todos));
    });
  }
}
