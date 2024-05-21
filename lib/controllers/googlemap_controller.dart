import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<LatLng?> userCurrentLocation = Rx<LatLng?>(null);
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  RxString selectedAddress = RxString('');
  RxString selectedAddressLatitude = RxString('');
  RxString selectedAddressLongitude = RxString('');

  late GoogleMapController mapController;

  Timer? _debounceTimer;

  @override
  void onInit() {
    super.onInit();
    // _getCurrentLocation();
    userCurrentLocation.value =
        const LatLng(30.306083491666787, -97.73379054713618);
  }

  // Future<void> _getCurrentLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );
  //     userCurrentLocation.value = LatLng(position.latitude, position.longitude);
  //   } catch (e) {
  //     debugPrint('Error getting current location: $e');
  //   }
  // }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onMarkerDragEnd(LatLng newPosition) {
    selectedLocation.value = newPosition;
    _updateAddress(newPosition);
  }

  void onCameraMove(CameraPosition position) {
    selectedLocation.value = position.target;

    // Cancel the previous timer to avoid multiple calls
    if (_debounceTimer != null && _debounceTimer!.isActive) {
      _debounceTimer!.cancel();
    }

    // Start a new timer to delay the _updateAddress call
    _debounceTimer = Timer(const Duration(seconds: 1), () {
      _updateAddress(position.target);
    });
  }

  Future<void> _updateAddress(LatLng position) async {
    // debugPrint('Updating address for position: $position');
    String? newAddress =
        await getAddressFromCoordinates(position.latitude, position.longitude);
    if (newAddress != null) {
      // debugPrint('New address found: $newAddress');
      // debugPrint('New address Latitude: ${position.latitude}');
      // debugPrint('New address Longitude: ${position.longitude}');

      selectedAddress.value = newAddress;
      selectedAddressLatitude.value = position.latitude.toString();
      selectedAddressLongitude.value = position.longitude.toString();
    } else {
      // debugPrint('Address not found for position: $position');
      selectedAddress.value = 'Address not found';
      selectedAddressLatitude.value = '';
      selectedAddressLongitude.value = '';
    }
  }

  Future<String?> getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String address =
            '${placemark.street}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';
        return address;
      }
    } catch (e) {
      debugPrint('Error getting address: $e');
    }
    return null;
  }
}
