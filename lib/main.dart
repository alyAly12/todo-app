import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_task/app_consts.dart';
import 'package:todo_task/model/note_model.dart';
import 'package:todo_task/sinple_bloc_observer.dart';
import 'package:todo_task/view/notes_view.dart';

void main()async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox(kNoteBox);
  Bloc.observer=SimpleBlocObserver();
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

