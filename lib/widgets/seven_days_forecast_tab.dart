import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class SevenDaysForecastTab extends StatelessWidget {
  final Daily stateDailyData;

  const SevenDaysForecastTab({
    Key? key,
    required this.stateDailyData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat.MMMEd();

    return Tab(
      height: 100.0,
      child: Container(
        height: 100.0,
        width: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime.format(
                DateTime.fromMillisecondsSinceEpoch(
                  (stateDailyData.dt * 1000),
                ),
              ),
              style: textContent,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/${stateDailyData.weather[0].icon}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 70.0,
                  child: Text(
                    '${stateDailyData.weather[0].description[0].toUpperCase()}${stateDailyData.weather[0].description.substring(1)}',
                    textAlign: TextAlign.center,
                    style: textContent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
