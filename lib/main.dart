import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_applaudo/core/bloc/auth_bloc/auth_token_bloc.dart';
import 'package:todo_applaudo/core/bloc/todo_bloc/todo_bloc.dart';
import 'ui/views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Applaudo todo app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthTokenBloc>(
            create: (context) => AuthTokenBloc(),
          ),
          BlocProvider<TodoBloc>(
            create: (context) => TodoBloc(),
          ),
          BlocProvider<UpdateTodoBloc>(
            create: (context) => UpdateTodoBloc(true),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
