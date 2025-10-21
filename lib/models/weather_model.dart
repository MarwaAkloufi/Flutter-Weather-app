

import 'package:flutter/material.dart';

class weatherModel{
   String date;
   double temp;
  double maxTemp;
  double minTemp;
  String  weatherStateName;

  weatherModel({required this.date,required this.temp,required this.maxTemp,required this.minTemp,required this.weatherStateName});
  factory   weatherModel.fromjson(dynamic data){
  var jsonData=data['forecast']['forecastday'][0]['day'];
 return weatherModel(
  date: data['location']['localtime'],
temp:jsonData['avgtemp_c'],
maxTemp:jsonData['maxtemp_c'] ,
 minTemp: jsonData['mintemp_c'],
  weatherStateName:jsonData['condition']['text'],

 );
}

   @override
   String toString() {
     return 'weatherModel{date: $date, temp: $temp, maxTemp: $maxTemp, minTemp: $minTemp, weatherStateName: $weatherStateName}';
   }
String getImage(){
    if(weatherStateName=='Clear' || weatherStateName=='Light Cloud'){
      return 'assets/images/clear.png';
    }
    else if (weatherStateName=='Sleet' || weatherStateName=='Snow' || weatherStateName=='Hail'){

      return 'assets/images/snow.png';
    }
    else if (weatherStateName=='Heavy Cloud'){

      return 'assets/images/cloudy.png';
    }

    else if (weatherStateName=='Light Rain' || weatherStateName=='Heavy Rain' || weatherStateName=='Showers'|| weatherStateName=='Patchy rain nearby' || weatherStateName=='Moderate rain'){

      return 'assets/images/rainy.png';
    }
    else if (weatherStateName=='Thunderstormg' || weatherStateName=='Thunder'){

      return 'assets/images/thunderstorm.png';
    }
    else {
      return 'assets/images/clear.png';
    }
}


   MaterialColor getThemeColor(){
     if(weatherStateName=='Clear' || weatherStateName=='Light Cloud'||weatherStateName=='Sunny'){
      return Colors.orange;
     }
     else if (weatherStateName=='Sleet' || weatherStateName=='Snow' || weatherStateName=='Hail'){

       return Colors.blue;
     }
     else if (weatherStateName=='Heavy Cloud'){

       return Colors.blueGrey ;
     }

     else if (weatherStateName=='Light Rain' || weatherStateName=='Heavy Rain' || weatherStateName=='Showers'){

       return Colors.blue ;
     }
     else if (weatherStateName=='Thunderstormg' || weatherStateName=='Thunder'){

       return Colors.blue;
     }
     else {
       return Colors.blue;
     }
   }









}