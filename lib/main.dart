import 'package:flutter/material.dart';
import 'package:my_todo_app/history.dart';
import 'package:my_todo_app/main_page.dart';
import 'package:my_todo_app/sign/login.dart';
import 'package:my_todo_app/sign/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
       home: History(),
      // home: TestMysql(),
    );
  }
}
