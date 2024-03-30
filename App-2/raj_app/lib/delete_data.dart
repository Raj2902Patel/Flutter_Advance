import 'package:flutter/material.dart';
import 'package:raj_app/display_data.dart';
import 'package:raj_app/global.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(
          child: Text("Delete Data!"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
                "Name is -${GlobalData.listdata[GlobalData.selectedIndex].name}"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
                "City is -${GlobalData.listdata[GlobalData.selectedIndex].city}"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
                "Pincode is -${GlobalData.listdata[GlobalData.selectedIndex].pincode}"),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  GlobalData.listdata.removeAt(GlobalData.selectedIndex);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DisplayData()));
                },
                child: const Text("Delete Data?")),
          ),
        ],
      ),
    );
  }
}
