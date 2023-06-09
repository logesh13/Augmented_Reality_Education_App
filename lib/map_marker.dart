import 'package:latlong2/latlong.dart';

class MapMarker {
  const MapMarker({
    this.image,
    this.title,
    this.address,
    this.location,
  });
  final String image;
  final String title;
  final String address;
  final LatLng location;
}

final _locations = [
  LatLng(27.171085, 78.045004),
  LatLng(27.175014, 78.042152),
  LatLng(27.170612278229573, 78.04841176119406),
  //LatLng(-12.0654067, -77.0257675),
];

const _path = 'assets/location.png';

final mapMarkers = [
  MapMarker(
    image: 'assets/Konark.png',
    title: 'Konark',
    address: 'konark address',
    location: _locations[0],
  ),
  MapMarker(
    image: 'assets/TajMahal.png',
    title: 'Tajmahal',
    address: 'Tajmahal address',
    location: _locations[1],
  ),
  MapMarker(
    image: 'assets/Uthira.png',
    title: 'Uthira',
    address: 'Uthira address',
    location: _locations[2],
  ),
];
