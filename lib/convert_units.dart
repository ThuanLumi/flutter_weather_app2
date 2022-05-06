import 'package:flutter_template_weather_app3/constants/enums.dart';

mixin ConvertUnits {
  // convert celcius to fahrenheit
  int toFahrenheit(double celcius) => ((celcius * 9 / 5) + 32).round();

  String formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit
          ? '${toFahrenheit(temp)}°F'
          : '${temp.round()}°C';
}
