import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  var output;
  String dropdownValue;

  static const Map<String, String> lang = {
    "Hindi": "hi",
    "English": "en",
    "Urdu": "ur",
  };

  void trans() {
    translator
        .translate(textEditingController.text, to: "$dropdownValue")
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Multi Language Translator"),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                style: TextStyle(fontSize: 24),
                controller: textEditingController,
                onTap: () {
                  trans();
                },
                decoration: InputDecoration(
                    labelText: 'Type Here',
                    labelStyle: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Select Language here =>"),


                //ḍrop down starts here
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      trans();
                    });
                  },
                  items: lang
                      .map((string, value) {
                        return MapEntry(
                          string,
                          DropdownMenuItem<String>(
                            value: value,
                            child: Text(string),
                          ),
                        );
                      })
                      .values
                      .toList(),
                ),
                //dropdown eds here



              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text('Translated Text'),
            SizedBox(
              height: 10,
            ),
            Text(
              output == null ? "Please Select Language" : output.toString(),
              style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ));
  }
}
