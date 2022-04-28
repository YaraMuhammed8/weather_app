import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/main_cubit/main_cubit.dart';
import 'package:weather/view/components/custom_drawer.dart';
import 'package:weather/view/components/secondary_data_row.dart';

import 'components/primary_data_row.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key? key}) : super(key: key);
  TextEditingController cityController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color(0xff8DBAF5),
                Color(0xff4DADF9),
              ]),
              image: (state is GetWeatherLoading)
                  ? null
                  : DecorationImage(
                      image: AssetImage(
                        "assets/images/${cubit.checkWeatherClassification()}.jpg",
                      ),
                      fit: BoxFit.cover,
                    )),
          child: Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.edit_location_outlined,
                    )),
              ),
              centerTitle: true,
              title: (state is! GetWeatherLoading)
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          cubit.weather!.name,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400),
                        ),
                        const Icon(
                          Icons.location_on,
                          size: 25,
                        )
                      ],
                    )
                  : null,
            ),
            body: (state is GetWeatherLoading)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrimaryDataRow(
                          weather: cubit.weather!,
                        ),
                        SecondaryDataRow(weather: cubit.weather!)
                      ],
                    ),
                  ),
            drawer: CustomDrawer(controller:cityController),
          ),
        );
      },
    );
  }
}
