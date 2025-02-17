import 'package:bloc/bloc.dart';
import 'package:testing_project/features/todo/bloc/todo_event.dart';
import 'package:testing_project/features/todo/bloc/todo_state.dart';
import 'package:testing_project/features/todo/domain/use_case/todo_use_case.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUseCase todoUseCase;
  TodoBloc(this.todoUseCase) : super(const TodoState()) {
    on<FetchTodosEvent>((event, emit) async {
      emit(const ToDoLoadingState());
      // await Future.delayed(const Duration(seconds: 2));
      await todoUseCase.getTodos().then((todos) {
        emit(state.copyWith(todos: todos));
      });
    });
    on<AddTodoEvent>((event, emit) {
      emit(const ToDoLoadingState());
      todoUseCase.addTodo(title: event.title, description: event.description);
      add(FetchTodosEvent());
    });
    on<DeleteTodoEvent>((event, emit) {
      emit(const ToDoLoadingState());
      todoUseCase.removeTodo(event.todo.id.toString());
      add(FetchTodosEvent());
    });
    // on<AddTodoEvent>((event, emit) {
    //   emit(const ToDoLoadingState());
    //   todoUseCase.getTodos().then((todos) {
    //     emit(TodoState(todos: todos));
    //   });
    //   add(FetchTodosEvent());
    // });
  }
}
