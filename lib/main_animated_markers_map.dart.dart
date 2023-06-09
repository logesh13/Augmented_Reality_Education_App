import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_universe/Animated_Markers_Map.dart';

class MainAnimatedMarkersMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: AnimatedMarkersMap(),
    );
  }
}
