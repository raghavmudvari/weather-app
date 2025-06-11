import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget{
  const HourlyForecastItem ({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child:Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: const Column(
          children: [
            Text('03:00',style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,

            )),
            SizedBox(height: 8,),
            Icon(Icons.cloud, size: 32,),
            SizedBox(height: 8,),
            Text('31°C',style:TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 13,

            )),
          ],
        ),
      ) ,
    );
  }
}