import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:paan/Configur/apiKeys/mapApiKey.dart';

class MapController extends GetxController {
  Location locationController = Location();
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  LatLng? currentP = null;
  final LatLng pGooglePlex = LatLng(28.384270, 77.367630);
  final LatLng pApplePark = LatLng(27.529480, 77.661780);

  Map<PolylineId, Polyline> polylines = {};

  Future<void> getLocationUpdate() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location service is enabled
    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check and request location permission
    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Start listening to location changes
    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        cameraPosition(currentP!);
      }
    });
  }

  Future<void> cameraPosition(LatLng pos) async {
    if (!mapController.isCompleted) return;  // Ensure the map is initialized
    final GoogleMapController controller = await mapController.future;
    CameraPosition nCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller.animateCamera(CameraUpdate.newCameraPosition(nCameraPosition));
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylinesCoordinate = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: GOOGLE_MAP_API_KEY,
      request: PolylineRequest(
        origin: PointLatLng(pGooglePlex.latitude, pGooglePlex.longitude),
        destination: PointLatLng(pApplePark.latitude, pApplePark.longitude),
        mode: TravelMode.driving,
      ),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylinesCoordinate.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print("Polyline error: ${result.errorMessage}");
    }
    return polylinesCoordinate;
  }

  void generatePolylineFromPoints(List<LatLng> polylinesCoordinate) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.black,
      points: polylinesCoordinate,
      width: 8,
    );
    polylines[id] = polyline;
  }

}
