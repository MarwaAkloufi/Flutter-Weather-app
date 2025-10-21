import 'dart:convert';

import 'package:app5/models/weather_model.dart';
import 'package:http/http.dart' as http;
class weatherService {
 Future<weatherModel>  getWeather({ required String cityName}) async {
    String baseUrl='http://api.weatherapi.com/v1';
    String apiKey='bc77b2b473be470c9cb140240252309';
    Uri uri=Uri.parse(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
        http.Response response=await http.get(uri);
   Map<String,dynamic>  data= jsonDecode(response.body);

weatherModel weather=weatherModel.fromjson(data);

return weather;
  }
}