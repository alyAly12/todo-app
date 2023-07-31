import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_task/app_consts.dart';
import 'package:todo_task/view/notes_view.dart';

void main()async {
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo app',
      theme: ThemeData.light(
        useMaterial3: true
      ),
      home: const NotesView(),
    );
  }
}

