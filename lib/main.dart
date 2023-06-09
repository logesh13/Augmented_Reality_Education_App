import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter_universe/user_simple_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await userSimplePreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
