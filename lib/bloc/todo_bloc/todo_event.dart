abstract class TodoEvent {
  const TodoEvent();
}

class FetchTodoEvent extends TodoEvent {
  FetchTodoEvent();
}

class UpdateTodoEvent extends TodoEvent {
  UpdateTodoEvent(status);
}
