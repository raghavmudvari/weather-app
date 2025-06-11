import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/additionalinfo.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/secret.dart';
import 'hourlyForecast.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }
  Future getCurrentWeather() async{
    String cityName='london';
    final res=await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIkey'),
    );
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //  print();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                      child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '32° C',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 70,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(fontSize: 21),
                          )
                        ],
                      ),
                                      ),
                    ),
                  ),
              ),
            ),
            //weather forecast card
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text('Weather Forecast',style:
                TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),

            ),
            const SizedBox(height: 15,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(time: '3:00',icon: Icons.cloud,temperature: '32.5 degree',),
                  HourlyForecastItem(time: '4:00',icon: Icons.cloud,temperature: '30 degree',),
                  HourlyForecastItem(time: '5:00',icon: Icons.water_drop,temperature: '27 degree',),
                  HourlyForecastItem(time: '6:00',icon: Icons.cloudy_snowing,temperature: '25 degree',),
                  HourlyForecastItem(time: '7:00',icon: Icons.shield_moon_rounded,temperature: '24 degree',),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            //additional information
            Align(
              alignment: Alignment.centerLeft,
              child: const Text('Additional Information',style:
              TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),

            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                additionalInfo(icon: Icons.water_drop,label: 'Humidity',value: '76',),
                additionalInfo(icon: Icons.wind_power,label: 'Wind Speed',value: '14 km/h'),
                additionalInfo(icon: Icons.monitor_weight,label: 'Air Pressure',value: '1002'),
              ],
            )
          ],
        ),
      ),
      //backgroundColor: Colors.yellow,
    );
  }
}
