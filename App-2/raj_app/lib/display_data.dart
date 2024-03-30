import 'package:flutter/material.dart';
import 'package:raj_app/delete_data.dart';
import 'package:raj_app/global.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Center(
          child: Text("Display Data!"),
        ),
      ),
      body: ListView.builder(
        itemCount: GlobalData.listdata.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("Name is ${GlobalData.listdata[index].name}"),
              subtitle: Text(
                  "City is ${GlobalData.listdata[index].city} --- Pincode is :- ${GlobalData.listdata[index].pincode}"),
              onTap: () {
                GlobalData.selectedIndex = index;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeletePage()));
              },
            ),
          );
        },
      ),
    );
  }
}
