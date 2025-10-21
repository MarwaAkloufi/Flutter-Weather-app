import 'package:app5/Page/search_page.dart';
import 'package:app5/models/weather_model.dart';
import 'package:app5/providers/provider_weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Homepage extends StatefulWidget {

  State<Homepage> createState()  => _HomePageState();

}
class _HomePageState extends State<Homepage>{
  void upDateUi(){
    setState(() {

    });
  }
weatherModel? weatherData;
  Widget build(BuildContext context) {
    weatherData=Provider.of<providerWeather>(context).weatherData;
    return Scaffold(
appBar: AppBar(
actions: [
  IconButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return search_page(upDateUi: upDateUi);
    })
    );
  },
      icon:Icon(Icons.search)
  )
],
  title: Text('Weather App'),

   // backgroundColor: weatherData!.getThemeColor(),
),
body: weatherData ==null ? Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('there is no weather 😔 Start ',style: TextStyle(fontSize: 27),),
    Text('searching now 🔎',style: TextStyle(fontSize: 27),)


  ],

),
    ): Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(colors: [
  weatherData!.getThemeColor(),
      weatherData!.getThemeColor()[100]!,
      weatherData!.getThemeColor()[50]!,

    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    )


  ),

  child: Column(
mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Spacer(flex: 3,),
      Text(Provider.of<providerWeather>(context).cityName!,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
      Text('updated at : ${weatherData!.date}',style: TextStyle(fontSize: 20),),
    Spacer(),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Image.asset(weatherData!.getImage()),
  Text(weatherData!.temp.toInt().toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    Column(children: [
      Text('maxTemp: ${weatherData!.maxTemp.toInt()}'),
      Text('minTemp: ${weatherData!.minTemp.toInt()}'),


    ],)


    ],),
      Spacer(),
      Text(weatherData!.weatherStateName,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
    Spacer(flex:5 ,)
    ],
  ),




)

    );
  }

  }
