import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/controllers/todo_controller.dart';
import 'package:my_todo_app/history.dart';
import 'package:my_todo_app/models/create_model.dart';
import 'package:my_todo_app/models/history_model.dart';
import 'package:my_todo_app/models/todo_model.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class MyTodoApp extends StatefulWidget {
  final String title;
  const MyTodoApp({super.key, required this.title});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  List<TodoListModel> _todoListModel = [];
  final StreamController _streamController = StreamController();
  final TextEditingController todoListController = TextEditingController();
  var selectedIndex = [];
  final newerDate = DateFormat.yMMMEd('en_US').format(DateTime.now());
  TodoListUpdateStatusModel updateModel = TodoListUpdateStatusModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) => getAllTodoFromDB());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    todoListController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 72,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: const TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 30,
                          color: Colors.white)),
                  const Text('PERSONAL',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20,
                          color: Colors.white))
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const History()))),
              child: SvgPicture.asset(
                'lib/assets/thin_plus.svg',
                width: 50,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (_todoListModel.isEmpty) {
                  return const Center(
                    child: Text(
                      'Use the plus button to add tasks',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.redAccent,
                  ));
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        TodoListModel todoListProperties =
                            _todoListModel[index];
                        //Parse the date into string to be formatted later on
                        DateTime dateCreated =
                            DateTime.parse(todoListProperties.date_created);
                        //Put the date in format: Tue, Nov 14, 2023
                        final todoListFormatedDate =
                            DateFormat.yMMMEd('en_US').format(dateCreated);
                        int indices = index + 1;

                        return Dismissible(
                          key: ValueKey(_todoListModel[index]),
                          background: Container(
                            color: Colors.yellow,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          confirmDismiss: (direction) async {
                            //TODO: look into this
                            if (direction == DismissDirection.endToStart) {
                              return showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Delete Todo'),
                                    content: const Text(
                                        'Are you sure you want to delete this Todo?'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            //TODO: come back and create a function to edit todo lists
                                            TodoListDeleteModel
                                                todoListBackend =
                                                TodoListDeleteModel(
                                              todo_id:
                                                  todoListProperties.todo_id,
                                            );
                                            deleteTodo(todoListBackend);
                                            Navigator.pop(context);
                                            todoListController.clear();
                                            setState(() {});
                                            scaffoldMessengerMenu(
                                                'Todo list deleted successfully');
                                          },
                                          child: const Text('Delete Todo')),
                                      ElevatedButton(
                                          onPressed: () {
                                            clearDialogBox(
                                                'Todo operation cancelled');
                                          },
                                          child: const Text('Cancel'))
                                    ],
                                  );
                                },
                              );
                            } else if (direction ==
                                DismissDirection.startToEnd) {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Edit Todo'),
                                    content: TextFormField(
                                      controller: todoListController,
                                      autofocus: true,
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            //TODO: come back and create a function to edit todo lists
                                            try {
                                              TodoListModel todoListBackend =
                                                  TodoListModel(
                                                todo_message:
                                                    todoListController.text,
                                                todo_id: indices.toString(),
                                              );
                                              print(
                                                  todoListBackend.todo_message);
                                              updateTodo(todoListBackend);
                                              Navigator.pop(context);
                                              todoListController.clear();
                                              setState(() {});
                                              scaffoldMessengerMenu(
                                                  'Todo list updated successfully');
                                            } catch (e) {
                                              scaffoldMessengerMenu(
                                                  'Error Occurred. Failed to edit todo list $e');
                                            }
                                          },
                                          child: const Text('Edit Todo')),
                                      ElevatedButton(
                                          onPressed: () {
                                            clearDialogBox(
                                                'Todo operation cancelled');
                                          },
                                          child: const Text('Cancel'))
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          secondaryBackground: Container(
                            color: Colors.red,
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          child: ListTile(
                            enableFeedback: true,
                            leading: RoundCheckBox(
                              isChecked: selectedIndex.contains(index),
                              onTap: (_) {
                                if (selectedIndex.contains(index)) {
                                  selectedIndex.remove(index); // unselect
                                  TodoListUpdateStatusModel
                                      todoListUpdateStatusModel =
                                      TodoListUpdateStatusModel(
                                          todo_id: todoListProperties.todo_id,
                                          isComplete: 0.toString());
                                  updateTodoStatus(todoListUpdateStatusModel);
                                } else {
                                  selectedIndex.add(index); // select

                                  TodoListUpdateStatusModel
                                      todoListUpdateStatusModel =
                                      TodoListUpdateStatusModel(
                                          todo_id: todoListProperties.todo_id,
                                          isComplete: 1.toString());
                                  updateTodoStatus(todoListUpdateStatusModel);
                                  scaffoldMessengerMenu('Task Finished');
                                  TodoHistoryModel todoHistoryModel =
                                      TodoHistoryModel(
                                          todo_message:
                                              todoListProperties.todo_message,
                                          isComplete: 1.toString(),
                                          todo_id: todoListProperties.todo_id,
                                          date_completed: DateTime.now().toString()
                                        );
                                  sendTodoHistoryTable(todoHistoryModel);
                                  selectedIndex
                                      .remove(index); // uncheck the box
                                }
                              },
                              animationDuration: const Duration(seconds: 0),
                              checkedColor: Colors.redAccent,
                            ),
                            title: Text(
                              todoListProperties.todo_message.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              todoListFormatedDate,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      shrinkWrap: false,
                      itemCount: _todoListModel.length,
                    ),
                  );
                }
              }),
          _todoListModel.isEmpty
              ? const Text('')
              : const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text('Swipe left or right on a todo for options',
                  style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Make this into an individual function
          //Function to display your create a new task
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Create Todo'),
                content: TextFormField(
                  controller: todoListController,
                  autofocus: true,
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          TodoCreateListModel todoListBackend =
                              TodoCreateListModel(
                            todo_message: todoListController.text,
                          );
                          print(todoListBackend.todo_message);
                          createTodo(todoListBackend);
                          Navigator.pop(context);
                          todoListController.clear();
                          setState(() {});
                          scaffoldMessengerMenu('Todo list created');
                        } catch (e) {
                          scaffoldMessengerMenu(
                              'Error Occurred. Failed to create todo list $e');
                        }
                      },
                      child: const Text('Create Todo')),
                  ElevatedButton(
                      onPressed: () =>
                          clearDialogBox('Todo operation cancelled'),
                      child: const Text('Cancel'))
                ],
              );
            },
          );
        },
        tooltip: 'Quick Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //Display Snackbar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      scaffoldMessengerMenu(String text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    ));
  }

