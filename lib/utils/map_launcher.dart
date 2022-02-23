import 'package:map_launcher/map_launcher.dart';

void openLocationInMaps(double longitude, double latitude, String title) async {
  await (await MapLauncher.installedMaps).first.showMarker(
        coords: Coords(latitude, longitude),
        title: title,
      );
}
