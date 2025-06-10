import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
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
                TextStyle(fontSize: 24),),
            ),
            const Placeholder(
              fallbackHeight: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            //additional information
            const Placeholder(
              fallbackHeight: 100,
            )
          ],
        ),
      ),
      //backgroundColor: Colors.yellow,
    );
  }
}
