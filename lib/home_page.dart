import 'package:flutter/material.dart';
import 'package:flutter_universe/detail_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_universe/suppa.dart';
import 'artifacts_home_page.dart';
import 'color.dart';
import 'data.dart';
import 'samplescenepage.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:flutter_universe/main_animated_markers_map.dart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["Module-1 : Monuments", "Module-2 : Artifacts"];
  String selectedItem = "Module-1 : Monuments";

  @override
  Widget build(BuildContext context) {
    //drop-down menu  started.........
    var dropdownButton2 = DropdownButton(
      value: selectedItem,
      //data: ThemeData.dark(),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String newValue) {
        setState(() {
          selectedItem = newValue;
          onSelected(context, selectedItem);
        });
      },
      style: new TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );

    var dropdownButton = dropdownButton2;
    //drop-down menu  ended.........

    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Caffeinated Coders',
                      style: new TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    dropdownButton,
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: Monuments.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              monumentsInfo: Monuments[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 100),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 100),
                                      Text(
                                        Monuments[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 35,
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        Monuments[index].namee,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 17,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 32),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Go to Lesson',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(
                            tag: Monuments[index].position,
                            child: Image.asset(Monuments[index].iconImage,
                                width: 200),
                          ),
                          Positioned(
                            right: 24,
                            bottom: 60,
                            child: Text(
                              Monuments[index].position.toString(),
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 200,
                                color: primaryTextColor.withOpacity(0.08),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.view_in_ar),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SimpleScreen(pageIndex: "0")));
              },
            ),
            IconButton(
              icon: Icon(Icons.map_outlined),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainAnimatedMarkersMap()));
                //builder: (context) => suppaExample()));
              },
            ),
          ],
        ),
      ),
    );
  }

  onSelected(BuildContext context, selectedItem) {
    switch (selectedItem) {
      case "Module-2 : Artifacts":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => artifactHomePage()));

        break;
    }
  }
}
