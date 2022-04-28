import 'package:flutter/material.dart';
import 'package:weather/models/city_weather.dart';

class PrimaryDataRow extends StatelessWidget {
  CityWeather weather;

  PrimaryDataRow({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Text(
              //       weather.name,
              //       style: const TextStyle(
              //           fontSize: 30, fontWeight: FontWeight.w400),
              //     ),
              //     const Icon(
              //       Icons.location_on,
              //       size: 20,
              //     )
              //   ],
              // ),
              Text(
                "${weather.main.temp.round()}\xB0",
                style: const TextStyle(
                  fontSize: 100,
                  height: 1,
                ),
              ),
              Text(
                "${weather.main.tempMax.round()}\xB0 / "
                "${weather.main.tempMin.round()}\xB0",
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        //const SizedBox(height: 200,child: VerticalDivider(thickness: 1,)),
        Expanded(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
           Image.network("http://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png"),
          Text(
            weather.weather[0].main,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          Text(
            weather.weather[0].description,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w200),
          )
        ]))
      ],
    );
  }
}