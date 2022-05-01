import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_template_weather_app3/widgets/current_weather_details_card.dart';
import 'package:flutter_template_weather_app3/widgets/custom_app_bar.dart';
import 'package:flutter_template_weather_app3/widgets/hourly_forecast_chart.dart';
import 'package:flutter_template_weather_app3/widgets/hourly_forecast_list.dart';

class CurrentWeatherDetailsScreen extends StatelessWidget {
  const CurrentWeatherDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            const CustomAppBar(title: 'Current Weather Details'),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherFetchLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is WeatherFetchSuccess) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        CurrentWeatherDetailsCard(
                          stateGeocoding: state.geocoding,
                          stateCurrent: state.oneCall.current,
                        ),
                        HourlyForecastList(
                          stateHourlyData: state.oneCall.hourly.sublist(0, 12),
                        ),
                        HourlyForecastChart(
                          stateHourlyData: state.oneCall.hourly.sublist(0, 12),
                        ),
                      ],
                    ),
                  );
                } else if (state is WeatherFetchFailure) {
                  return const SliverToBoxAdapter(
                    child: Text('Something went wrong!'),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Text('Something went wrong!'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
