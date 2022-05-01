import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:intl/intl.dart';

class SevenDaysForecast extends StatelessWidget {
  final List<Daily> stateDaily;

  const SevenDaysForecast({
    Key? key,
    required this.stateDaily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat.MMMEd();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('7-day forecast'),
          const SizedBox(height: 20.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 500.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Card(
              color: Colors.blue[200],
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
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${stateDaily[index].weather[0].icon}.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              '${stateDaily[index].temp.min.round().toInt()}°C \n ${stateDaily[index].temp.max.round().toInt()}°C',
                              textAlign: TextAlign.right,
                            ),
                            Container(
                              width: 60.0,
                              child: Text(
                                '${stateDaily[index].weather[0].description.split(' ')[0]} \n ${stateDaily[index].weather[0].description.split(' ')[1]}',
                                textAlign: TextAlign.center,
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
              child: const Text('View details'),
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
