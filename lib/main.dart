




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
void main() {

  runApp(BlocProvider(
      create: (context) {

        return WeatherCubit(WeatherService());

      },
      child: WeatherApp()));

}

class WeatherApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherData == null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context)
                .weatherData!
                .getThemeColor(),

      ),

      home: HomePage(),

    );

  }

}

