import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_todo_app/controllers/profile_controller.dart';
import 'package:my_todo_app/controllers/todo_controller.dart';
import 'package:my_todo_app/models/profile_model.dart';
import 'package:my_todo_app/models/todo_model.dart';

class TestMysql extends StatefulWidget {
  const TestMysql({super.key});

  @override
  State<TestMysql> createState() => _TestMysqlState();
}

class _TestMysqlState extends State<TestMysql> {
  List<TodoListModel> _todo = [];
  bool isChecked = false;
  var selectedIndex = [];

  final StreamController _streamController = StreamController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) => getAllProfile());
  }

  Future getAllProfile() async {
    _todo = await TodoController().getProfiles();
    _streamController.sink.add(_todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: _todo.length,
                  itemBuilder: ((context, index) {
                    TodoListModel todo = _todo[index];
                    return CheckboxListTile(
                      value: selectedIndex.contains(index),
                      onChanged: (_) {
                        if (selectedIndex.contains(index)) {
                          selectedIndex.remove(index); // unselect
                        } else {
                          selectedIndex.add(index); // select
                        }
                      },
                      title: Text(todo.todo_message.toString()),
                      subtitle: Text(todo.date_created.toString()),
                      controlAffinity: ListTileControlAffinity.leading,
                      // leading: Text(todo.user_id.toString()),
                    );
                  }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
