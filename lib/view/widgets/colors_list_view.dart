import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_consts.dart';
import '../../cubites/add_note_cubit/add_note_cubit.dart';

class ColorItemWidget extends StatelessWidget {
  const ColorItemWidget({super.key, required this.isActive, required this.color,});
final bool isActive;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive?
     CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 22,
      ),
    )
        : CircleAvatar(
      radius: 25,
      backgroundColor: color,
    );
  }
}
class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {

  int currentIndex =0;
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
                  BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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
