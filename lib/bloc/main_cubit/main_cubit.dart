import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/components/generate_date_time.dart';
import 'package:weather/models/city_weather.dart';
import 'package:weather/services/local/cache_helper.dart';
import 'package:weather/src/constants.dart';

import '../../services/remote/dio_helper.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  String? selectedCity = CacheHelper.getString(key: "city");
  CityWeather? weather;
  void setCity(String newCity) {
    selectedCity = newCity;
    CacheHelper.putString(key: "city", value: newCity);
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
      weather = CityWeather.fromJson(value.data);
      emit(GetWeatherSuccessful());
    }).catchError((error) {
      emit(GetWeatherError());
    });
  }

  String checkWeatherClassification() {
    DateTime now = DateTime.now();
    DateTime sunriseTime = generateDateTime(weather!.sys.sunrise);
    DateTime sunsetTime = generateDateTime(weather!.sys.sunrise);
    if (now.compareTo(sunriseTime) >= 0 && now.compareTo(sunsetTime) < 0) {
      return "sunny";
    } else{
      return "night";
    }
  }

  List<String> searchResult = [];
  void filterSearchList(String enteredKeyword) {
    if (enteredKeyword.isNotEmpty) {
      searchResult = cities
          .where((element) =>
              element.toLowerCase().startsWith(enteredKeyword.toLowerCase()))
          .toList();
      emit(FilterSearchList());
    }
  }

  void resetSearchList() {
    searchResult = [];
    emit(ResetSearchList());
  }
}