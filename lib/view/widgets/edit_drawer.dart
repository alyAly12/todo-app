import 'package:flutter/material.dart';
import 'package:todo_task/view/widgets/custom_text_field.dart';

import 'color_picker_widget.dart';


class EditDrawer extends StatefulWidget {
  const EditDrawer({super.key});

  @override
  State<EditDrawer> createState() => _EditDrawerState();
}

class _EditDrawerState extends State<EditDrawer> {
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
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Drawer(
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
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: color.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ColorPickerWidget(color: color[index], fun: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        } ,),
                      );
                    }),
              ),
              const Text('Name',
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
              ),

              //  TODO add custom text field
              const CustomTitleTextField(),
              const SizedBox(height: 20,),
              const Text('Description',
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding:  EdgeInsets.all(6.0),
                child: CustomBodyTextField(),
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
                        onTap: (){},
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
                        onTap: (){},
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
      ),
    );
  }
}
