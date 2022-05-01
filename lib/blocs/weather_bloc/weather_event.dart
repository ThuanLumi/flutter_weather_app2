part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherCityClickedSearch extends WeatherEvent {
  final String city;

  const WeatherCityClickedSearch({required this.city});

  @override
  List<Object?> get props => [city];
}

class WeatherCityRefreshed extends WeatherEvent {
  final String city;

  const WeatherCityRefreshed({required this.city});

  @override
  List<Object?> get props => [city];
}

class WeatherForecastListItemChosen extends WeatherEvent {
  final int index;

  const WeatherForecastListItemChosen({required this.index});

  @override
  List<Object?> get props => [index];
}
