import 'package:flutter/material.dart';
import 'package:flutter_template_weather_app3/screens/city_search_screen.dart';
import 'package:flutter_template_weather_app3/screens/current_weather_details_screen.dart';
import 'package:flutter_template_weather_app3/screens/forecast_details_screen.dart';
import 'package:flutter_template_weather_app3/screens/settings_screen.dart';
import 'package:flutter_template_weather_app3/screens/main_weather_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => CitySearchScreen(),
        );
      case '/main':
        return MaterialPageRoute(
          builder: (_) => const MainWeatherScreen(),
        );
      case '/current_details':
        return MaterialPageRoute(
          builder: (_) => const CurrentWeatherDetailsScreen(),
        );
      case '/forecast_details':
        return MaterialPageRoute(
          builder: (_) => const ForecastDetailsScreen(),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => CitySearchScreen(),
        );
    }
  }
}
