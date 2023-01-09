import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
    this.onAddPressed,
  });

  final Function(Task)? onAddPressed;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 40.0,
        ),
        decoration: roundedContainerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              controller: taskTextController,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: () {
                widget.onAddPressed!(Task(name: taskTextController.text));
                taskTextController.clear();
              },
              color: Colors.lightBlueAccent,
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
