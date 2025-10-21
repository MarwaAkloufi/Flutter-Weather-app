import 'package:app5/models/weather_model.dart';
import 'package:flutter/cupertino.dart';

class providerWeather extends ChangeNotifier{
   weatherModel? _weatherData;
   String? cityName;
set weatherData(weatherModel? weather){
  _weatherData=weather;
  notifyListeners();
}
weatherModel? get weatherData => _weatherData;


}