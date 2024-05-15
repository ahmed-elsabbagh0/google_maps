import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({required this.id, required this.name, required this.latLng});
}

List<PlaceModel> places = [
  PlaceModel(
      id: 1,
      name: 'Al qabari hospital',
      latLng: const LatLng(31.17130814792587, 29.880190731026623)),
  PlaceModel(
      id: 2,
      name: 'Balbaa vilage for Grills & Sea food',
      latLng: const LatLng(31.160454355888355, 29.886502642872692)),
  PlaceModel(
      id: 3,
      name: 'Carfour - City center',
      latLng: const LatLng(31.16805781793052, 29.931707743599617)),
];
