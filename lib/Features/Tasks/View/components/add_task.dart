// ignore_for_file: must_be_immutable

import 'package:doit/Features/Tasks/Models/task_mod.dart';
import 'package:doit/Features/Tasks/View%20Model/task_vm.dart';
import 'package:doit/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  DateTime? _pickedDate;
  TimeOfDay? _pickedTime;

  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _taskController = TextEditingController();

  //
  final _formKey = GlobalKey<FormState>();

  Future<void> _onDatePick({required BuildContext context}) async {
    _pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime(2030),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (_pickedDate == null) return;
    _dateController.text = DateFormat('dd-MM-yyyy').format(_pickedDate!);
  }

  Future<void> _onTimePick({required BuildContext context}) async {
    _pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (_pickedTime == null) return;
    // Convert to 12-hour format
    final hour = _pickedTime!.hourOfPeriod;
    final minute = _pickedTime!.minute.toString().padLeft(2, '0');
    final period = _pickedTime!.period == DayPeriod.am ? 'AM' : 'PM';

    // Format: 12:11 AM
    _timeController.text = '${hour == 0 ? 12 : hour}:$minute $period';
  }

  _saveTask({required BuildContext context, required TaskModel task}) {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<TaskViewModel>(context, listen: false);
      provider.addTask(task);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final clrTheme = Theme.of(context).colorScheme;
    return Padding(
      padding: p16,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Add Task Title
            Text(
              "Add Task",
              style: txtTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
            gap16,
            // Date & Time
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(hintText: "eg: 12-11-2025"),
                    controller: _dateController,
                    readOnly: true,
                    onTap: () => _onDatePick(context: context),
                    style: txtTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                gap8,
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "eg: 12:11 AM",
                    ),
                    controller: _timeController,
                    readOnly: true,
                    onTap: () => _onTimePick(context: context),
                    style: txtTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            gap16,
            // Task Field
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "eg: Buy Fruits",
              ),
              controller: _taskController,
              style: txtTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
              validator: (val) =>
                  val == null || val.isEmpty ? "Add your task" : null,
            ),
            gap16,
            // Save & Cancel Button
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: p12,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: txtTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                gap8,
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      padding: p12,
                    ),
                    onPressed: () {
                      final task = TaskModel.create(
                          task: _taskController.text.trim(),
                          taskDate: _pickedDate,
                          taskTime: _pickedTime);
                      _saveTask(context: context, task: task);
                    },
                    child: Text(
                      "Save",
                      style: txtTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: clrTheme.scrim,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
