import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class SevenDaysForeCastDetailsCard extends StatelessWidget {
  final List<Daily> stateDailyData;

  const SevenDaysForeCastDetailsCard({
    Key? key,
    required this.stateDailyData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat.MMMEd();

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
                    Text(_formatTime.format(
                      DateTime.fromMillisecondsSinceEpoch(
                          stateDailyData[0].dt * 1000),
                    )),
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
                            'assets/images/${stateDailyData[0].weather[0].icon}.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                      '${stateDailyData[0].temp.day.round().toInt().toString()}°C'),
                  Column(
                    children: [
                      Text(stateDailyData[0].weather[0].description),
                      Text(
                        'Feels like ${stateDailyData[0].feelsLike.day.round().toInt().toString()}°C',
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Wind Speed\n ${stateDailyData[0].windSpeed.toString()} m/s',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Humidity\n ${stateDailyData[0].humidity.toString()}%',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Pressure\n ${stateDailyData[0].pressure.toString()} hPa',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Wind Direction\n ${stateDailyData[0].windDeg.toString()}°',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'UVI\n ${stateDailyData[0].uvi.toString()}',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Clouds\n ${(stateDailyData[0].clouds).toString()}%',
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
