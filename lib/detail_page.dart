import 'package:flutter/material.dart';
import 'package:flutter_universe/data.dart';
import 'constants.dart';
import 'samplescenepage.dart';
import 'package:translator/translator.dart';

class DetailPage extends StatefulWidget {
  final MonumentsInfo monumentsInfo;
  DetailPage({Key key, @required this.monumentsInfo}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

const Alignment centerLeft = Alignment(-1.0, 0.0);

class _DetailPageState extends State<DetailPage> {
  GoogleTranslator translator = GoogleTranslator();

  @override
  void didChangeDependencies() {
    Locale myLocale = Localizations.localeOf(context);
    print('my locale ${myLocale}' + "kiruthika is myjhgegghgfcx");
    super.didChangeDependencies();
  }

  List<String> items = [
    "English",
    "Tamil",
    "Hindi",
    "Malayalam",
  ];

  String selectedItem = "English";
  String cont = "";
  String ErrorText = "";
  @override
  Widget build(BuildContext context) {
    //ans = false;

    //below string used in
    if (selectedItem == "Select_a_language") {
      ErrorText = "select a language";
    } else {}

    //when a dropdown value changes it will load
    void trans(lan) async {
      switch (lan) {
        case "Select_a_language":
          cont = "";
          ErrorText = "select a language";
          break;
        case "English":
          await translator
              .translate(widget.monumentsInfo.description, to: "en")
              .then((value) {
            setState(() {
              cont = value.toString();
            });
          });
          ErrorText = "";
          break;
        case "Tamil":
          await translator
              .translate(widget.monumentsInfo.description, to: "ta")
              .then((value) {
            setState(() {
              cont = value.toString();
            });
          });
          ErrorText = "";
          break;
        case "Hindi":
          await translator
              .translate(widget.monumentsInfo.description, to: "hi")
              .then((value) {
            setState(() {
              cont = value.toString();
            });
          });
          ErrorText = "";
          break;
        case "Malayalam":
          await translator
              .translate(widget.monumentsInfo.description, to: "ml")
              .then((value) {
            setState(() {
              cont = value.toString();
            });
          });
          ErrorText = "";
          break;
      }
      //translator.translate(cont, to: "ta").then((value) {
      //  setState(() {
      //   widget.monumentsInfo.description = value.toString();
      // });
      //});
    }

    Future.delayed(Duration(microseconds: 1), () {
      trans(selectedItem);
    });

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.monumentsInfo.position.toString(),
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 247,
                          color: primaryTextColor.withOpacity(0.08),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(widget.monumentsInfo.iconImage,
                              width: 230), //expected
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text(
                          widget.monumentsInfo.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        IconButton(
                          icon: Image.asset('assets/3D.png'),
                          iconSize: 100,
                          onPressed: () {
                            PlainSUrfacePgaeRouter(context);
                          },
                        ),
                        //DropdownMenu started.........
                        DropdownButton(
                            value: selectedItem,
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                selectedItem = newValue;
                                trans(selectedItem);
                              });
                            }),
                        //DropdownMenu ended.........
                        Text(
                          ErrorText,
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            cont ?? '',
                            maxLines: 590,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Monserat',
                              fontSize: 16,
                              color: contentTextColor,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              letterSpacing: 0.1,
                            ),
                          ),
                        ),

                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: Color.fromARGB(255, 0, 59, 254),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: widget.monumentsInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset(
                                  widget.monumentsInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
            /*Positioned(
              top: 60,
              left: 32,
              child:
            ),*/

            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void PlainSUrfacePgaeRouter(BuildContext context) {
    // UnityWidgetController _unityWidgetController;

    if (widget.monumentsInfo.position == 1) {
      print("111111111111111111111111111111111111111");
      //_unityWidgetController.postMessage("GameObject", "LoadScene", "1");
      //pageIndex = "1";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "1")),
      );
    } else if (widget.monumentsInfo.position == 2) {
      print("22222222222222222222222222222222222222222222");
      //pageIndex = "2";
      //_unityWidgetController.postMessage("GameObject", "LoadScene", "2");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "2")),
      );
    } else if (widget.monumentsInfo.position == 3) {
      print("33333333333333333333333333333333333333333333333");
      //pageIndex = "3";
      // _unityWidgetController.postMessage("GameObject", "LoadScene", "3");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "3")),
      );
    } else if (widget.monumentsInfo.position == 4) {
      print("444444444444444444444444444444444444444444");
      //pageIndex = "3";
      // _unityWidgetController.postMessage("GameObject", "LoadScene", "3");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "4")),
      );
    } else if (widget.monumentsInfo.position == 5) {
      print("5555555555555555555555555555555555");
      //pageIndex = "3";
      // _unityWidgetController.postMessage("GameObject", "LoadScene", "3");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "5")),
      );
    } else if (widget.monumentsInfo.position == 6) {
      print("6666666666666666666666666666666666666");
      //pageIndex = "3";
      // _unityWidgetController.postMessage("GameObject", "LoadScene", "3");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "6")),
      );
    } else if (widget.monumentsInfo.position == 7) {
      print("777777777777777777777777777777777777777777777");
      //pageIndex = "3";
      // _unityWidgetController.postMessage("GameObject", "LoadScene", "3");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "7")),
      );
    } else if (widget.monumentsInfo.position == 8) {
      print("8888888888888888888888888888888888888888888");
      //pageIndex = "3";
      // _unityWidgetController.postMessage("GameObject", "LoadScene", "3");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "8")),
      );
    } else if (widget.monumentsInfo.position == 9) {
      print("99999999999999999999999999999999999999999999999999");
      //pageIndex = "3";
      // _unityWidgetController.postMessage("GameObject", "LoadScene", "3");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "9")),
      );
    }
  }
}
