import 'package:app5/models/weather_model.dart';
import 'package:app5/providers/provider_weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/weather_service.dart';
class search_page extends StatelessWidget {
  String? cityName;


  VoidCallback? upDateUi;

  search_page({this.upDateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search a City'),
           backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (data){
                cityName=data;

              },
                onSubmitted: (data) async {
                  cityName = data;

                  weatherService service = weatherService();
                  weatherModel weather = await service.getWeather(
                      cityName: cityName!);
                  Provider.of<providerWeather>(context,listen: false).weatherData=weather;
                 Provider.of<providerWeather>(context,listen: false).cityName=cityName;
                  Navigator.pop(context);
                },



                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a City',
                  suffixIcon:
                  GestureDetector(
                    onTap: () async{


                      weatherService service = weatherService();
                      weatherModel weather = await service.getWeather(
                          cityName: cityName!);
                      Provider.of<providerWeather>(context,listen: false).weatherData=weather;
                      Provider.of<providerWeather>(context,listen: false).cityName=cityName;
                      Navigator.pop(context);

                    },
                child:   Icon(Icons.search),),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 32, horizontal: 24),
                  label: Text('search'),


                )
            ),
          ),

        )
    );
  }
}
