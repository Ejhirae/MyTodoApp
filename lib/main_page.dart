import 'package:flutter/material.dart';
import 'package:my_todo_app/history.dart';
import 'package:my_todo_app/todo.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget> listOfPages = [
    const MyTodoApp(
      title: 'MY TASKS',
    ),
    const History()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        enableFeedback: true,
        iconSize: 30,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.checklist,
              ),
              label: 'Todo',
              activeIcon: Icon(
                Icons.checklist,
                size: 30,
                color: Colors.redAccent,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
              activeIcon: Icon(
                Icons.history,
                size: 30,
                color: Colors.redAccent,
              )),
        ],
      ),
      body: IndexedStack(children: [listOfPages[_currentIndex]]),
    );
  }
}
