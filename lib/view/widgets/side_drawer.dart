import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/cubites/add_note_cubit/add_note_cubit.dart';
import 'package:todo_task/model/note_model.dart';
import 'package:todo_task/view/widgets/custom_text_field.dart';

import 'color_picker_widget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  final GlobalKey<FormState> formKey = GlobalKey();
  final List<Color> color = [
    Colors.pink,
    Colors.lightBlue,
    Colors.pinkAccent,
    Colors.blueGrey,
    Colors.green,
    Colors.yellow,
  ];
  late int selectedIndex;

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle, date, time, myColor;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
          //  TODO add error message
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ?true:false,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Drawer(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 26, horizontal: 12),
                  child: Form(
                    autovalidateMode: autoValidateMode,
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Task',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Color',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: color.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ColorPickerWidget(
                                    color: color[index],
                                    fun: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                  ),
                                );
                              }),
                        ),
                        const Text(
                          'Name',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),

                        //  TODO add custom text field
                        CustomTitleTextField(
                          onSaved: (value) {
                            title = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: CustomBodyTextField(
                            onSaved: (value) {
                              subTitle = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Date',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        //TODO date picker
                        Container(
                          width: double.infinity,
                          height: 60,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // TODO time picker
                        const Text(
                          'Time',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                var noteModel = NoteModel(
                                    title: title!,
                                    subTitle: subTitle!,
                                    date: DateTime.now().toString(),
                                    color: Colors.blue.value);
                                BlocProvider.of<AddNoteCubit>(context)
                                    .addNote(noteModel);
                              } else {
                                autoValidateMode = AutovalidateMode.always;
                              }
                            },
                            child: Container(
                              width: 170,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: const [
                                    0.4,
                                    0.6,
                                  ],
                                  colors: [
                                    Colors.lightBlue.shade400,
                                    Colors.blue,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(45),
                              ),
                              child:const Center(
                                child:
                                 Text(
                                  'Add',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
