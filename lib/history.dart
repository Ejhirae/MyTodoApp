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
    _todoHistoryModel.sort((a, b) =>
        a.todo_message.toString().compareTo(b.todo_message.toString()));
    _streamController.sink.add(_todoHistoryModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.redAccent),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: _todoHistoryModel.length,
                      itemBuilder: (context, index) {
                        TodoHistoryModel historyModel =
                            _todoHistoryModel[index];
                        //TODO: Work on this later
                        //Parse the date into string to be formatted later on
                        DateTime dateCreated =
                            DateTime.parse(historyModel.date_completed);
                        //Put the date in format: Tue, Nov 14, 2023
                        final todoListFormatedDate =
                            DateFormat.yMMMEd('en_US').format(dateCreated);

                        return Card(
                          // shape:(),
                          shadowColor: Colors.redAccent,
                          color: Colors.black,
                          surfaceTintColor: Colors.white,
                          child: ListTile(
                            title: Text(
                              historyModel.todo_message.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle:
                                Text('Date finished: $todoListFormatedDate'),
                            trailing: PopupMenuButton(
                              iconColor: Colors.redAccent,
                              color: Colors.white,
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                    child: Text('Mark as unfinished'),
                                    onTap: null,
                                  )
                                ];
                              },
                            ),
                          ),
                        );
                      }),
                );
              })
        ],
      ),
    );
  }

  Future sendTodoHistoryTable(TodoHistoryModel todoHistoryModel) async {
    TodoController todoController = TodoController();
    await todoController
        .sendToHistoryTable(todoHistoryModel)
        .then((success) => {print("Success Sending To Table")});
  }
}
