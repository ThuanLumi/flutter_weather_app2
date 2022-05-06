import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
import 'package:flutter_template_weather_app3/constants/enums.dart';
import 'package:flutter_template_weather_app3/convert_units.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class SevenDaysForeCastDetailsCard extends StatelessWidget with ConvertUnits {
  final Daily stateDailyData;
  final TemperatureUnit stateTemperatureUnit;

  const SevenDaysForeCastDetailsCard({
    Key? key,
    required this.stateDailyData,
    required this.stateTemperatureUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat.MMMEd();
    final _formatTime1 = DateFormat.jm();

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
                    Text(
                      _formatTime.format(
                        DateTime.fromMillisecondsSinceEpoch(
                            stateDailyData.dt * 1000),
                      ),
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
                                'assets/images/${stateDailyData.weather[0].icon}.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        '${stateDailyData.weather[0].description[0].toUpperCase()}${stateDailyData.weather[0].description.substring(1)}',
                        style: textContent,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Temperature ${formattedTemperature(
                          stateDailyData.temp.day,
                          stateTemperatureUnit,
                        )}',
                        style: textContent,
                      ),
                      Text(
                        'Feels like ${formattedTemperature(
                          stateDailyData.feelsLike.day,
                          stateTemperatureUnit,
                        )}',
                        style: textContent,
                      ),
                      Text(
                        'Precipitation ${(stateDailyData.pop * 100).round().toString()}%',
                        style: textContent,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Wind Speed\n ${stateDailyData.windSpeed.toString()} m/s',
                        style: textContent,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Wind Direction\n ${stateDailyData.windDeg.toString()}°',
                        style: textContent,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Humidity\n ${stateDailyData.humidity.toString()}%',
                        style: textContent,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Pressure\n ${stateDailyData.pressure.toString()} hPa',
                        style: textContent,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'UVI\n ${stateDailyData.uvi.toString()}',
                        style: textContent,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Clouds\n ${(stateDailyData.clouds).toString()}%',
                        style: textContent,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(''),
                      Text(
                        'Morning',
                        style: textContent,
                      ),
                      Text(
                        'Afternoon',
                        style: textContent,
                      ),
                      Text(
                        'Evening',
                        style: textContent,
                      ),
                      Text(
                        'Night',
                        style: textContent,
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
                          stateDailyData.temp.morn,
                          stateTemperatureUnit,
                        ),
                        style: textContent,
                      ),
                      Text(
                        formattedTemperature(
                          stateDailyData.temp.day,
                          stateTemperatureUnit,
                        ),
                        style: textContent,
                      ),
                      Text(
                        formattedTemperature(
                          stateDailyData.temp.eve,
                          stateTemperatureUnit,
                        ),
                        style: textContent,
                      ),
                      Text(
                        formattedTemperature(
                          stateDailyData.temp.night,
                          stateTemperatureUnit,
                        ),
                        style: textContent,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Feelslike',
                        style: textContent,
                      ),
                      Text(
                        formattedTemperature(
                          stateDailyData.feelsLike.morn,
                          stateTemperatureUnit,
                        ),
                        style: textContent,
                      ),
                      Text(
                        formattedTemperature(
                          stateDailyData.feelsLike.day,
                          stateTemperatureUnit,
                        ),
                        style: textContent,
                      ),
                      Text(
                        formattedTemperature(
                          stateDailyData.feelsLike.eve,
                          stateTemperatureUnit,
                        ),
                        style: textContent,
                      ),
                      Text(
                        formattedTemperature(
                          stateDailyData.feelsLike.night,
                          stateTemperatureUnit,
                        ),
                        style: textContent,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Sunrise',
                        style: textContent,
                      ),
                      Text(
                        _formatTime1.format(
                          DateTime.fromMillisecondsSinceEpoch(
                              stateDailyData.sunrise * 1000),
                        ),
                        style: textContent,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Sunset',
                        style: textContent,
                      ),
                      Text(
                        _formatTime1.format(
                          DateTime.fromMillisecondsSinceEpoch(
                              stateDailyData.sunset * 1000),
                        ),
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
