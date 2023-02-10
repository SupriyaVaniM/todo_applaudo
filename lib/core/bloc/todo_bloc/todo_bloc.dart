import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_applaudo/core/models/todo_item.dart';
import 'todo_event.dart';
import '../../repository/todo_repository.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<FetchTodoEvent, TodoState> {
  final TodoRepository _todoRepository = TodoRepository();

  TodoState get initialState {
    return TodoInitialState();
  }

  TodoBloc() : super(TodoInitialState()) {
    on<FetchTodoEvent>((event, emit) async {
      emit(TodoLoading());
      try {
        List<TodoItem> userResponseList = await _todoRepository.getTodos();
        emit(TodoLoadedState(userResponseList));
        debugPrint(userResponseList.length.toString());
      } catch (e) {
        debugPrint("error msg ${e.toString()}");
        emit(TodoError(Error()));
      }
    });
  }
}

class UpdateTodoBloc extends Bloc<UpdateTodoEvent, TodoState> {
  final TodoRepository _todoRepository = TodoRepository();

  TodoState get initialState {
    return UpdateTodoInitialState();
  }

  UpdateTodoBloc(status) : super(UpdateTodoInitialState()) {
    on<UpdateTodoEvent>((event, emit) async {
      emit(UpdateTodoLoading());
      try {
        TodoItem userResponseList =
            await _todoRepository.updateTodo(status: status);
        emit(UpdateTodoLoadedState(userResponseList));
        debugPrint(userResponseList.name);
      } catch (e) {
        debugPrint("error msg ${e.toString()}");
        emit(UpdateTodoError(Error()));
      }
    });
  }
}
