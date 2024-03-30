import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raj/global.dart';
import 'package:raj/student_data.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController pmarkController = TextEditingController();
  TextEditingController jmarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Center(
          child: Text("Add Data Here!"),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: numberController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Enter Number",
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: pmarkController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Enter Python Marks",
                prefixIcon: Icon(Icons.mark_chat_read_rounded),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: jmarkController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Enter Java Marks",
                prefixIcon: Icon(Icons.mark_chat_read_rounded),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String number = numberController.text;
                  int pmark = int.parse(pmarkController.text);
                  int jmark = int.parse(jmarkController.text);

                  GlobalData.listdata.add(Student(
                      name: name, number: number, pmark: pmark, jmark: jmark));

                  nameController.clear();
                  numberController.clear();
                  pmarkController.clear();
                  jmarkController.clear();
                },
                child: const Text("Save Data!")),
          ),
        ],
      ),
    );
  }
}
