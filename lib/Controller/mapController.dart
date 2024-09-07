import 'dart:async';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:paan/Configur/apiKeys/mapApiKey.dart';

class MapController extends GetxController{
  Location locationController=Location();
  final Completer<GoogleMapController> mapController=Completer<GoogleMapController>();
  LatLng? currentP=null;
  final LatLng pGooglePlex= LatLng(28.384270, 77.367630);
  final LatLng pApplePark= LatLng(27.529480, 77.661780);

  Future <void> getLocationUpdate()async{
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled=await locationController.serviceEnabled();

    if (serviceEnabled) {
      serviceEnabled =await locationController.requestService();
    } else {
      return;
    }

    permissionGranted =await locationController.hasPermission();
    if (permissionGranted==PermissionStatus.denied) {
      permissionGranted=await locationController.requestPermission();
      if (permissionGranted !=PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((LocationData currentLoction){
      if (currentLoction.latitude !=null && currentLoction.longitude !=null) {
        currentP=LatLng(currentLoction.latitude!, currentLoction.longitude!);
        cameraPosition(currentP!);
      }
    });
  }

  Future <void> cameraPosition(LatLng pas)async{
    final GoogleMapController controller=await mapController.future;
    CameraPosition nCameraPosition=CameraPosition(target: pas, zoom: 13);
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(nCameraPosition)
    );
  }

  Future <List<LatLng>> getPolylinePoints()async{
    List<LatLng> polylinesCordinate=[];
    PolylinePoints polylinePoints =PolylinePoints();
    PolylineResult result=await polylinePoints.getRouteBetweenCoordinates(
         googleApiKey: GOOGLE_MAP_API_KEY,
         request: PolylineRequest(
          origin: PointLatLng(pGooglePlex.latitude, pGooglePlex.longitude), 
          destination: PointLatLng(pApplePark.latitude, pApplePark.longitude), 
          mode: TravelMode.driving)
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point){
        polylinesCordinate.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylinesCordinate;
  }
}