import 'package:flutter/cupertino.dart';
import 'package:todo_getx/models/todo_model.dart';

class TodoTile {
  final TodoModel todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  TodoTile({
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });
}
