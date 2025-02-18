// ignore_for_file: must_be_immutable

import 'package:doit/Features/Tasks/Models/task_mod.dart';
import 'package:doit/Features/Tasks/View%20Model/task_vm.dart';
import 'package:doit/Features/Tasks/View/components/add_task.dart';
import 'package:doit/Features/Tasks/View/components/task_with_check_box.dart';
import 'package:doit/styles/palettes.dart';
import 'package:doit/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime? _pickedDate;

  String _selectedDate = "Today";

  Future<void> _onDatePick({required BuildContext context}) async {
    _pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime(2030),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (_pickedDate == null) return;
    setState(() {
      _selectedDate = _pickedDate.toString().substring(0, 9) ==
              DateTime.now().toString().substring(0, 9)
          ? "Today"
          : DateFormat('dd MMM yyyy').format(_pickedDate!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.calendar_month_outlined),
              onPressed: () => _onDatePick(context: context),
            ),
          )
        ],
        title: RichText(
          text: TextSpan(
              text: "Do ",
              style: txtTheme.headlineMedium!
                  .copyWith(color: Palettes.primaryColor),
              children: [
                TextSpan(text: "It.", style: txtTheme.headlineMedium)
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => AddTask(),
            context: context,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, taskProvider, child) {
          final List<TaskModel> tasks = taskProvider.tasks;
          return Padding(
            padding: px16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap12,
                Text(
                  _selectedDate,
                  style: txtTheme.titleMedium,
                ),
                gap8,
                ListView.separated(
                    separatorBuilder: (context, index) => gap12,
                    itemCount: tasks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => TaskWithCheckBox(
                          task: tasks[index],
                          taskIndex: index,
                          taskProvider: taskProvider,
                        ))
              ],
            ),
          );
        },
      ),
    );
  }
}
