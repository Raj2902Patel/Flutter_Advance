import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raj/global.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  String str = '';
  int pmark = 0;
  int jmark = 0;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(
          child: Text("Display Data!"),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Search Data Here!",
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  for (int char = 0;
                      char < GlobalData.listdata.length;
                      char++) {
                    if (GlobalData.listdata[char].number ==
                        searchController.text) {
                      str = GlobalData.listdata[char].name;
                      pmark = GlobalData.listdata[char].pmark;
                      jmark = GlobalData.listdata[char].jmark;

                      setState(() {});
                    }
                  }
                },
                child: const Text("Search Data?")),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("$str & $pmark & $jmark"),
          ),
        ],
      ),
    );
  }
}
