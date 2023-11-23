import 'package:flutter/material.dart';
import 'package:my_todo_app/edit_tasks/test_page.dart';
import 'package:my_todo_app/sign/signup.dart';
import 'package:my_todo_app/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
       home: MyTodoApp(title: 'My App',),
      // home: TestMysql(),
    );
  }
}
