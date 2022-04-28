import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme = ThemeData(
  fontFamily: "Tajawal",
    dividerColor: Colors.white,
    scaffoldBackgroundColor: Colors.transparent,
    indicatorColor: Colors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white,),
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white)));
