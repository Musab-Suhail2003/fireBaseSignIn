import 'package:flutter/material.dart';
import 'package:flutter_firebase123/loginpage.dart';
import 'package:flutter_firebase123/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Loginpage(
        togglePages: togglePages
      );
    }
    else {
      return RegisterPage(
        togglePages: togglePages
      );
    }
  }
}