import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_applaudo/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_applaudo/bloc/todo_bloc/todo_event.dart';
import 'package:todo_applaudo/bloc/todo_bloc/todo_state.dart';
import 'package:todo_applaudo/ui/style/inter_style.dart';
import 'package:todo_applaudo/ui/style/theme_color.dart';
import 'package:todo_applaudo/ui/widgets/complete_task.dart';
import 'package:todo_applaudo/ui/widgets/incomplete_task.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoBloc>(context).add(FetchTodoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoadedState) {
          var completedTodos = state.items
              .where((element) => element.fields.isCompleted.booleanValue)
              .toList();
          var inCompletedTodos = state.items
              .where((element) => !element.fields.isCompleted.booleanValue)
              .toList();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text('Incompleted',
                      style: InterStyle.s6.copyWith(color: ThemeColors.comet)),
                ),
                Flexible(child: InCompleteTask(completedTodos)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Completed',
                      style: InterStyle.s6.copyWith(color: ThemeColors.comet)),
                ),
                Flexible(child: CompleteTask(inCompletedTodos)),
              ],
            ),
          );
        }
        if (state is TodoError) {
          return Center(
            child: Text(state.e.toString()),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
