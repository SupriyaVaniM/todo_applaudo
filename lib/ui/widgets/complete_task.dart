import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_applaudo/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_applaudo/bloc/todo_bloc/todo_state.dart';
import 'package:todo_applaudo/core/models/todo_item.dart';
import 'package:todo_applaudo/ui/widgets/custom_list_tile.dart';

class CompleteTask extends StatelessWidget {
  final List<TodoItem> todos;

  const CompleteTask(this.todos, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateTodoBloc, TodoState>(
      builder: (context, state) {
        return ListView.builder(
        shrinkWrap: true,
        itemCount: todos.length,
        itemBuilder: (context, i) {
          return CustomListTile(
            title: todos[i].fields.name?.stringValue ??
                todos[i].fields.id?.stringValue ??
                "",
            subtitle: todos[i].createTime,
            onChanged: (value) {
              debugPrint(todos[i].updateTime);
            },
          );
        },
      );
      }
    );
  }

}

