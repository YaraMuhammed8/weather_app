import 'package:flutter/material.dart';
import 'package:weather/components/generate_date_time.dart';

class CustomBottomSheet extends StatelessWidget {
  List forecasts;
  CustomBottomSheet({Key? key, required this.forecasts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
      child: ListView.builder(
          itemCount:forecasts.length ,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => ListTile(
            leading: Image.network(
              "http://openweathermap.org/img/wn/${forecasts[index].weather[0].icon}@2x.png",
              errorBuilder: (context, object, stackTrace) =>
              const SizedBox(),
            ),
            title: Text(
              "${forecasts[index].main.temp.round()}\xB0",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              forecasts[index].weather[0].main.toString(),
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Text(changeDateFormat(forecasts[index].dtTxt),
                style: TextStyle(color: Colors.black)),
          )),
    );
  }
}
