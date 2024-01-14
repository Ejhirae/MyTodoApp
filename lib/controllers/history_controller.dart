import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_todo_app/models/history_model.dart';
import 'package:http/http.dart' as http;

class HistoryController {
  static const viewHistoryIp =
      'http://192.168.0.25/todo_app_challenge/MyTodoApp/lib/db/view_history.php';

  List<TodoHistoryModel> profilesFromJson(String jsonString) {
    final data = json.decode(jsonString);

    return List<TodoHistoryModel>.from(
        data.map((item) => TodoHistoryModel.fromMap(item)));
  }

  Future<List<TodoHistoryModel>> getHistory() async {
    final response = await http.get(Uri.parse(viewHistoryIp));
    if (response.statusCode == 200) {
      List<TodoHistoryModel> list = profilesFromJson(response.body);
      return list;
    } else {
      return <TodoHistoryModel>[];
    }
  }
}
