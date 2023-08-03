import 'package:flutter/material.dart';
const kNoteBox = 'note_box';
const baseUrl='https://phpstack-561490-3524079.cloudwaysapps.com/api-start-point/public/api/';
const Map<String, String> headers = {"Content-Type": "application/json"};
errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}


const List<Color> kColors = [
  Color(0xffFF008D),
  Color(0xff0DC4F4),
  Color(0xffD548B6),
  Color(0xff3D457F),
  Color(0xff00CF1C),
  Color(0xffE9DA0D),
];
