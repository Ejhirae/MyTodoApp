import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class MyTodoApp extends StatefulWidget {
  final String title;
  const MyTodoApp({super.key, required this.title});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  List<String> tasks = [];
  final TextEditingController taskController = TextEditingController();
  bool _isChecked = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    taskController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: TextStyle(fontFamily: 'Arial', fontSize: 30)),
                  Text('PERSONAL',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: 'Arial', fontSize: 20))
                ],
              ),
            ),
            SvgPicture.asset(
              'lib/assets/thin_plus.svg',
              width: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tasks.isEmpty
              ? const Center(
                  child: Text('Use the plus button to add tasks'),
                )
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      int indices = index + 1;
                      return Dismissible(
                        key: ValueKey(tasks[index]),
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
                          if (direction == DismissDirection.endToStart) {
                            setState(() {
                              tasks.removeAt(index);
                              indices = index - 1;
                            });

                            print(indices);
                            print(tasks);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Todo list deleted'),
                              duration: Duration(seconds: 2),
                            ));
                          } else if (direction == DismissDirection.startToEnd) {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Edit Todo'),
                                  content: TextFormField(
                                    controller: taskController,
                                    autofocus: true,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          tasks[index] = taskController.text;
                                          print(tasks);
                                          Navigator.pop(context);
                                          taskController.clear();
                                          setState(() {});
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text('Todo list edited'),
                                            duration: Duration(seconds: 2),
                                          ));
                                        },
                                        child: const Text('Edit Todo')),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          taskController.clear();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                'Todo operation cancelled'),
                                            duration: Duration(seconds: 2),
                                          ));
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
                            onTap: (p0) => null,
                            animationDuration: Duration(seconds: 1),
                            checkedColor: Colors.redAccent,
                            
                          ),
                          
                          title: Text(tasks[index]),
                          subtitle: Text(
                            DateFormat.yMMMEd('en_US').format(DateTime.now()),
                          ),
                        ),
                      );
                    },
                    shrinkWrap: false,
                    itemCount: tasks.length,
                  ),
                )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Create Todo'),
                content: TextFormField(
                  controller: taskController,
                  autofocus: true,
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () async {
                        tasks.add(taskController.text);

                        print(tasks);
                        Navigator.pop(context);
                        taskController.clear();
                        setState(() {});
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Todo list created'),
                          duration: Duration(seconds: 2),
                        ));
                      },
                      child: const Text('Create Todo')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        taskController.clear();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Todo operation cancelled'),
                          duration: Duration(seconds: 2),
                        ));
                      },
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
}
