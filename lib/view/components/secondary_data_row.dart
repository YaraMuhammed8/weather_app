import 'package:flutter/material.dart';
import 'package:weather/models/city_weather.dart';
import 'package:weather/view/components/details_card.dart';

class SecondaryDataRow extends StatelessWidget {
  CityWeather weather;
  SecondaryDataRow({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [
          DetailsCard(
            title: "humidity",
            data: "${weather.main.humidity}%",
            icon: const Icon(Icons.water_drop),
          ),
          const SizedBox(
            width: 10,
          ),
          DetailsCard(
            title: "Visibility",
            data: "${weather.visibility / 1000}km",
            icon: const Icon(Icons.visibility_outlined),
          ),
        ]),
        //Divider(thickness: 10,)
      ],
    );
  }
}
