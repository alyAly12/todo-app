
import 'package:flutter/material.dart';
import 'package:todo_task/view/widgets/notes_view_body.dart';
import 'package:todo_task/view/widgets/side_drawer.dart';



class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
          onPressed: (){

          },
        child: const Icon(Icons.add,color: Colors.white,size: 30,),
      ),
      appBar: AppBar(
        elevation: 0.0,
        shadowColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: const Text(
          'TODO',
          style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.normal),
        ),

      ),
      body: const NotesViewBody(),
    );
  }
}

