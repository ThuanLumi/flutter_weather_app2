import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
import 'package:flutter_template_weather_app3/constants/enums.dart';
import 'package:flutter_template_weather_app3/convert_units.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class HourlyForecastList extends StatelessWidget with ConvertUnits {
  final List<Current> stateHourlyData;
  final TemperatureUnit stateTemperatureUnit;

  const HourlyForecastList({
    Key? key,
    required this.stateHourlyData,
    required this.stateTemperatureUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat.j();

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        top: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stateHourlyData.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 150.0,
                  child: Card(
                    color: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 2.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _formatTime.format(
                            DateTime.fromMillisecondsSinceEpoch(
                                stateHourlyData[index].dt * 1000),
                          ),
                          style: textContent,
                        ),
                        Text(
                          formattedTemperature(stateHourlyData[index].temp,
                              stateTemperatureUnit),
                          style: textContent,
                        ),
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/${stateHourlyData[index].weather[0].icon}.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          '${stateHourlyData[index].weather[0].description[0].toUpperCase()}${stateHourlyData[index].weather[0].description.substring(1)}',
                          style: textContent,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
