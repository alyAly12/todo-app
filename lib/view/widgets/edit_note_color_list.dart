import 'package:flutter/material.dart';

import '../../app_consts.dart';
import '../../model/note_model.dart';
import 'colors_list_view.dart';
class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex ;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context,index){
            return  Padding(
              padding:  const EdgeInsets.all(1.0),
              child:  GestureDetector(
                onTap: (){
                  currentIndex =index;
                  widget.note.color = kColors[index].value;
                  setState(() {

                  });
                },
                child: ColorItemWidget(
                  color:kColors[index] ,
                  isActive:currentIndex ==index ,),
              ),
            );
          }),
    );
  }
}