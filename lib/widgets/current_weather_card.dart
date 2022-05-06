import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
import 'package:flutter_template_weather_app3/constants/enums.dart';
import 'package:flutter_template_weather_app3/convert_units.dart';
import 'package:flutter_template_weather_app3/models/geocoding_model.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class CurrentWeatherCard extends StatelessWidget with ConvertUnits {
  final Geocoding stateGeocoding;
  final Current stateCurrent;
  final TemperatureUnit stateTemperatureUnit;

  const CurrentWeatherCard({
    Key? key,
    required this.stateGeocoding,
    required this.stateCurrent,
    required this.stateTemperatureUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat('yyyy-MM-dd').add_Hm();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current Weather',
            style: textHeader,
          ),
          const SizedBox(height: 20.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Card(
              color: Colors.grey[400],
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${stateGeocoding.name}, ${stateGeocoding.country}',
                          style: textContent,
                        ),
                        Text(
                          'Updated ${_formatTime.format(
                            DateTime.fromMillisecondsSinceEpoch(
                                stateCurrent.dt * 1000),
                          )}',
                          style: textContent,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Column(
                          children: [
                            const Text(
                              'Temperature',
                              style: textContent,
                            ),
                            Text(
                              formattedTemperature(
                                stateCurrent.temp,
                                stateTemperatureUnit,
                              ),
                              style: textContent,
                            ),
                            const Text(
                              'Feels like',
                              style: textContent,
                            ),
                            Text(
                              formattedTemperature(
                                stateCurrent.feelsLike,
                                stateTemperatureUnit,
                              ),
                              style: textContent,
                            ),
                            const Text(
                              'Humidity',
                              style: textContent,
                            ),
                            Text(
                              '${stateCurrent.humidity.toString()}%',
                              style: textContent,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${stateCurrent.weather[0].icon}.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              '${stateCurrent.weather[0].description[0].toUpperCase()}${stateCurrent.weather[0].description.substring(1)}',
                              style: textContent,
                              textAlign: TextAlign.center,
                            ),
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
              child: const Text(
                'View details',
                style: TextStyle(fontSize: 16.0),
              ),
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
