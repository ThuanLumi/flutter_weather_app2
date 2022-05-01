import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/models/geocoding_model.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class CurrentWeatherDetailsCard extends StatelessWidget {
  final Geocoding stateGeocoding;
  final Current stateCurrent;

  const CurrentWeatherDetailsCard({
    Key? key,
    required this.stateGeocoding,
    required this.stateCurrent,
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
                  Text('${stateCurrent.temp.round().toInt().toString()}°C'),
                  Column(
                    children: [
                      Text(stateCurrent.weather[0].description),
                      Text(
                        'Feels like ${stateCurrent.feelsLike.round().toInt().toString()}°C',
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Wind Speed\n ${stateCurrent.windSpeed.toString()} m/s',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Humidity\n ${stateCurrent.humidity.toString()}%',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Visibility\n ${(stateCurrent.visibility / 1000).toString()} km',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Pressure\n ${stateCurrent.pressure.toString()} hPa',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Wind Direction\n ${stateCurrent.windDeg.toString()}°',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'UVI\n ${stateCurrent.uvi.toString()}',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Clouds\n ${(stateCurrent.clouds).toString()}%',
                    textAlign: TextAlign.center,
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
