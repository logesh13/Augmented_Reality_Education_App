import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_universe/map_marker.dart';
import 'package:latlong2/latlong.dart';

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiZGllZ292ZWxvcGVyIiwiYSI6ImNrdGppMnh0bjFjZ3MzMm5sejRtcTlwbTQifQ.lwdbukS6p7bBWBuk2URBKg';

const MAPBOX_STYLE = "mapbox/satellite-v9";
const MARKER_COLOR = Color.fromARGB(255, 24, 200, 162);

const MARKER_SIZE_EXPANDED = 55.0;
const MARKER_SIZE_SHRINKED = 38.5;

final _myLocation = LatLng(27.175014, 78.042152);

class AnimatedMarkersMap extends StatefulWidget {
  const AnimatedMarkersMap({Key key}) : super(key: key);

  @override
  State<AnimatedMarkersMap> createState() => _AnimatedMarkersMapState();
}

class _AnimatedMarkersMapState extends State<AnimatedMarkersMap>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  AnimationController _animationController;

  int _selectedIndex = 0;
  //list to show png images
  List<Marker> _buildmarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(
        Marker(
          height: MARKER_SIZE_EXPANDED,
          width: MARKER_SIZE_EXPANDED,
          point: mapItem.location,
          builder: (_) {
            //when ever a location tapped a pagecounter will popo or move to particular location source

            return GestureDetector(
              onTap: () {
                _selectedIndex = i;
                setState(() {
                  _pageController.animateToPage(i,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.elasticOut);
                  print('Selected: ${mapItem.title}');
                });
              },
              child: _LocationMarker(
                selected: _selectedIndex == i,
              ),
            );
          },
        ),
      );
    }
    return _markerList;
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildmarkers();
    return Scaffold(
        appBar: AppBar(
          title: Text('Map view'),
        ),
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                minZoom: 5,
                maxZoom: 50,
                zoom: 1,
                center: _myLocation,
              ),
              nonRotatedLayers: [
                TileLayerOptions(
                    urlTemplate:
                        'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', //need to add link
                    additionalOptions: {
                      'accessToken': MAPBOX_ACCESS_TOKEN,
                      'id': MAPBOX_STYLE,
                    }),
                MarkerLayerOptions(
                  markers: _markers,
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                        point: _myLocation,
                        builder: (_) {
                          return _MyLocationMarker();
                        }),
                  ],
                ),
              ],
            ),
            //adding a new page
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              height: MediaQuery.of(context).size.height * 0.3,
              child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mapMarkers.length,
                  itemBuilder: (context, index) {
                    final item = mapMarkers[index];
                    return _MapItemDetails(
                      mapMarker: item,
                    );
                  }),
            )
          ],
        ));
  }
}

class _LocationMarker extends StatelessWidget {
  const _LocationMarker({Key key, this.selected = false}) : super(key: key);

  final bool selected;
  @override
  Widget build(BuildContext context) {
    final size = selected ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRINKED;
    return Center(
      child: AnimatedContainer(
        height: size,
        width: size,
        duration: const Duration(milliseconds: 400),
        child: Image.asset('assets/location.png'),
      ),
    );
  }
}

class _MyLocationMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: MARKER_COLOR,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _MapItemDetails extends StatelessWidget {
  const _MapItemDetails({Key key, @required this.mapMarker}) : super(key: key);

  final MapMarker mapMarker;

  @override
  Widget build(BuildContext context) {
    final _styleTitle = TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
    final _styleAddress = TextStyle(color: Colors.grey[800], fontSize: 14);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(mapMarker.image),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            mapMarker.title,
                            style: _styleTitle,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            mapMarker.address,
                            style: _styleAddress,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () => goToARView(),
                color: MARKER_COLOR,
                elevation: 6,
                child: Text(
                  "view In AR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }

}

goToARView() {
}
