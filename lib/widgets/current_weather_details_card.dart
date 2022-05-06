import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
import 'package:flutter_template_weather_app3/constants/enums.dart';
import 'package:flutter_template_weather_app3/convert_units.dart';
import 'package:flutter_template_weather_app3/models/geocoding_model.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class CurrentWeatherDetailsCard extends StatelessWidget with ConvertUnits {
  final Geocoding stateGeocoding;
  final Current stateCurrent;
  final TemperatureUnit stateTemperatureUnit;

  const CurrentWeatherDetailsCard({
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
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 400.0,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
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
                  Column(
                    children: [
                      const Text(
                        'Temperature',
                        style: textContent,
                      ),
                      Text(
                        formattedTemperature(
                            stateCurrent.temp, stateTemperatureUnit),
                        style: textContent,
                      ),
                      Text(
                        'Humidity\n ${stateCurrent.humidity.toString()}%',
                        textAlign: TextAlign.center,
                        style: textContent,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Wind Speed\n ${stateCurrent.windSpeed.toString()} m/s',
                        textAlign: TextAlign.center,
                        style: textContent,
                      ),
                      Text(
                        'Wind Direction\n ${stateCurrent.windDeg.toString()}°',
                        textAlign: TextAlign.center,
                        style: textContent,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Visibility\n ${(stateCurrent.visibility / 1000).toString()} km',
                        textAlign: TextAlign.center,
                        style: textContent,
                      ),
                      Text(
                        'Pressure\n ${stateCurrent.pressure.toString()} hPa',
                        textAlign: TextAlign.center,
                        style: textContent,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'UVI\n ${stateCurrent.uvi.toString()}',
                        textAlign: TextAlign.center,
                        style: textContent,
                      ),
                      Text(
                        'Clouds\n ${(stateCurrent.clouds).toString()}%',
                        textAlign: TextAlign.center,
                        style: textContent,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
