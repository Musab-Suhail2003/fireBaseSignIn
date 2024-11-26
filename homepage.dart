import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true, backgroundColor: Theme.of(context).colorScheme.primary, 
        title: Text("logged in", style: TextStyle(color: Theme.of(context).colorScheme.tertiary))
      ),

    );
  }
}