class TodoListModel {
  final todo_message;
  final date_created;
  final todo_id;

  TodoListModel({
    this.todo_message,
    this.date_created,
    this.todo_id,
  });

  factory TodoListModel.fromMap(map) {
    return TodoListModel(
      date_created: map['date_created'],
      todo_message: map['todo_message'],
      todo_id: map['todo_id'],
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      'todo_message': todo_message,
      'todo_id': todo_id,
      // 'date_created': date_created,
    };
  }
}

class TodoListDeleteModel {
  final todo_id;

  TodoListDeleteModel({
    this.todo_id,
  });

  factory TodoListDeleteModel.fromMap(map) {
    return TodoListDeleteModel(
      todo_id: map['todo_id'],
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      'todo_id': todo_id,
    };
  }
}

class TodoListUpdateStatusModel {
  final todo_id;
  final isComplete;

  TodoListUpdateStatusModel({this.todo_id, this.isComplete});

  factory TodoListUpdateStatusModel.fromMap(map) {
    return TodoListUpdateStatusModel(
      todo_id: map['todo_id'],
      isComplete: map['is_complete'],
    );
  }
  Map<String, dynamic> updateStatus() {
    return {'todo_id': todo_id, 'is_complete': isComplete};
  }
}
