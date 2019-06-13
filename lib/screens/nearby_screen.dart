import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../resources/constants.dart';

class NearbyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NearbyState();
  }
}

class NearbyState extends State<NearbyScreen> {
  GoogleMapController mapController;

  LatLng _center = LatLng(45.521563, -122.677433);
  var _gotLocation = false;

  Map<String, double> currentLocation;
  double _lat;
  double _lon;
  String _apiKey;
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  _getLocation() async {
    var location = Location();
    try {
      currentLocation = await location.getLocation();
      _lat = currentLocation["latitude"];
      _lon = currentLocation["longitude"];
      _gotLocation = true;
      setState(() {
        _center = LatLng(_lat, _lon);
      });
    } on Exception {
      currentLocation = null;
    }
  }

  Widget _getMap() {
    if (_gotLocation == true) {
      return GoogleMap(
        onMapCreated: _onMapCreated,
        scrollGesturesEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 13.0,
        ),
        markers: _markers.toSet(),
      );
    } else {
      return Center(child: Text("Location not found"));
    }
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    //if (Platform.isIOS) {
    //  apiKey = iosMapApiKey;
    //}
    //if (Platform.isAndroid) {
    _apiKey = androidMapApiKey;
    //}

    final url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$_lat,$_lon&key=$_apiKey&radius=10000&keyword=thai&type=restaurant";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        final map = json.decode(response.body);
        final results = map["results"];
        _markers.clear();
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
