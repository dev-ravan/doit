import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TaskModel {
  final String id;
  final String task;
  final DateTime taskDate;
  final TimeOfDay taskTime;
  bool isDone;

  TaskModel(
      {required this.id,
      required this.task,
      required this.taskDate,
      required this.taskTime,
      required this.isDone});

  factory TaskModel.create(
          {required String task,
          required DateTime? taskDate,
          required TimeOfDay? taskTime,
          bool isDone = false}) =>
      TaskModel(
          id: const Uuid().v1(),
          task: task,
          taskDate: taskDate ?? DateTime.now(),
          taskTime: taskTime ?? TimeOfDay.now(),
          isDone: isDone);
}
