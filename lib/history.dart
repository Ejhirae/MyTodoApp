import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/controllers/history_controller.dart';
import 'package:my_todo_app/controllers/todo_controller.dart';
import 'package:my_todo_app/models/history_model.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<TodoHistoryModel> _todoHistoryModel = [];
  final StreamController _streamController = StreamController();
  final newerDate = DateFormat.yMMMEd('en_US').format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) => getAllTodoFromDB());

  }

  Future getAllTodoFromDB() async {
    _todoHistoryModel = await HistoryController().getHistory();
            _todoHistoryModel
        .sort((a, b) => a.todo_message.toString().compareTo(b.todo_message.toString()));
    _streamController.sink.add(_todoHistoryModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('No No NO'),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: _todoHistoryModel.length,
                      itemBuilder: (context, index) {
                        //TODO: Work on this later
                        //Parse the date into string to be formatted later on
                        // DateTime dateCreated =
                        // DateTime.parse(history.date_created);
                        //Put the date in format: Tue, Nov 14, 2023
                        // final todoListFormatedDate =
                        // DateFormat.yMMMEd('en_US').format(dateCreated);
                        TodoHistoryModel historyModel =
                            _todoHistoryModel[index];
                        return ListTile(
                          title: Text(historyModel.todo_message.toString()),
                          // subtitle: Text(todoListFormatedDate),
                        );
                      }),
                );
              })
        ],
      ),
    );
  }

  sortHistoryTodoList() {}
}
