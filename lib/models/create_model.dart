class TodoCreateListModel {
  final todo_message;

  TodoCreateListModel({
    this.todo_message,
  });

  factory TodoCreateListModel.fromMap(map) {
    return TodoCreateListModel(
      todo_message: map['todo_message'],
    );
  }
  Map<String, dynamic> createTodoList() {
    return {
      'todo_message': todo_message,
    };
  }
}