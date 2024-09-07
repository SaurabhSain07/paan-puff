import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:paan/Controller/mapController.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
 
  MapController mapController=Get.put(MapController());
  
  @override
  void initState() {
    super.initState();
    mapController.getLocationUpdate().then((_)=>{
      mapController.getPolylinePoints().then((coordinates)=>{
        print(coordinates)
      })
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mapController.currentP==null
      ?const Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(),
          ),
      )
      :SafeArea(
        child: GoogleMap(
            initialCameraPosition: CameraPosition(target: mapController.pGooglePlex,
             zoom: 13),
            onMapCreated: (GoogleMapController controller){
              mapController.mapController.complete(controller);
            }, 
            markers: {
              Marker(
                markerId: MarkerId("currentLoction"),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(title: "My current loction"),
                position: mapController.currentP!),
        
             Marker(
                markerId: const MarkerId("socurceLoction"),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: const InfoWindow(title: "My Home loction"),
                position: mapController.pGooglePlex),  
        
             Marker(
                markerId: const MarkerId("destinalionLoction"),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: const InfoWindow(title: "My Home Town loction"),
                position: mapController.pApplePark),   
            },
            myLocationEnabled: true,
         ),
      ) ,
    );
  }
}