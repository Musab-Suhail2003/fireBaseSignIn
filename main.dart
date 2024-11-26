import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase123/firebase_options.dart';
import 'package:flutter_firebase123/login_or_register.dart';
import 'package:flutter_firebase123/loginpage.dart';
import 'package:flutter_firebase123/mycolors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myColors,
      home: const LoginOrRegister(),
      debugShowCheckedModeBanner: false,
    );
  }
}
