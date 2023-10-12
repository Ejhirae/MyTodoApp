import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyTodoApp extends StatefulWidget {
  final String title;
  const MyTodoApp({super.key, required this.title});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  List<String> tasks = [];
  final TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    taskController.dispose();
  }

  void createTask() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                int indices = index + 1;
                return ListTile(
                  leading: Text(indices.toString()),
                  title: Text(tasks[index]),
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
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () async {
                        tasks.add(taskController.text);
                        print(tasks);
                        Navigator.pop(context);
                        taskController.clear();
                        setState(() {});
                      },
                      child: Text('Create Todo')),
                  ElevatedButton(onPressed: null, child: Text('Cancel'))
                ],
              );
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
