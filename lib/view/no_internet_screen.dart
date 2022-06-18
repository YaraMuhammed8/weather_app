import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.wifi_off_outlined,
              size: 40,
              color: Colors.grey,
            ),
            Text(
              "No Internet connection",
              style: TextStyle(fontSize: 25, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
