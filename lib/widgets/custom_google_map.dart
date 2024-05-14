import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  
  late CameraPosition initialCameraPosition;
  
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(target: LatLng(31.18708, 29.92811),
    zoom: 10,
    );

    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
            GoogleMap(
            onMapCreated: (controller) {
              googleMapController = controller;
              initMapStyle();
            },

            initialCameraPosition: initialCameraPosition,
            ),
        Positioned(
          bottom: 16,
          right: 80,
          left: 80,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
              ),
            ),
            onPressed: () {
              
              CameraPosition newLocation = const CameraPosition(target: LatLng(30.2335641, 30.19070210), zoom: 12,);
              googleMapController.animateCamera(CameraUpdate.newCameraPosition(newLocation));
          },
              child: const Text(
                "Change Location",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
          ),
        ),
          ],
    );
  }

  void initMapStyle() async {

  var nightMapStyle =  await  DefaultAssetBundle.of(context).loadString('assets/map_styles/map_style_night.json');

  googleMapController.setMapStyle(nightMapStyle);
  }
}
