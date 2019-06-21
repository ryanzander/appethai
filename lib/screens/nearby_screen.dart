import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import '../resources/api_keys.dart';
import '../resources/constants.dart';

class NearbyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NearbyState();
  }
}

class NearbyState extends State<NearbyScreen> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _position;
  bool _gotLocation;
  double _lat;
  double _lon;
  String _apiKey;
  List<Marker> _markers = [];
  var _location = Location();

  @override
  void initState() {
    super.initState();

    _gotLocation = false;
    _position = CameraPosition(
      target: LatLng(45.521563, -122.677433),
      zoom: 13,
    );

    _getLocation();
  }

// location plugin
// This plugin does NOT work for Android if the user has Google Device Location switched OFF.
  _getLocation() async {
    print("get location called");
    try {
      print("should try to get location");
      var currentLocation = await _location.getLocation();

      if (_gotLocation == false) {
        _onGotLocation(currentLocation);
      }
    } on Exception {
      _gotLocation = false;
      print("will listen for location change");

      _location.onLocationChanged().listen((LocationData currentLocation) {
        if (_gotLocation == false) {
          _onGotLocation(currentLocation);
        }
      });
    }
  }

  _onGotLocation(LocationData currentLocation) {
    _gotLocation = true;
    print("gotLocation: $_gotLocation");
    print(currentLocation.latitude);
    print(currentLocation.longitude);
    _lat = currentLocation.latitude;
    _lon = currentLocation.longitude;

    print("should go to position");
    final center = LatLng(_lat, _lon);
    final position = CameraPosition(
      target: center,
      zoom: 13,
    );

    _goToPosition(position);
  }

  Widget _getMap() {
    print("get map");
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      scrollGesturesEnabled: true,
      myLocationEnabled: true,
      initialCameraPosition: _position,
      markers: _markers.toSet(),
    );
  }

  Future _goToPosition(CameraPosition position) async {
    //
    print("will go to posoition");
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(position));

    _getMarkers();
  }

  Future<void> _getMarkers() async {
    if (Platform.isIOS) {
      _apiKey = iosMapApiKey;
    }
    if (Platform.isAndroid) {
      _apiKey = androidMapApiKey;
    }

    final url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$_lat,$_lon&key=$_apiKey&radius=10000&keyword=thai&type=restaurant";

    print("will get markers for: $_lat, $_lon");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("status: 200");
      setState(() {
        final map = json.decode(response.body);

        final results = map["results"];

        print("Got ${results.length} marker results");
        print(map.toString());
        //
        results.forEach((result) {
          final name = result["name"];
          final geo = result["geometry"];
          final loc = geo["location"];
          final lat = loc["lat"];
          final lng = loc["lng"];

          final marker = Marker(
            markerId: MarkerId(name),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(
              title: name,
            ),
          );
          _markers.add(marker);
        });
        print("setting state with added markers");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/general/appethai.png'),
        backgroundColor: darkGreen,
        iconTheme: IconThemeData(
          color: lightYellow,
        ),
      ),
      body: _getMap(),
    );
  }
}
