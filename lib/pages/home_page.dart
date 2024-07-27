import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/default_body.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/success_body.dart';


class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {

    // weatherData = Provider.of<WeatherProvider>(context).weatherData;


    return Scaffold(

      appBar: AppBar(

        actions: [

          IconButton(

            onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {

                return SearchPage();

              }));

            },

            icon: const Icon(Icons.search),

          ),

        ],

        title: const Text('Weather App'),

      ),

      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {

        if (state is WeatherLoading) {

          return const Center(

            child: CircularProgressIndicator(),

          );

        } else if (state is WeatherSuccess) {

          // WeatherModel weatherData;
          // weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel!;


          return SuccessBody(

            weatherData: state.weatherModel,

          );

        } else if (state is WeatherFailure) {

          return Center(child: const Text("Something went wrong please try again"));

        } else {

          return const DefaultBody();

        }

      }),

    );

  }

}

