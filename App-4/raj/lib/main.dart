import "package:flutter/material.dart";

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
  Color color = Colors.black;

  void update(double alpha, double red, double green, double blue) {
    setState(() {
      color = Color.fromARGB(
          alpha.round(), red.round(), green.round(), blue.round());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Center(
          child: Text("Color Selection App"),
        ),
      ),
      body: Column(
        children: [
          Slider(
            value: color.alpha.toDouble(),
            min: 0.0,
            max: 255.0,
            activeColor: Colors.green,
            inactiveColor: Colors.red,
            onChanged: (value) {
              update(value, color.red.toDouble(), color.green.toDouble(),
                  color.blue.toDouble());
            },
          ),
          Slider(
            value: color.red.toDouble(),
            min: 0.0,
            max: 255.0,
            activeColor: Colors.green,
            inactiveColor: Colors.red,
            onChanged: (value) {
              update(color.alpha.toDouble(), value, color.green.toDouble(),
                  color.blue.toDouble());
            },
          ),
          Slider(
            value: color.green.toDouble(),
            min: 0.0,
            max: 255.0,
            activeColor: Colors.green,
            inactiveColor: Colors.red,
            onChanged: (value) {
              update(color.alpha.toDouble(), color.red.toDouble(), value,
                  color.blue.toDouble());
            },
          ),
          Slider(
            value: color.blue.toDouble(),
            min: 0.0,
            max: 255.0,
            activeColor: Colors.green,
            inactiveColor: Colors.red,
            onChanged: (value) {
              update(color.alpha.toDouble(), color.red.toDouble(),
                  color.green.toDouble(), value);
            },
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }
}
