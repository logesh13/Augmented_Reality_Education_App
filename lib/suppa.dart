import 'package:flutter/material.dart';
import 'package:flutter_universe/user_simple_preferences.dart';

class suppaExample extends StatefulWidget {
  // const suppaExample({super.key});

  @override
  State<suppaExample> createState() => suppaExampleState();
}

class suppaExampleState extends State<suppaExample> {
  //string
  String progress = "";

  @override
  void initState() {
    super.initState();

    progress = userSimplePreferences.getProgress() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    print(progress + "odshrgoihwseoiprhgpiserpihgp");
    return Scaffold(
      appBar: AppBar(
        title: Text(progress),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await userSimplePreferences.setUsername("50");
      }),
    );
  }
}
