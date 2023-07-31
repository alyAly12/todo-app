import 'package:flutter/material.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key, required this.color, required this.fun,});
  final Color color;
  final void Function() fun;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap:fun ,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
      ),
    );
  }
}
