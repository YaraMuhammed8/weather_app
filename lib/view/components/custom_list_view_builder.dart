import 'package:flutter/material.dart';

class CustomListViewBuilder extends StatelessWidget {
  List<String> itemsList;
  Function onTap;
  Color textColor;

  CustomListViewBuilder(
      {Key? key,
      required this.itemsList,
      required this.onTap,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
        itemCount: itemsList.length,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                onTap(context,index);
              },
              title: Text(
                itemsList[index],
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ));
  }
}