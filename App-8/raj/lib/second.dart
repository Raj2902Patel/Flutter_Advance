import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  String answer;
  SecondPage({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(
          child: Text("Second Page!"),
        ),
      ),
      body: Center(
        child: Text("$answer"),
      ),
    );
  }
}
