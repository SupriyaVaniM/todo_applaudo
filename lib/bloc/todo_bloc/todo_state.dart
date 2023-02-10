import 'package:todo_applaudo/core/models/todo_item.dart';

class TodoState {}

// LOAD TODOS ITEM
class TodoInitialState extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoadedState extends TodoState {
  List<TodoItem> items;
  TodoLoadedState(this.items);
}

class TodoError extends TodoState {
  Error e;
  TodoError(this.e);
}

// UPDATE TODOS ITEM
class UpdateTodoInitialState extends TodoState {}

class UpdateTodoLoading extends TodoState {}

class UpdateTodoLoadedState extends TodoState {
  TodoItem updatedItem;
  UpdateTodoLoadedState(this.updatedItem);
}

class UpdateTodoError extends TodoState {
  Error e;
  UpdateTodoError(this.e);
}
