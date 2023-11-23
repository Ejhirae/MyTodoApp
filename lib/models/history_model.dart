class TodoHistoryModel {
  final todo_id;
  final isComplete;
  final todo_message;

  TodoHistoryModel(
      {this.todo_id, this.todo_message, this.isComplete});

  factory TodoHistoryModel.fromMap(map) {
    return TodoHistoryModel(
      todo_id: map['todo_id'],
      todo_message: map['todo_message'],
      isComplete: map['is_complete'],
    );
  }
  Map<String, dynamic> toHistoryTable() {
    return {
      'todo_id': todo_id,
      'todo_message': todo_message,
      'is_complete': isComplete
    };
  }
}
