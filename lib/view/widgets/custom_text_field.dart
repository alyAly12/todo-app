import 'package:flutter/material.dart';

class CustomTitleTextField extends StatelessWidget {
  const CustomTitleTextField({super.key});

  @override
  Widget build(BuildContext context) {

    return  Container(
      height: 30,
      margin: const EdgeInsets.all(
        10.0,
      ),
      child: Stack(
        children: <Widget>[
          const TextField(
            cursorColor: Colors.purple,
            decoration: InputDecoration(
              // hintText: 'Name',
              // hintStyle: TextStyle(
              //   color: Colors.grey
              // ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 15.0,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide()
              )
            ),
          ),
          Positioned(
            bottom: -1,
            child: Container(
              height: 3,
              width: MediaQuery.of(context).size.width - 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.purpleAccent,
                    Colors.deepPurple,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBodyTextField extends StatelessWidget {
  const CustomBodyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      maxLines: 5,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.grey.shade400
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
              color: Colors.grey.shade400
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
              color: Colors.grey.shade400
          ),
        ),

      ),
    );
  }
}


