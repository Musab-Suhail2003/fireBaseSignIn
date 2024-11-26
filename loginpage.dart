import 'package:flutter/material.dart';
import 'package:flutter_firebase123/auth_service.dart';
import 'package:flutter_firebase123/homepage.dart';
import 'package:flutter_firebase123/mybutton.dart';
import 'package:flutter_firebase123/textfield.dart';

class Loginpage extends StatelessWidget {
  final void Function()? togglePages;

  Loginpage({super.key, required this.togglePages});
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Login", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          newTextField(hintText: 'User Name', password: false, controller:  _username),
          const SizedBox(height: 20,),
          newTextField(hintText: 'Password', password: true, controller: _password),
          const SizedBox(height: 20,),
          newButton(text: "Enter", ontap: () async =>login(context, _username.text, _password.text)),
          GestureDetector(
              onTap: togglePages, 
              child: Text('Dont have an account? Register now', 
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary, 
                fontWeight: FontWeight.bold),
                )
            )
        ],
      ),
      floatingActionButton: newButton(text: 'SignIn With Google', ontap: () async => googleSignIn),
    );
  }

  Future<void> login(BuildContext c, String email, String pass) async {
    final auth = AuthService();

    try{
          String? status = await auth.login(email: email, password: pass);
          if(status == 'Success'){
            Navigator.push(c, MaterialPageRoute(builder: (c) => Homepage()));
          }else{
            showDialog(context: c, builder: 
            (context) => AlertDialog(
              title: const Text("Error logging in :("),
              content: Text(status??'error'),
            )
      );
          }
    }catch (e){
      showDialog(context: c, builder: 
      (context) => AlertDialog(
        title: const Text("Error logging in :("),
        content: Text(e.toString()),
      )
      );
    }
    
  }

  googleSignIn(){
    var auth = AuthService();
    return auth.signInWithGoogle();
  }
}