import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:paan/Configur/Images.dart';
import 'package:paan/Configur/apiKeys/mapApiKey.dart';
import 'package:paan/Configur/color.dart';
import 'package:paan/Configur/string.dart';
import 'package:paan/Configur/textStyle.dart';
import 'package:paan/Controller/mapController.dart';
import 'package:paan/Widgets/CommanTextButton.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // MapController mapController = Get.put(MapController());
  Location locationController = Location();
  final Completer<GoogleMapController> mapcontroller = Completer<GoogleMapController>();
  LatLng? currentP = null;
  final LatLng pGooglePlex = LatLng(28.384270, 77.367630);
  final LatLng pApplePark = LatLng(27.529480, 77.661780);

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    try {
      // Get the initial location update
      await getLocationUpdate();
      
      // Fetch polyline points and generate the polyline
      final coordinates = await getPolylinePoints();
      generatePolylineFromPoints(coordinates);

      // Trigger rebuild after data is loaded
      setState(() {});
    } catch (e) {
      print('Error initializing map: $e');
      // Handle the error (e.g., show a message to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  currentP == null
          ? const Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(),
              ),
            )
          :  SafeArea(
              child: Stack(
                children: [
                  Container(
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: pGooglePlex,
                        zoom: 13,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                       mapcontroller.complete(controller);
                      },
                      markers: {
                        if (currentP != null)
                          Marker(
                            markerId: const MarkerId("currentLoction"),
                            icon: BitmapDescriptor.defaultMarker,
                            infoWindow: const InfoWindow(title: "My current location"),
                            position: currentP!,
                          ),
                        Marker(
                          markerId: const MarkerId("sourceLoction"),
                          icon: BitmapDescriptor.defaultMarker,
                          infoWindow: const InfoWindow(title: "My Home location"),
                          position: pGooglePlex,
                        ),
                        Marker(
                          markerId: const MarkerId("destinationLoction"),
                          icon: BitmapDescriptor.defaultMarker,
                          infoWindow: const InfoWindow(title: "My Home Town location"),
                          position: pApplePark,
                        ),
                      },
                      myLocationEnabled: true,
                      polylines: Set<Polyline>.of(polylines.values),
                    ),
                  ),
                  
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: Get.width,
                      height: Get.height*.38,
                    decoration: const BoxDecoration(
                      color: appColors.dOnBackgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                                ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 20),
                                child: Text(AppString.deliveringyourorderto, 
                                style: headingMedium(),),
                              ),
                             const SizedBox(height: 5,),
                             const Divider(),
                             
                            const SizedBox(height: 15,),
                             Center(
                              child: Container(
                                height: 130,
                                margin:const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: appColors.tBorderColor),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SvgPicture.asset(AssetsImage.locationSvg),
                                    ),

                                    Container(
                                      width: Get.width*.55,
                                      margin:const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                          AppString.blockS,
                                          style: headingMedium(
                                              mFontWeight: FontWeight.w500),
                                         ),

                                         Text(
                                          AppString.panchsheelParkSouth,
                                          style: headingSmall(
                                              mFontWeight: FontWeight.w400),
                                         ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      child: CommanTextButton(
                                        Height: 45,
                                        ontap: () {
                                          
                                        },
                                        pedding: 0,
                                        text: AppString.change,
                                        textStyle: headingSmallest(
                                                mColor: appColors.dOnGreenColor),
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                             ),
                            
                            const SizedBox(height: 20,),
                            CommanTextButton(
                              ontap: () {
                                Get.toNamed("/homePage");
                              },
                              buttonColor: appColors.dPrimaryColor,
                              text: AppString.confirmLocation,
                              textStyle: headingMedium2(
                                      mColor: appColors.dOnBackgroundColor),),
                            ],
                          ),      
                      ),
                  )
                ],
              ),
            ),
    );
  }

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
        setState(() {
          currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          cameraPosition(currentP!);
        });
      }
    });
  }

  Future<void> cameraPosition(LatLng pos) async {
    if (!mapcontroller.isCompleted) return;  // Ensure the map is initialized
    final GoogleMapController controller = await mapcontroller.future;
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
