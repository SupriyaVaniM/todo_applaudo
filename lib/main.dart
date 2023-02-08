import 'package:flutter/material.dart';
import 'package:todo_applaudo/ui/views/get_task_page.dart';

void main() {
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
      home:  const GetTaskPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

