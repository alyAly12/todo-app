import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_task/app_consts.dart';
import 'package:todo_task/view/notes_view.dart';

import '../services/login_service.dart';


class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key,});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  var obscureText = true;

  @override
  void dispose() {
    emailController;
    passwordController;
    passFocus;
    super.dispose();
  }

String _email ='';
  String _password ='';


  bool isLoading = false;
  void submitLoginForm()async{
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      formKey.currentState!.save();
        if (_email.isNotEmpty && _password.isNotEmpty) {
          http.Response response = await AuthServices.login(_email, _password);
          Map responseMap = jsonDecode(response.body);
          if (response.statusCode == 200) {
            formKey.currentState!.save();
            debugPrint('success');
            Navigator.pushNamed(context, NotesView.id);
          } else {
            errorSnackBar(context, responseMap.values.first);
          }
        } else {
          errorSnackBar(context, 'enter all required fields');
        }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Padding(
          padding:  EdgeInsets.all(8.0),
          child:  Text(
              'Login',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal
          ),
          ),
        ),

        Container(
          height: MediaQuery.of(context).size.height*0.5,
          width: double.infinity,
          decoration:  BoxDecoration(
            color:Colors.white.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40)
                ,topRight: Radius.circular(40)
            )
          ),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    child: Text('Email *',style: TextStyle(fontSize: 16),),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(passFocus),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value){
                      _email =value;
                    },
                    style: const TextStyle(color: Colors.black45),
                    decoration:  InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.5),
                      filled: true,
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    child: Text('Password *',style: TextStyle(fontSize: 16),),
                  ),
                  //password
                  TextFormField(
                    scrollController: ScrollController(),
                    textInputAction: TextInputAction.done,
                    controller: passwordController,
                    obscureText: obscureText,
                    onEditingComplete: () {
                      submitLoginForm();
                    },
                    keyboardType: TextInputType.multiline,
                    focusNode: passFocus,
                    onChanged: (value){
                      _password =value;
                    },
                    style: const TextStyle(color: Colors.red),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.5),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          )),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.07,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                            )
                          ),
                          onPressed: (){
                            submitLoginForm();
                          },
                          child: const Text('Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),

                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
