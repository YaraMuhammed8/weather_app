import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/main_cubit/main_cubit.dart';
import 'package:weather/services/local/cache_helper.dart';
import 'package:weather/themes/app_theme.dart';
import 'package:weather/view/enter_city_screen.dart';

import '../view/weather_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) {
            MainCubit mainCubit = MainCubit();
            if (mainCubit.selectedCity != null) {
              mainCubit.getWeatherOfCity();
            }
            return mainCubit;
          })
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: (CacheHelper.getString(key: "city") == null)
              ? EnterCityScreen()
              : WeatherScreen(),
        ));
  }
}