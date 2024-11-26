import 'package:flutter/material.dart';
import 'package:flutter_firebase123/auth_service.dart';
import 'package:flutter_firebase123/homepage.dart';
import 'package:flutter_firebase123/mybutton.dart';
import 'package:flutter_firebase123/textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? togglePages;

  RegisterPage({super.key, required this.togglePages});

  final _username = TextEditingController();
  final _password = TextEditingController();
  final _repassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Register", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          newTextField(hintText: 'Email', password: false, controller:  _username),
          const SizedBox(height: 20,),
          newTextField(hintText: 'Password', password: true, controller: _password),
          const SizedBox(height: 20,),
          newTextField(hintText: 'Password', password: true, controller: _repassword),
          const SizedBox(height: 20,),
          newButton(text: "Enter", ontap: () => register(context, _username.text, _password.text, _repassword.text)),
          GestureDetector(
              onTap: togglePages, 
              child: Text('Already have an account? Login now', 
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary, 
                fontWeight: FontWeight.bold),
                )
            )
        ],
      ),
    );
  }
  register(BuildContext c, String email, String pass, String repass) async{
    final auth = AuthService();
    if(pass == repass) {
      try{
        String? status = await auth.registration(email: email, password: pass);
        if(status == 'Success'){
            Navigator.push(c, MaterialPageRoute(builder: (c) => Homepage()));
        }else{
            showDialog(context: c, builder: 
            (context) => AlertDialog(
              title: const Text("Error logging in :("),
              content: Text(status??'error'),
            ));
      }
      }catch (e){ 
          showDialog(context: c, builder: 
          (context) => AlertDialog(
          title: const Text("Error Signing up :("),
          content: Text(e.toString()),
          )
          );
      }
    }
    else{
      showDialog(context: c, builder: 
        (context) => const AlertDialog(
        title: Text("Passwords do not match try again"),
      ));
    }
    
  }

}