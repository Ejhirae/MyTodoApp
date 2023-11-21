import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_todo_app/models/create_model.dart';
import 'package:my_todo_app/models/history_model.dart';

import 'package:my_todo_app/models/todo_model.dart';

class TodoController {
  static const viewIp = 'http://192.168.0.15/my_todo_app/lib/db/view.php';
  static const createIp = 'http://192.168.0.15/my_todo_app/lib/db/create.php';
  static const updateIp = 'http://192.168.0.15/my_todo_app/lib/db/update.php';
  static const deleteIp = 'http://192.168.0.15/my_todo_app/lib/db/delete.php';
  static const updateStatusIp =
      'http://192.168.0.15/my_todo_app/lib/db/update_record.php';

  static const sendToTableIp =
      'http://192.168.0.15/my_todo_app/lib/db/move_to_new_table.php';

  List<TodoListModel> profilesFromJson(String jsonString) {
    final data = json.decode(jsonString);

    return List<TodoListModel>.from(
        data.map((item) => TodoListModel.fromMap(item)));
  }

  Future<List<TodoListModel>> getProfiles() async {
    final response = await http.get(Uri.parse(viewIp));
    if (response.statusCode == 200) {
      List<TodoListModel> list = profilesFromJson(response.body);
      return list;
    } else {
      return <TodoListModel>[];
    }
  }

  Future<String> createTodoList(TodoCreateListModel createTodoListModel) async {
    final response = await http.post(Uri.parse(createIp),
        body: createTodoListModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Error';
    }
  }

  Future<String> updateTodoList(TodoListModel updateTodoListModel) async {
    final response = await http.post(Uri.parse(updateIp),
        body: updateTodoListModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Error updating database';
    }
  }

  Future<String> deleteTodoList(TodoListDeleteModel deleteTodoListModel) async {
    final response = await http.post(Uri.parse(deleteIp),
        body: deleteTodoListModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Error deleting database';
    }
  }

  Future<String> updateTodoStatus(
      TodoListUpdateStatusModel updateStatus) async {
    final response = await http.post(Uri.parse(updateStatusIp),
        body: updateStatus.updateStatus());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Error updating database';
    }
  }

    Future<String> sendToHistoryTable(
      TodoHistoryModel todoHistoryModel) async {
    final response = await http.post(Uri.parse(sendToTableIp),
        body: todoHistoryModel.toHistoryTable());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Error sending to history table';
    }
  }
}
