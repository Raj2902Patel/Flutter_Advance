import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:raj/second.dart";

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
  int ans = 0;
  String result = '';
  TextEditingController numController = TextEditingController();

  void func() {
    ans = int.parse(numController.text);
    setState(() {
      if (ans % 2 == 0) {
        result = "Even Number";
      } else {
        result = "Odd Number";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Center(
          child: Text("Last App"),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: numController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.numbers),
                hintText: "Enter Number For Result",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child:
                ElevatedButton(onPressed: func, child: const Text("RAJ PATEL")),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("$result"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondPage(answer: result)));
        },
        child: const Icon(Icons.flight),
      ),
    );
  }
}