//Clear Dialog Box
  void clearDialogBox(text) {
    //Cancel edit operation
    Navigator.pop(context);
    todoListController.clear();
    //fuctions like this help display a scaffold notification in the snackbar
    scaffoldMessengerMenu(text);
  }

//CRUD methods go here
  Future createTodo(TodoCreateListModel todoListModel) async {
    TodoController todoController = TodoController();
    await todoController
        .createTodoList(todoListModel)
        .then((success) => {print("Success Creating")});
  }

  Future getAllTodoFromDB() async {
    _todoListModel = await TodoController().getProfiles();
    _todoListModel.sort((a, b) =>
        a.todo_message.toString().compareTo(b.todo_message.toString()));
    _streamController.sink.add(_todoListModel);
  }

  Future updateTodo(TodoListModel todoListModel) async {
    TodoController todoController = TodoController();
    await todoController
        .updateTodoList(todoListModel)
        .then((success) => {print("Success Updating")});
  }

  Future deleteTodo(TodoListDeleteModel todoListModel) async {
    TodoController todoController = TodoController();
    await todoController
        .deleteTodoList(todoListModel)
        .then((success) => {print("Success Deleting")});
  }

  Future updateTodoStatus(
      TodoListUpdateStatusModel todoListUpdateStatusModel) async {
    TodoController todoController = TodoController();
    await todoController
        .updateTodoStatus(todoListUpdateStatusModel)
        .then((success) => {print("Success Updating Record")});
  }

  Future sendTodoHistoryTable(TodoHistoryModel todoHistoryModel) async {
    TodoController todoController = TodoController();
    await todoController
        .sendToHistoryTable(todoHistoryModel)
        .then((success) => {print("Success Sending To Table")});
  }
}
