import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './task_widget.dart';
import 'package:todoey_flutter/providers/task_provider.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) => ListView.builder(
        itemBuilder: (context, index) {
          final task = taskProvider.tasks[index];
          return TaskWidget(
            task: task,
            onChecked: (bool? value) {
              taskProvider.toggleDone(task);
            },
            onLongPress: () => taskProvider.deleteTask(task),
          );
        },
        itemCount: taskProvider.taskCount,
      ),
    );
  }
}
