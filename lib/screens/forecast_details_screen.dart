import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/settings_bloc/settings_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
import 'package:flutter_template_weather_app3/widgets/custom_app_bar.dart';
import 'package:flutter_template_weather_app3/widgets/seven_days_forecast_details_card.dart';
import 'package:flutter_template_weather_app3/widgets/seven_days_forecast_tab.dart';

class ForecastDetailsScreen extends StatelessWidget {
  const ForecastDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listTab = [];
    List<Widget> listTabBarView = [];

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        initialIndex: 0,
        length: 7,
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
              slivers: [
                const CustomAppBar(title: 'Forecast Details'),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, weatherState) {
                    if (weatherState is WeatherFetchLoading) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (weatherState is WeatherFetchSuccess) {
                      List<Widget> _buildListTab() {
                        for (int i = 1; i < 8; i++) {
                          listTab.add(
                            SevenDaysForecastTab(
                              stateDailyData: weatherState.oneCall.daily[i],
                            ),
                          );
                        }
                        return listTab;
                      }

                      List<Widget> _buildListTabBarView() {
                        for (int i = 1; i < 8; i++) {
                          listTabBarView.add(
                            BlocBuilder<SettingsBloc, SettingsState>(
                              builder: (context, settingsState) {
                                return SevenDaysForeCastDetailsCard(
                                  stateDailyData: weatherState.oneCall.daily[i],
                                  stateTemperatureUnit:
                                      settingsState.temperatureUnit,
                                );
                              },
                            ),
                          );
                        }
                        return listTabBarView;
                      }

                      return SliverToBoxAdapter(
                        child: Column(
                          children: [
                            TabBar(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 20.0,
                              ),
                              indicatorPadding: const EdgeInsets.all(5),
                              indicator: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              isScrollable: true,
                              tabs: _buildListTab(),
                            ),
                            Container(
                              height: 550.0,
                              child: TabBarView(
                                children: _buildListTabBarView(),
                              ),
                            ),
                          ],
                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
