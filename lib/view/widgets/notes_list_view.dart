import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/cubites/notes_cubit/notes_cubit.dart';
import 'package:todo_task/model/note_model.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

// final data=const [
//   Colors.purple,
//   Colors.lightBlue,
//   Colors.purpleAccent,
//   Colors.blueAccent,
//   Colors.green,
//   Colors.yellow
// ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel>notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding:  const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: NoteItem(note: notes[index],),
                );
              }),
        );
      },
    );
  }
}