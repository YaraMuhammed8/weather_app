part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}
class GetWeatherLoading extends MainState {}
class GetWeatherSuccessful extends MainState {}
class GetWeatherError extends MainState {}
class GetForeCastLoading extends MainState {}
class GetForeCastSuccessful extends MainState {}
class GetForeCastError extends MainState {}
class SetCity extends MainState {}
class FilterSearchList extends MainState {}