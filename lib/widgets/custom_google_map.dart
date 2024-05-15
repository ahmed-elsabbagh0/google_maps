import 'package:flutter/material.dart';
import 'package:google_maps/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late MapType mapType;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(31.18708, 29.92811),
      zoom: 10,
    );
    mapType = MapType.normal;
    initMarkers();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  late GoogleMapController googleMapController;
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          markers: markers,
          mapType: mapType,
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
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: () {
              CameraPosition newLocation = const CameraPosition(
                target: LatLng(30.2335641, 30.19070210),
                zoom: 12,
              );
              googleMapController
                  .animateCamera(CameraUpdate.newCameraPosition(newLocation));
            },
            child: const Text(
              "Change Location",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  mapType = MapType.satellite;
                  setState(() {});
                },
                child: const Icon(
                  Icons.satellite_alt,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  mapType = MapType.normal;
                  setState(() {});
                },
                child: const Icon(
                  Icons.u_turn_left_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/map_style_night.json');

    googleMapController.setMapStyle(nightMapStyle);
  }

  void initMarkers() {
    var myMarkers = places
        .map(
          (placeModel) => Marker(
            infoWindow: InfoWindow(
              title: placeModel.name,
            ),
            position: placeModel.latLng,
            markerId: MarkerId(placeModel.id.toString()),
          ),
        )
        .toSet();

    markers.addAll(myMarkers);
  }
}
