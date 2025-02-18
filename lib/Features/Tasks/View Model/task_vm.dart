import 'package:doit/Features/Tasks/Models/task_mod.dart';
import 'package:flutter/material.dart';

class TaskViewModel extends ChangeNotifier {
  final List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  // Add task
  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  // Change task status
  void changeTaskStatus(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  // Delete task
  void deleteTask(int index) {
    final removeTaskId = _tasks[index].id;
    _tasks.removeWhere(
      (task) => task.id == removeTaskId,
    );
    notifyListeners();
  }
}
