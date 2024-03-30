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

enum enumGender { female, male, other }

class _HomePageState extends State<HomePage> {
  bool valueCheck = false;
  bool valueSwitch = false;
  double valueSlide = 40;

  enumGender? _character = enumGender.female;

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 59);
  DateTime _date = DateTime.now();

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Center(
          child: Text("Neel Patel"),
        ),
      ),
      body: Column(
        children: [
          Checkbox(
            value: valueCheck,
            onChanged: (value) {
              valueCheck = value!;
              setState(() {});
            },
          ),
          Switch(
            value: valueSwitch,
            activeColor: Colors.black,
            onChanged: (value) {
              valueSwitch = value;
              setState(() {});
            },
          ),
          Slider(
            value: valueSlide,
            min: 0,
            max: 100,
            divisions: 10,
            activeColor: Colors.green,
            inactiveColor: Colors.red,
            thumbColor: Colors.black,
            label: valueSlide.toString(),
            onChanged: (value) {
              valueSlide = value;
              setState(() {});
            },
          ),
          ListTile(
            title: const Text("Female"),
            trailing: Radio<enumGender>(
              value: enumGender.female,
              groupValue: _character,
              onChanged: (value) {
                _character = value;
                setState(() {});
              },
            ),
          ),
          ListTile(
            title: const Text("Male"),
            trailing: Radio<enumGender>(
              value: enumGender.male,
              groupValue: _character,
              onChanged: (value) {
                _character = value;
                setState(() {});
              },
            ),
          ),
          ListTile(
            title: const Text("Other"),
            trailing: Radio<enumGender>(
              value: enumGender.other,
              groupValue: _character,
              onChanged: (value) {
                _character = value;
                setState(() {});
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: timeController,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_month),
                label: Text("Time Zone"),
              ),
              readOnly: true,
              onTap: () async {
                TimeOfDay? newtime =
                    await showTimePicker(context: context, initialTime: _time);

                if (newtime != null) {
                  String raj = newtime.toString();
                  raj = raj.substring(10, 15);
                  timeController.text = raj;
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: dateController,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_month),
                label: Text("Date Zone"),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? newdate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025));

                if (newdate != null) {
                  String neel = newdate.toString();
                  neel = neel.substring(0, 10);
                  dateController.text = neel;
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("CheckBox is $valueCheck"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("Switch on/off is $valueSwitch"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("Slider Value is $valueSlide"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("Gender Value is $_character"),
          ),
        ],
      ),
    );
  }
}
