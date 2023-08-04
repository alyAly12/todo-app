
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo_task/app_consts.dart';
import '../../model/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

Color color =const Color(0xffE91E36);
  DateTime pickedDate = DateTime(08,04);

  addNote(NoteModel note)async{

    note.color =color.value;
    emit(AddNoteLoading());
  try{
    var notesBox=  Hive.box<NoteModel>(kNoteBox);
    await notesBox.add(note);
    emit(AddNoteSuccess());
  } catch(e){
    emit(AddNoteFailure(e.toString()));
  }
  }

}
