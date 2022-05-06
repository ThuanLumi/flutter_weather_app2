part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final TemperatureUnit temperatureUnit;

  const SettingsState({required this.temperatureUnit});

  @override
  List<Object> get props => [temperatureUnit];
}
