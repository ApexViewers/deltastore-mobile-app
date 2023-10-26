
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constant/styles/colors.dart';
import 'controller/google_map_controller.dart';

class GoogleMapScreen extends StatefulWidget {
  dynamic Lat;
  dynamic Lng;
  String? title;
  String? snipped;
  GoogleMapScreen({Key? key, this.Lat, this.Lng, this.title, this.snipped})
      : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  var googlemapcontroller = GooglemapController();
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  String nametitle = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      Marker(
        markerId: const MarkerId('marker_id'),
        position: LatLng(widget.Lat, widget.Lng),
        infoWindow: InfoWindow(
          title: widget.title,
          snippet: widget.snipped,
        ),
        onTap: () {
          // Handle marker onTap event
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Google location"),
          backgroundColor: appthem,
        ),
        floatingActionButton: Obx(() => googlemapcontroller.loadingmap.value
            ? const CircularProgressIndicator()
            : FloatingActionButton.extended(
                label: const Text('Open in Google Map'),
                backgroundColor: appthem,
                onPressed: () {
                  googlemapcontroller.opengooglemap(widget.Lat, widget.Lng);
                })),
        body: GoogleMap(
          zoomControlsEnabled: false,
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.Lat, widget.Lng),
            zoom: 14.0,
          ),
        ));
  }
}
