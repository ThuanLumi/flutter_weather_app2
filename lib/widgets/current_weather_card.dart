import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/models/geocoding_model.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class CurrentWeatherCard extends StatelessWidget {
  final Geocoding stateGeocoding;
  final Current stateCurrent;

  const CurrentWeatherCard({
    Key? key,
    required this.stateGeocoding,
    required this.stateCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat('yyyy-MM-dd').add_Hm();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Current Weather'),
          const SizedBox(height: 20.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 400.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Card(
              color: Colors.blue[200],
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 15.0,
                      right: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(stateGeocoding.name),
                        Text('Updated ${_formatTime.format(
                          DateTime.fromMillisecondsSinceEpoch(
                              stateCurrent.dt * 1000),
                        )}'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Column(
                          children: [
                            const Text('Temperature'),
                            Text(
                                '${stateCurrent.temp.round().toInt().toString()}°C'),
                            const Text('Humidity'),
                            Text('${stateCurrent.humidity.toString()}%'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${stateCurrent.weather[0].icon}.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              stateCurrent.weather[0].description,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                                'Feels like ${stateCurrent.feelsLike.round().toInt().toString()}°C'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5.0),
            alignment: Alignment.centerRight,
            child: TextButton(
              child: const Text('View details'),
              onPressed: () {
                Navigator.of(context).pushNamed('/current_details');
              },
            ),
          ),
        ],
      ),
    );
  }
}
