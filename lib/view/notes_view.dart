import 'package:flutter/material.dart';
import 'package:todo_task/view/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'TODO',
          style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.list))
        ],
      ),
      body: const NotesViewBody(),
    );
  }
}
