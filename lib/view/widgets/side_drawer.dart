import 'package:flutter/material.dart';
import 'package:todo_task/view/widgets/custom_text_field.dart';

import 'color_picker_widget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
                'New Task',
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
             const SizedBox(height: 20,),
            //  TODO add custom text field
              const CustomTitleTextField(),
              const SizedBox(height: 20,),
              const Padding(
                padding:  EdgeInsets.all(6.0),
                child: CustomBodyTextField(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
