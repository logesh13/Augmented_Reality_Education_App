import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class SimpleScreen extends StatefulWidget {
  String pageIndex;
  //SimpleScreen({Key key}) : super(key: key);
  SimpleScreen({Key key, @required this.pageIndex}) : super(key: key);
  @override
  _SimpleScreenState createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<SimpleScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  UnityWidgetController _unityWidgetController;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    //onUnityCreatedd(pageIndex);
  }

  @override
  void dispose() {
    _unityWidgetController.dispose();
    super.dispose();
    // onUnityCreatedd(widget.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      onUnityCreatedd(widget.pageIndex);
    });
    print(widget.pageIndex);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Monuments 3D view'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //onUnityCreatedd(widget.pageIndex);
            },
          ),
          // add more IconButton
        ],
      ),
      body: Card(
          margin: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              UnityWidget(
                onUnityCreated: _onUnityCreated,
                onUnityMessage: onUnityMessage,
                onUnitySceneLoaded: onUnitySceneLoaded,
                useAndroidViewSurface: true,
                borderRadius: BorderRadius.all(Radius.circular(70)),
              ),

              /*PointerInterceptor(
                child: Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("Rotation speed:"),
                        ),
                        Slider(
                          onChanged: (value) {
                            setState(() {
                              _sliderValue = value;
                            });
                            setRotationSpeed(value.toString());
                          },
                          value: _sliderValue,
                          min: 0.0,
                          max: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),*/
            ],
          )),
    );
  }

  /*void setRotationSpeed(String speed) {
    _unityWidgetController.postMessage(
      'Cube',
      'SetRotationSpeed',
      speed,
    );
  }*/
  void onUnityCreatedd(String a) {
    print("sroeuihgoiwheirhgpiwhepri");
    print(a);
    _unityWidgetController.postMessage("GameObject", "LoadScene", a);
  }

  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  void onUnitySceneLoaded(SceneLoaded scene) {
    print('Received scene loaded from unity: ${scene.name}');
    print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
  }

  // Callback that connects the created controller to the unity controller
  void _onUnityCreated(controller) {
    controller.resume();
    this._unityWidgetController = controller;
  }
}
