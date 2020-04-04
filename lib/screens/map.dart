import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happjfarm/collections/farm_collector.dart';
import 'package:happjfarm/utils/constant.dart';

import 'package:happjfarm/widgets/map_pin_pill.dart';
import 'package:happjfarm/models/pin_pill_info.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final double CAMERA_ZOOM = 10;

  GoogleMapController _controller;
  Position _position = Position(latitude: 10.769893054652592, longitude: 106.69172264635563);
  CameraPosition _currentCameraPosition;
  final Map<String, Marker> _markers = {};

  bool _isPinShow = false;
  PinInformation _currentlySelectedPin = PinInformation(
    avatarPath: '',
    product: '',
    standard: '',
    price: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMap(),
    );
  }

  @override
  void initState() {
    _getCurrentLocation();
    _currentCameraPosition = CameraPosition(
      target: LatLng(_position.latitude, _position.longitude),
      zoom: CAMERA_ZOOM,
    );
    super.initState();
  }

  void _getCurrentLocation() async {
    final Position res = await Geolocator().getCurrentPosition()
        .catchError((e) => print(e));
    print(res.toJson());

    final farms = FarmCollector.getListExample();

    setState(() {
      _position = res;
      _markers.clear();
      for (final farm in farms) {
        final marker = Marker(
          markerId: MarkerId(farm.id),
          position: LatLng(farm.latitude, farm.longitude),
          infoWindow: InfoWindow(
            title: farm.product,
            snippet: farm.priceVND + " VND/kg",
          ),
          onTap: () {
            setState(() {
              _currentlySelectedPin.product = farm.product;
              _currentlySelectedPin.price = farm.priceVND + " VND/kg";
              _currentlySelectedPin.standard = farm.standard;
              _currentlySelectedPin.avatarPath = farm.image.first;
              _isPinShow = true;
            });
          },
        );
        _markers[farm.id] = marker;
      }
      _markers[Constants.youHere] = _getCurrentMarker();
      _controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(_position.latitude, _position.longitude)),
      );
    });
  }

  Widget _buildMap() {
    return Stack(
        children: <Widget>[
          GoogleMap(
            myLocationEnabled: true,
            compassEnabled: true,
            tiltGesturesEnabled: false,
            mapType: MapType.normal,
            markers: _markers.values.toSet(),
            initialCameraPosition: _currentCameraPosition,
            onMapCreated: (controller) => _controller = controller,
            onTap: (LatLng location) {
              print(location.latitude.toString() + "//" + location.longitude.toString());
              // May be will find the way here (){...}
              setState(() {
                _isPinShow = false;
              });
            },
          ),
          MapPinPillComponent(
            isShow: _isPinShow,
            currentlySelectedPin: _currentlySelectedPin,
          ),
        ]
    );
  }

  Marker _getCurrentMarker() {
    return Marker(
      markerId: MarkerId('you'),
      position: LatLng(_position.latitude, _position.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      infoWindow: InfoWindow(title: Constants.youHere),
      onTap: () => setState(() {_isPinShow = false;}),
    );
  }

}
