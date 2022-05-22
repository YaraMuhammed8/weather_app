import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/main_cubit/main_cubit.dart';
import 'package:weather/view/components/search_field.dart';

import '../../src/constants.dart';
import 'custom_list_view_builder.dart';

class CustomDrawer extends StatelessWidget {
  TextEditingController controller;
  CustomDrawer({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Drawer(
          backgroundColor: Colors.black.withOpacity(0.6),
          child: Column(
            children: [
              DrawerHeader(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Choose a city",
                    style: TextStyle(fontSize: 20),
                  ),
                  SearchField(
                    controller: controller,
                    onChanged: (value) {
                      print(value);
                      cubit.filterSearchList(value.toString());
                    },
                  ),
                ],
              )),
              Expanded(
                  child:
                      (cubit.searchResult.isEmpty && controller.text.isNotEmpty)
                          ? const Text(
                              "Not Found",
                              style: TextStyle(fontSize: 18),
                            )
                          : (controller.text.isEmpty)
                              ? CustomListViewBuilder(
                                  itemsList: cities,
                                  onTap: (context, index) {
                                    controller.text = "";
                                    cubit.setCity(cities[index]);
                                    Scaffold.of(context).closeDrawer();
                                  },
                                  textColor: Colors.white)
                              : CustomListViewBuilder(
                                  itemsList: cubit.searchResult,
                                  onTap: (context, index) {
                                    controller.text = "";
                                    cubit.setCity(cubit.searchResult[index]);
                                    Scaffold.of(context).closeDrawer();
                                  },
                                  textColor: Colors.white))
            ],
          ),
        );
      },
    );
  }
}
