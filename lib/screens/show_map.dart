import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatefulWidget {
  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  //Explicit
  static const totinnovate_LatLng = const LatLng(14.019996, 100.527670);
  CameraPosition cameraPosition = CameraPosition(
    target: totinnovate_LatLng,
    zoom: 16.0,
  );

  //Method
  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
          position: totinnovate_LatLng,
          markerId: MarkerId('TOTInnovation'),
          infoWindow: InfoWindow(
              title: 'สถาบันนวัตกรรมทีโอที', snippet: 'TOT Innovation Institute'),
          icon: BitmapDescriptor.defaultMarkerWithHue(60.0)),
    ].toSet();
  }

  myShowMap() {
    return GoogleMap(
      myLocationEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController googleMapController) {},
      markers: myMarker(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return myShowMap();
  }
}
