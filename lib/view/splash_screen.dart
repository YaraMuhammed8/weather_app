import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/view/enter_city_screen.dart';
import 'package:weather/view/no_internet_screen.dart';
import 'package:weather/view/weather_screen.dart';

import '../components/navigation_functions.dart';
import '../services/local/cache_helper.dart';
import 'components/gradient.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Widget nextScreen;
    Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.none)
        nextScreen = NoInternetScreen();
      else if (CacheHelper.getString(key: "city") == null)
        nextScreen = EnterCityScreen();
      else
        nextScreen = WeatherScreen();
      Timer(
        const Duration(seconds: 3),
        () => navigateAndNotBack(context, nextScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/cloudy1.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              Text("Weather App",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
