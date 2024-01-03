//show modal bottom sheet
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

void showModal(
    BuildContext context, double? lat, double? long, Function updateLocation) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        height: 600,
        child: Center(
          child: OpenStreetMapSearchAndPick(
              buttonText: 'tetapkanLokasi'.tr(),
              center: LatLong(lat!, long!),
              onPicked: (pickedData) {
                Navigator.pop(context);
                String newAddress = pickedData.address;
                double newLat = pickedData.latLong.latitude;
                double newLong = pickedData.latLong.longitude;
                updateLocation(newAddress, newLat, newLong);
              }),
        ),
      );
    },
  );
}
