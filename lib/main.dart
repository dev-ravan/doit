import 'package:doit/Features/Tasks/View%20Model/task_vm.dart';
import 'package:provider/provider.dart';

import 'Features/Tasks/View/tasks.dart';
import 'package:flutter/material.dart';
import 'styles/theme_modes.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TaskViewModel>(
      create: (context) => TaskViewModel(),
    ),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const TasksScreen(),
    );
  }
}
