import 'package:flutter/material.dart';
import 'artifacts_data_page.dart';
import 'constants.dart';
import 'package:flutter_universe/samplescenepage.dart';
import 'package:translator/translator.dart';

class artifactDetailPage extends StatefulWidget {
  final ArtifactsInfo artifactsInfo;
  artifactDetailPage({Key key, @required this.artifactsInfo}) : super(key: key);

  @override
  State<artifactDetailPage> createState() => _artifactDetailPageState();
}

class _artifactDetailPageState extends State<artifactDetailPage> {
  GoogleTranslator translator = GoogleTranslator();
  List<String> items = [
    "Select_a_language",
    "English",
    "Tamil",
    "Hindi",
    "Malayalam",
  ];

  String selectedItem = "English";
  String cont1 = "";
  String cont2 = "";
  String cont3 = "";
  String ErrorText = "";

  @override
  Widget build(BuildContext context) {
    //below string used in translator
    if (selectedItem == "Select_a_language") {
      ErrorText = "select a language";
    } else {}

    //when a dropdown value changes it will load
    void trans(lan) async {
      switch (lan) {
        case "Select_a_language":
          cont1 = "";
          cont2 = "";
          cont3 = "";
          ErrorText = "select a language";
          break;
        case "English":
          await translator
              .translate(widget.artifactsInfo.description1, to: "en")
              .then((value) {
            setState(() {
              cont1 = value.toString();
            });
          });
          await translator
              .translate(widget.artifactsInfo.description2, to: "en")
              .then((value) {
            setState(() {
              cont2 = value.toString();
            });
          });
          await translator
              .translate(widget.artifactsInfo.description3, to: "en")
              .then((value) {
            setState(() {
              cont3 = value.toString();
            });
          });
          ErrorText = "";
          break;
        case "Tamil":
          await translator
              .translate(widget.artifactsInfo.description1, to: "ta")
              .then((value) {
            setState(() {
              cont1 = value.toString();
            });
          });
          await translator
              .translate(widget.artifactsInfo.description3, to: "ta")
              .then((value) {
            setState(() {
              cont2 = value.toString();
            });
          });
          await translator
              .translate(widget.artifactsInfo.description3, to: "ta")
              .then((value) {
            setState(() {
              cont3 = value.toString();
            });
          });
          ErrorText = "";
          break;
        case "Hindi":
          await translator
              .translate(widget.artifactsInfo.description1, to: "hi")
              .then((value) {
            setState(() {
              cont1 = value.toString();
            });
          });
          await translator
              .translate(widget.artifactsInfo.description3, to: "hi")
              .then((value) {
            setState(() {
              cont2 = value.toString();
            });
          });
          await translator
              .translate(widget.artifactsInfo.description3, to: "hi")
              .then((value) {
            setState(() {
              cont3 = value.toString();
            });
          });
          ErrorText = "";
          break;
        case "Malayalam":
          await translator
              .translate(widget.artifactsInfo.description1, to: "ml")
              .then((value) {
            setState(() {
              cont1 = value.toString();
            });
          });
          await translator
              .translate(widget.artifactsInfo.description3, to: "ml")
              .then((value) {
            setState(() {
              cont2 = value.toString();
            });
          });
          await translator
              .translate(widget.artifactsInfo.description3, to: "ml")
              .then((value) {
            setState(() {
              cont3 = value.toString();
            });
          });
          ErrorText = "";
          break;
      }
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
                  //first arti......................
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.artifactsInfo.position.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 247,
                          color: primaryTextColor.withOpacity(0.08),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            widget.artifactsInfo.iconImage1,
                            width: 230,
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 1),
                        Text(
                          widget.artifactsInfo.name1,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        IconButton(
                          icon: Image.asset('assets/3D.png'), //firt onclick
                          iconSize: 100,
                          onPressed: () {
                            PlainSUrfacePgaeRouter(context, 1);
                          },
                        ),
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
                            cont1 ?? '',
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
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: widget.artifactsInfo.images1.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  widget.artifactsInfo.images1[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                  Divider(color: Colors.black38),

                  //second arti......................
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.artifactsInfo.position2.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 247,
                          color: primaryTextColor.withOpacity(0.08),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            widget.artifactsInfo.iconImage2,
                            width: 230,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 1),
                        Text(
                          widget.artifactsInfo.name2,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        IconButton(
                          icon: Image.asset('assets/3D.png'), //second onclick
                          iconSize: 100,
                          onPressed: () {
                            PlainSUrfacePgaeRouter(context, 2);
                          },
                        ),

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
                            cont2 ?? '',
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
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: widget.artifactsInfo.images1.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  widget.artifactsInfo.images1[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),

                  Divider(color: Colors.black38),

                  //Third arti......................
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.artifactsInfo.position3.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 247,
                          color: primaryTextColor.withOpacity(0.08),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            widget.artifactsInfo.iconImage3,
                            width: 230,
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 1),
                        Text(
                          widget.artifactsInfo.name3,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        IconButton(
                          icon: Image.asset('assets/3D.png'), //Third onclick
                          iconSize: 100,
                          onPressed: () {
                            PlainSUrfacePgaeRouter(context, 3);
                          },
                        ),

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
                            cont3 ?? '',
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
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: widget.artifactsInfo.images1.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  widget.artifactsInfo.images1[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
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

  void PlainSUrfacePgaeRouter(BuildContext context, int pos) {
    // UnityWidgetController _unityWidgetController;

    if (widget.artifactsInfo.artindex == 1) {
      print("111111111111111111111111111111111111111");

      if (pos == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "10")),
        );
      }
      if (pos == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "11")),
        );
      }
      if (pos == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "12")),
        );
      }
    } else if (widget.artifactsInfo.artindex == 2) {
      print("22222222222222222222222222222222222222222222");

      if (pos == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "13")),
        );
      }
      if (pos == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "14")),
        );
      }
      if (pos == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "15")),
        );
      }
    } else if (widget.artifactsInfo.artindex == 3) {
      print("33333333333333333333333333333333333333333333333");

      if (pos == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "16")),
        );
      }
      if (pos == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "17")),
        );
      }
      if (pos == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "18")),
        );
      }
    } else if (widget.artifactsInfo.artindex == 4) {
      print("33333333333333333333333333333333333333333333333");

      if (pos == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "19")),
        );
      }
      if (pos == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "20")),
        );
      }
      if (pos == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SimpleScreen(pageIndex: "21")),
        );
      }
    }
  }
}
