import 'package:flutter/material.dart';
import 'package:todo_task/model/note_model.dart';
import 'package:todo_task/view/widgets/edit_drawer.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note, });
final NoteModel note;

  @override
  Widget build(BuildContext context) {
    DateTime pickedDate =DateTime(08,04);
    // var currentDate = DateTime.now();
    // var formattedCurrentDate = DateFormat.Md().format(currentDate);
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditDrawer(note: note,)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white12
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration:   BoxDecoration(
                shape: BoxShape.circle,
                color: Color(note.color)
              ),
            ),
            const SizedBox(width: 15,),
             Expanded(
              child: Text(note.subTitle,
              maxLines: 1,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
              ),
            ),
            const SizedBox(width: 15,),
            Column(
              children: [
                Text(
                  note.date,
                  // note.date,

                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,

                ),
                ),
                Text('$hour:$minute',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600
                ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
