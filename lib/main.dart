import 'package:app5/models/weather_model.dart';
import 'package:app5/providers/provider_weather.dart';
import 'package:flutter/material.dart';
import 'package:app5/Page/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
   ChangeNotifierProvider(
  create: (context) {
    return providerWeather();

  },
    child:  Weather_app_setup()));

}

class Weather_app_setup extends StatelessWidget {
//weatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Provider.of<providerWeather>(context).weatherData==null ? Colors.blue : Provider.of<providerWeather>(context).weatherData!.getThemeColor(),

    ),
    home:Homepage(),

    );

  }

}

