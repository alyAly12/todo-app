import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/cubites/notes_cubit/notes_cubit.dart';
import 'package:todo_task/model/note_model.dart';
import 'package:todo_task/view/widgets/custom_text_field.dart';
import 'edit_note_color_list.dart';




class EditDrawer extends StatefulWidget {
  const EditDrawer({super.key, required this.note});
final NoteModel note;
  @override
  State<EditDrawer> createState() => _EditDrawerState();
}

class _EditDrawerState extends State<EditDrawer> {
   String? title,subTitle;
  final List<Color> color=[
    Colors.pink,
    Colors.lightBlue,
    Colors.pinkAccent,
    Colors.blueGrey,
    Colors.green,
    Colors.yellow,
  ];
  late int selectedIndex ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
  builder: (context, state) {
    return Drawer(
      width: MediaQuery.of(context).size.width*0.8,
      child:   Padding(
        padding:  const EdgeInsets.symmetric(vertical: 26,horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Update Task',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              'Color',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey
              ),
            ),
            const SizedBox(height: 15,),
            //TODO : edit color list
             EditNoteColorList(note: widget.note,),
            const SizedBox(height: 15,),
            const Text('Name',
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
            ),

            //  TODO add custom text field
             CustomTitleTextField(
               hintTitle: widget.note.title,
              onChange:(value){
                title =value;
              } ,

            ),
            const SizedBox(height: 20,),
            const Text('Description',
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
            ),
             Padding(
              padding:  const EdgeInsets.all(6.0),
              child: CustomBodyTextField(
                hintSub: widget.note.subTitle,
                onChange: (value){
                  subTitle = value;
                },
              ),
            ),
            const SizedBox(height: 20,),
            const Text('Date',
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
            ),
            //TODO date picker
            Container(
              width: double.infinity,
              height: 60,
              color: Colors.red,
            ),
            const SizedBox(height: 20,),
            // TODO time picker
            const Text('Time',
              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              height: 60,
              color: Colors.red,
            ),
            const SizedBox(height: 20,),
            FittedBox(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                    child: GestureDetector(
                      onTap: (){
                        //TODO
                        widget.note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 170,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,

                          borderRadius: BorderRadius.circular(45),
                        ),
                        child:  const Center(
                          child: Text('Delete',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 24
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                    child: GestureDetector(
                      onTap: (){
                        widget.note.title =title ?? widget.note.title;
                        widget.note.subTitle =subTitle ?? widget.note.subTitle;
                        widget.note.save();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 170,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          gradient:  LinearGradient(
                            begin:Alignment.topRight ,
                            end: Alignment.bottomLeft,
                            stops:const [0.4,0.6,],
                            colors: [Colors.lightBlue.shade400,Colors.blue,],
                          ),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child:  const Center(
                          child: Text('Update',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 24
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  },
);
  }
}


