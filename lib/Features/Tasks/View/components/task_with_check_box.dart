import 'package:doit/Features/Tasks/Models/task_mod.dart';
import 'package:doit/Features/Tasks/View%20Model/task_vm.dart';
import 'package:doit/styles/palettes.dart';
import 'package:doit/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskWithCheckBox extends StatefulWidget {
  const TaskWithCheckBox(
      {super.key,
      required this.task,
      required this.taskProvider,
      required this.taskIndex});
  final TaskModel task;
  final int taskIndex;
  final TaskViewModel taskProvider;

  @override
  State<TaskWithCheckBox> createState() => _TaskWithCheckBoxState();
}

class _TaskWithCheckBoxState extends State<TaskWithCheckBox>
    with SingleTickerProviderStateMixin {
  late final _slidableController = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Slidable(
      controller: _slidableController,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onPressed: (context) {
              widget.taskProvider.deleteTask(widget.taskIndex);
            },
            foregroundColor: Palettes.redColor,
            icon: Icons.delete_outline_outlined,
          ),
          SlidableAction(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onPressed: (context) {},
            foregroundColor: Palettes.blueColor,
            icon: Icons.edit_outlined,
          ),
        ],
      ),
      child: Container(
        padding: p16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.secondary),
        child: Row(
          children: [
            Checkbox(
                value: widget.task.isDone,
                onChanged: (value) =>
                    widget.taskProvider.changeTaskStatus(widget.taskIndex)),
            Text(
              widget.task.task,
              style: txtTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  decoration: widget.task.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}
