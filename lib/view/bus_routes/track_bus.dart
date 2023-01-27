import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class TrackBus extends StatefulWidget {
  const TrackBus({Key? key}) : super(key: key);

  @override
  State<TrackBus> createState() => _TrackBusState();
}

class _TrackBusState extends State<TrackBus> {
  String googleAPiKey = "AIzaSyDOHImmPOOqguSTLBElZ6gZxY8iPEZgNZ4";
  // final locations = const [
  //   LatLng(37.42796133580664, -122.085749655962),
  //   LatLng(37.41796133580664, -122.085749655962),
  //   LatLng(37.43796133580664, -122.085749655962),
  //   LatLng(37.42796133580664, -122.095749655962),
  //   LatLng(37.42796133580664, -122.075749655962),
  // ];
  LatLng startLocation = LatLng(27.6683619, 85.3101895);
  LatLng endLocation = LatLng(27.6688312, 85.3077329);

  late List<MarkerData> _customMarkers;
  PolylinePoints polylinePoints = PolylinePoints();
  final Set<Polyline> _polyline = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPolyPoints();
    getCurrentLocation();
    _customMarkers = [
      MarkerData(
          marker:
          Marker(markerId: const MarkerId('id-1'), position: startLocation),
          child: _customMarker3('Everywhere\nis a Widgets', Colors.blue)),
      MarkerData(
          marker:
          Marker(markerId: const MarkerId('id-5'), position: endLocation),
          child: _customMarker('A', Colors.black)),
      MarkerData(
          marker: Marker(
              markerId: const MarkerId('current '), position: endLocation),
          child: _customMarker('B', Colors.red)),
      // MarkerData(
      //     marker:
      //         Marker(markerId: const MarkerId('id-3'), position: locations[2]),
      //     child: _customMarker('C', Colors.green)),
      // MarkerData(
      //     marker:
      //         Marker(markerId: const MarkerId('id-4'), position: locations[3]),
      //     child: _customMarker2('D', Colors.purple)),
      // MarkerData(
      //     marker:
      //         Marker(markerId: const MarkerId('id-5'), position: locations[4]),
      //     child: _customMarker('A', Colors.blue)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {


          setState(() {
            if (_customMarkers.isNotEmpty) {
              _customMarkers.removeLast();
            }
          });
        },
      ),
      body:
         CustomGoogleMapMarkerBuilder(
        //screenshotDelay: const Duration(seconds: 4),
        customMarkers: _customMarkers,
        builder: (BuildContext context, Set<Marker>? markers) {
          if (markers == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: startLocation,
              zoom: 14,
            ),
            markers: markers,
            polylines: Set<Polyline>.of(polylines.values),
            onMapCreated: (GoogleMapController controller) {},
          );
        },
      ),
    );
  }

  _customMarker(String symbol, Color color) {
    return Stack(
      children: [
        Icon(
          Icons.add_location,
          color: color,
          size: 50,
        ),
        Positioned(
          left: 15,
          top: 8,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text(symbol)),
          ),
        )
      ],
    );
  }

  _customMarker2(String symbol, Color color) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: color, blurRadius: 6)]),
      child: Center(child: Text(symbol)),
    );
  }

  _customMarker3(String text, Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [BoxShadow(color: color, blurRadius: 6)]),
      child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
          )),
    );
  }
}