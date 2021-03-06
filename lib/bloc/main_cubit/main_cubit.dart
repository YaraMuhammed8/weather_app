import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/components/generate_date_time.dart';
import 'package:weather/models/current_weather.dart';
import 'package:weather/models/forecast_weather.dart';
import 'package:weather/services/local/cache_helper.dart';
import 'package:weather/src/constants.dart';
import '../../services/remote/dio_helper.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  String? selectedCity = CacheHelper.getString(key: "city");
  CurrentWeather? weather;
  ForecastWeather? forecast;
  void setCity(String newCity) {
    selectedCity = newCity;
    emit(SetCity());
    getWeatherOfCity();
  }

  void getWeatherOfCity() {
    print("city is: $selectedCity");
    emit(GetWeatherLoading());
    DioHelper.getData(
            url: "data/2.5/weather?",
            query: {"q": selectedCity, "appid": apiKey, "units": "metric"})
        .then((value) {
      weather = CurrentWeather.fromJson(value.data);
      emit(GetWeatherSuccessful());
      CacheHelper.putString(key: "city", value: selectedCity!);
      getForecast();
    }).catchError((error) {
      print("error is: $error");
      CacheHelper.remove(key: "city");
      Fluttertoast.showToast(
          msg: "Sorry, an error has occurred",
          backgroundColor: Colors.grey.shade700.withOpacity(0.7));
      emit(GetWeatherError());
    });
  }

  void getForecast() {
    emit(GetForeCastLoading());
    DioHelper.getData(
            url: "data/2.5/forecast?",
            query: {"q": selectedCity, "appid": apiKey, "units": "metric"})
        .then((value) {
          print(value.data);
      forecast = ForecastWeather.fromJson(value.data);
      emit(GetForeCastSuccessful());
    }).catchError((error) {
      emit(GetForeCastError());
      print("error is $error");
    });
  }

  WeatherClassification checkWeatherClassification() {
    DateTime now = DateTime.now();
    DateTime sunriseTime = generateDateTime(weather!.sys.sunrise);
    DateTime sunsetTime = generateDateTime(weather!.sys.sunset);
    if (now.compareTo(sunriseTime) >= 0 && now.compareTo(sunsetTime) < 0) {
      if (weather!.main.temp < 5) {
        return WeatherClassification.snow;
      } else if (weather!.main.temp < 20) {
        return WeatherClassification.cold;
      } else {
        return WeatherClassification.sunny;
      }
    } else {
      return WeatherClassification.night;
    }
  }

  List<String> searchResult = [];
  void filterSearchList(String enteredKeyword) {
    searchResult = [];
    if (enteredKeyword.isNotEmpty) {
      searchResult = cities
          .where((element) => element
              .toLowerCase()
              .startsWith(enteredKeyword.trimRight().toLowerCase()))
          .toList();
    }
    emit(FilterSearchList());
  }
}
