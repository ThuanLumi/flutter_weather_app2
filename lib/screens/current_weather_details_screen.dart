import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/settings_bloc/settings_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
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
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              const CustomAppBar(title: 'Current Weather Details'),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, weatherState) {
                  if (weatherState is WeatherFetchLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (weatherState is WeatherFetchSuccess) {
                    return BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, settingsState) {
                        return SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              CurrentWeatherDetailsCard(
                                stateGeocoding: weatherState.geocoding,
                                stateCurrent: weatherState.oneCall.current,
                                stateTemperatureUnit:
                                    settingsState.temperatureUnit,
                              ),
                              HourlyForecastList(
                                stateHourlyData:
                                    weatherState.oneCall.hourly.sublist(0, 12),
                                stateTemperatureUnit:
                                    settingsState.temperatureUnit,
                              ),
                              HourlyForecastChart(
                                stateHourlyData:
                                    weatherState.oneCall.hourly.sublist(0, 12),
                                stateTemperatureUnit:
                                    settingsState.temperatureUnit,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (weatherState is WeatherFetchFailure) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Something went wrong!',
                          style: textError,
                        ),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Something went wrong!',
                        style: textError,
                      ),
                    ),
                  );
                },
              ),
              const SliverPadding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
