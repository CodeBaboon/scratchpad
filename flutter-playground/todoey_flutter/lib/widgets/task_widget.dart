import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.task,
    this.onChecked,
    this.onLongPress,
  });
  final Task task;
  final Function(bool?)? onChecked;
  final GestureLongPressCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
          decoration:
              task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        activeColor: Colors.lightBlueAccent,
        onChanged: onChecked,
      ),
      onLongPress: onLongPress,
    );
  }
}
