part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherFetchLoading extends WeatherState {}

class WeatherFetchSuccess extends WeatherState {
  final Geocoding geocoding;
  final OneCall oneCall;

  const WeatherFetchSuccess({
    required this.geocoding,
    required this.oneCall,
  });

  @override
  List<Object> get props => [geocoding, oneCall];
}

class WeatherFetchFailure extends WeatherState {}
