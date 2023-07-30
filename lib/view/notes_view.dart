import 'package:flutter/material.dart';
import 'package:todo_task/view/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
          onPressed: (){},
        child: const Icon(Icons.add,color: Colors.white,),
      ),
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
