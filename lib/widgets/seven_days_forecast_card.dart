import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
import 'package:flutter_template_weather_app3/constants/enums.dart';
import 'package:flutter_template_weather_app3/convert_units.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class SevenDaysForecastCard extends StatelessWidget with ConvertUnits {
  final List<Daily> stateDaily;
  final TemperatureUnit stateTemperatureUnit;

  const SevenDaysForecastCard({
    Key? key,
    required this.stateDaily,
    required this.stateTemperatureUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat.MMMEd();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '7-day Forecast',
            style: textHeader,
          ),
          const SizedBox(height: 20.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 670.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Card(
              color: Colors.grey[400],
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: stateDaily.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            _formatTime.format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  stateDaily[index].dt * 1000),
                            ),
                            style: textContent,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${stateDaily[index].weather[0].icon}.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              '${formattedTemperature(stateDaily[index].temp.min, stateTemperatureUnit)} \n ${formattedTemperature(stateDaily[index].temp.max, stateTemperatureUnit)}',
                              textAlign: TextAlign.right,
                              style: textContent,
                            ),
                            Container(
                              width: 70.0,
                              child: Text(
                                '${stateDaily[index].weather[0].description.split(' ')[0][0].toUpperCase()}${stateDaily[index].weather[0].description.split(' ')[0].substring(1)} \n ${stateDaily[index].weather[0].description.split(' ')[1]}',
                                textAlign: TextAlign.center,
                                style: textContent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
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
                Navigator.of(context).pushNamed('/forecast_details');
              },
            ),
          ),
        ],
      ),
    );
  }
}
