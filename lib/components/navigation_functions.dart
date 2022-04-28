import 'package:flutter/material.dart';

void navigateAndNotBack(context,Widget widget){
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false,
  );
}