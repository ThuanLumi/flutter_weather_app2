import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
import 'package:flutter_template_weather_app3/constants/enums.dart';
import 'package:flutter_template_weather_app3/convert_units.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HourlyForecastChart extends StatelessWidget with ConvertUnits {
  final List<Current> stateHourlyData;
  final TemperatureUnit stateTemperatureUnit;

  const HourlyForecastChart({
    Key? key,
    required this.stateHourlyData,
    required this.stateTemperatureUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat.j();
    var newString = formattedTemperature(0, stateTemperatureUnit)
        .substring(formattedTemperature(0, stateTemperatureUnit).length - 2);

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        top: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 300.0,
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SfCartesianChart(
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  textStyle: textLegend,
                ),
                // title: ChartTitle(text: 'Summary Chart'),
                axes: [
                  CategoryAxis(
                    name: 'yAxis',
                    // title: AxisTitle(text: 'Humidity (%)'),
                    opposedPosition: true,
                    interval: 10,
                    minimum: 0,
                    maximum: 100,
                  ),
                ],
                primaryXAxis: CategoryAxis(interval: 1),
                primaryYAxis: CategoryAxis(
                  // title: AxisTitle(text: 'Temperature (°C)'),
                  interval:
                      stateTemperatureUnit == TemperatureUnit.celsius ? 3 : 10,
                ),
                series: <ChartSeries<Current, String>>[
                  SplineSeries(
                    dataSource: stateHourlyData,
                    legendItemText: 'Temperature ($newString)',
                    color: Colors.red,
                    xValueMapper: (Current f, _) => _formatTime.format(
                      DateTime.fromMillisecondsSinceEpoch(f.dt * 1000),
                    ),
                    yValueMapper: (Current f, _) =>
                        stateTemperatureUnit == TemperatureUnit.celsius
                            ? f.temp
                            : toFahrenheit(f.temp),
                  ),
                  SplineSeries(
                    dataSource: stateHourlyData,
                    legendItemText: 'Humidity (%)',
                    color: Colors.blue,
                    xValueMapper: (Current f, _) => _formatTime.format(
                      DateTime.fromMillisecondsSinceEpoch(f.dt * 1000),
                    ),
                    yValueMapper: (Current f, _) => f.humidity,

                    //Bind the y-axis to secondary y-axis.
                    yAxisName: 'yAxis',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
