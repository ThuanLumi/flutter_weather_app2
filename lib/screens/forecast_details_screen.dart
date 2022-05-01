import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_template_weather_app3/widgets/custom_app_bar.dart';
import 'package:flutter_template_weather_app3/widgets/seven_days_forecast_chart.dart';
import 'package:flutter_template_weather_app3/widgets/seven_days_forecast_details_card.dart';
import 'package:intl/intl.dart';

class ForecastDetailsScreen extends StatelessWidget {
  const ForecastDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formatTime = DateFormat.MMMEd();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            const CustomAppBar(title: 'Forecast Details'),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherFetchLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is WeatherFetchSuccess) {
                  List<Widget> _buildListTab() {
                    List<Widget> listTab = [];

                    for (int i = 1; i < 8; i++) {
                      listTab.add(
                        Tab(
                          text: _formatTime.format(
                            DateTime.fromMillisecondsSinceEpoch(
                              (state.oneCall.daily[i].dt * 1000),
                            ),
                          ),
                        ),
                      );
                    }
                    return listTab;
                  }

                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SevenDaysForecastChart(
                          stateDailyData: state.oneCall.daily.sublist(1, 8),
                        ),
                        DefaultTabController(
                          initialIndex: 1,
                          length: state.oneCall.daily.sublist(1, 8).length,
                          child: TabBar(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            labelColor: Colors.black,
                            isScrollable: true,
                            tabs: _buildListTab(),
                          ),
                        ),
                        SevenDaysForeCastDetailsCard(
                          stateDailyData: state.oneCall.daily.sublist(1, 8),
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
