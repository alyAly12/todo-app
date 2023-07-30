import 'package:flutter/material.dart';

import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
      child: Column(
        children: [
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}


