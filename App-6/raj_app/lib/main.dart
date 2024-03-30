import "package:flutter/material.dart";
import "package:raj_app/first_page.dart";
import "package:raj_app/second_page.dart";

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
  int selectedIndex = 0;

  static const List<Widget> _widgets = <Widget>[
    FirstPage(),
    SecondPage(),
  ];

  void update(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Center(
          child: Text("Jasmini Patel"),
        ),
      ),
      body: Center(
        child: _widgets.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "FirstPage",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: "SecondPage",
          ),
        ],
        currentIndex: selectedIndex,
        backgroundColor: Colors.transparent,
        onTap: update,
      ),
    );
  }
}
