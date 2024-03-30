import "package:flutter/material.dart";
import "package:raj/add_data.dart";
import "package:raj/display_data.dart";

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent,
          title: const Center(
            child: Text("Neel Patel!"),
          ),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Add Data Here!",
            ),
            Tab(
              icon: Icon(Icons.smart_display),
              text: "Display Data!",
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            AddData(),
            DisplayData(),
          ],
        ),
      ),
    );
  }
}
