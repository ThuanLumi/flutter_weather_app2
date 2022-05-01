import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_template_weather_app3/widgets/custom_app_bar.dart';
import 'package:flutter_template_weather_app3/widgets/current_weather_card.dart';
import 'package:flutter_template_weather_app3/widgets/seven_days_forecast_card.dart';

class MainWeatherScreen extends StatelessWidget {
  const MainWeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            const CustomAppBar(title: 'Main Weather Screen'),
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
                        CurrentWeatherCard(
                          stateGeocoding: state.geocoding,
                          stateCurrent: state.oneCall.current,
                        ),
                        SevenDaysForecast(
                          stateDaily: state.oneCall.daily.sublist(1, 8),
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
