import 'dart:convert';

import 'package:flutter/services.dart';

const apiKey = "ecd0dd5065b312d2ba1e3ea6a2cdb19d";

enum WeatherClassification { snow, cold, sunny, night }

List<String> cities = [];
void openJsonCities() async {
  String? response = await rootBundle.loadString('assets/cities.json');
  var data = json.decode(response);
  cities = List.from(data)
      .map((e) => e["name"].toString())
      .toList()
      .toSet()
      .toList();
}