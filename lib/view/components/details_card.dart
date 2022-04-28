import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  String data;
  String title;
  Widget icon;

  DetailsCard(
      {required this.icon, required this.data, required this.title});

  @override
  build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100.withOpacity(0.3),
          //backgroundBlendMode: BlendMode.modulate
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            Text(
              data,
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
    );
  }
}
