import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/main_cubit/main_cubit.dart';
import 'package:weather/components/capitalization.dart';
import 'package:weather/src/constants.dart';
import 'package:weather/view/weather_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/navigation_functions.dart';
import 'components/search_field.dart';

class EnterCityScreen extends StatelessWidget {
  EnterCityScreen({Key? key}) : super(key: key);
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff8DBAF5),
        Color(0xff4DADF9),
      ])),
      child: Scaffold(
        body: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = MainCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/cloudy.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter a city",
                    style: TextStyle(fontSize: 25),
                  ),
                  SearchField(
                    controller: cityController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        cityController.text = capitalization(cityController.text);
                        cubit.resetSearchList();
                        if (cities.contains(cityController.text)) {
                          cubit.setCity(cityController.text);
                          navigateAndNotBack(context, WeatherScreen());
                        } else {
                          Fluttertoast.showToast(
                              msg: "Sorry, City not found",
                              backgroundColor:
                                  Colors.grey.shade700.withOpacity(0.7));
                        }
                      },
                      icon: const Icon(Icons.arrow_forward),
                      color: Colors.blueGrey,
                      //minWidth: 0,
                    ),
                    onChanged: (value) {
                      MainCubit.get(context)
                          .filterSearchList(cityController.text);
                    },
                  ),
                  if (cubit.searchResult.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffF3F5F9),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                              cubit.searchResult.length,
                              (index) => ListTile(
                                    onTap: () {
                                      cityController.text =
                                          cubit.searchResult[index];
                                    },
                                    title: Text(
                                      cubit.searchResult[index],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey.shade800),
                                    ),
                                  )),
                        ),
                      ),
                    )
                  ]
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}