import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:raj_app/display_data.dart";
import "package:raj_app/global.dart";

void main() {
  runApp(const Myapp());
}

class Person {
  String name;
  String city;
  int pincode;

  Person({required this.name, required this.city, required this.pincode});
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
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Center(
          child: Text("Add Data!"),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter Your Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: cityController,
              decoration: const InputDecoration(
                hintText: "Enter Your City",
                prefixIcon: Icon(Icons.map),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: pincodeController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Enter Pincode",
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String city = cityController.text;
                  int pincode = int.parse(pincodeController.text);

                  GlobalData.listdata
                      .add(Person(name: name, city: city, pincode: pincode));

                  nameController.clear();
                  cityController.clear();
                  pincodeController.clear();
                },
                child: const Text("Save Data!")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DisplayData()));
        },
        child: const Icon(Icons.flight),
      ),
    );
  }
}
