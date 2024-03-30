import "package:flutter/material.dart";
import "package:flutter/services.dart";

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
  String str = '';
  List<int> listdata = [];

  TextEditingController numController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Center(
          child: Text("App No 1"),
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
                hintText: "Enter Numbers",
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    int num = int.parse(numController.text);

                    listdata.add(num);
                    setState(() {
                      str = listdata.toString();
                    });
                    numController.clear();
                  },
                  child: const Text("Add Data"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    listdata.sort();
                    setState(() {
                      str = listdata.toString();
                    });
                  },
                  child: const Text("Sort Data"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    listdata.removeAt(0);
                    setState(() {
                      str = listdata.toString();
                    });
                  },
                  child: const Text("Remove Data"),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    int max = 0;

                    for (int char = 0; char < listdata.length; char++) {
                      if (listdata[char] > max) {
                        max = listdata[char];
                      }
                    }
                    print(max);
                  },
                  child: const Text("Max Data"),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("$str"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SecondPage(listdisplay: listdata.toString())));
        },
        child: const Icon(Icons.flight),
      ),
    );
  }
}

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  String listdisplay;
  SecondPage({super.key, required this.listdisplay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Center(
          child: Text("Display Data!"),
        ),
      ),
      body: Card(
        child: ListTile(
          title: Text("List Data is :- $listdisplay"),
        ),
      ),
    );
  }
}
