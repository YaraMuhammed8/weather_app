import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/services/local/cache_helper.dart';
import 'package:weather/services/remote/dio_helper.dart';
import 'package:weather/src/app_root.dart';
import 'package:weather/src/constants.dart';
import 'bloc/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  openJsonCities();
  await CacheHelper.init();
  DioHelper.init();
  BlocOverrides.runZoned(
    () => runApp(const AppRoot()),
    blocObserver: MyBlocObserver(),
  );
}