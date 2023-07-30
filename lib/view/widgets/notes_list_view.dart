import 'package:flutter/material.dart';

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
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return  const Padding(
            padding:  EdgeInsets.symmetric(vertical: 8),
            child: NoteItem(),
          );
        });
  }
}