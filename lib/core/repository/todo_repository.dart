import 'dart:async';

import 'package:todo_applaudo/core/repository/dio_client.dart';

class TodoRepository {
  static final TodoRepository _singletonTodoRepository =
      TodoRepository._internal();

  factory TodoRepository() {
    return _singletonTodoRepository;
  }

  TodoRepository._internal();

  Future<dynamic> getTodos() async {
    return await DioClient().getTasks();
  }

  Future<dynamic> updateTodo({required bool status}) async {
    return await DioClient().updateTodoItem(status: status);
  }
}
