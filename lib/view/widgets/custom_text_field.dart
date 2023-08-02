import 'package:flutter/material.dart';

class CustomTitleTextField extends StatelessWidget {
  const CustomTitleTextField({super.key, this.onSaved, this.onChange, this.hintTitle});
final void Function(String?)?onSaved;
  final void Function(String?)?onChange;
  final String? hintTitle;
  @override
  Widget build(BuildContext context) {

    return  Container(
      height: 42,
      margin: const EdgeInsets.all(
        10.0,
      ),
      child: Stack(
        children: <Widget>[
           TextFormField(
             textInputAction: TextInputAction.next,
             onSaved:onSaved ,
            onChanged:onChange ,
            validator: (value){
               if(value?.isEmpty ??true){
                 return 'Field is required';
               }
               return null;
            },
            cursorColor: Colors.purple,
            decoration:  InputDecoration(
              hintText: hintTitle,
              // hintStyle: TextStyle(
              //   color: Colors.grey
              // ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 15.0,
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none
              )
            ),
          ),
          Positioned(
            bottom: 1,
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
  const CustomBodyTextField({super.key, this.onSaved, this.onChange, this.hintSub});
  final void Function(String?)?onSaved;
  final void Function(String?)?onChange;
  final String? hintSub;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onChanged: onChange,
      textInputAction: TextInputAction.done,
      onSaved: onSaved,
       validator: (value){
      if(value?.isEmpty ??true){
        return 'Field is required';
      }
      return null;
    },
      maxLines: 5,
      decoration: InputDecoration(
        hintText:hintSub ,
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


