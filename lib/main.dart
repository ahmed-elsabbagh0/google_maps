import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_google_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const TestGoogleMaps());
}

class TestGoogleMaps extends StatelessWidget {
  const TestGoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomGoogleMap(),
    );
  }
}
