import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

NetworkImage getStaticImage(num longitude, num latitude) {
  var url = _consructRequest(longitude, latitude);

  print(url);

  return NetworkImage(url);
}

String _consructRequest(num longitude, num latitude) {
  const baseUrl = 'https://api.mapbox.com/styles/v1/mapbox/light-v10/static';
  final pin = 'pin-s+ff647c($longitude,$latitude)';
  const zoom = 16;
  const height = 500;
  const width = 500;
  final accessToken = dotenv.env['MAPBOX_API_KEY'];

  return '$baseUrl/$pin/$longitude,$latitude,$zoom/${width}x$height'
      '?access_token=$accessToken&logo=false';
}
