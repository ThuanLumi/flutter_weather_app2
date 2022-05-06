import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template_weather_app3/constants/enums.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(const SettingsState(temperatureUnit: TemperatureUnit.celsius)) {
    on<SettingsEventToggleUnit>(
      (event, emit) {
        final newSettingsState = SettingsState(
          temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius
              ? TemperatureUnit.fahrenheit
              : TemperatureUnit.celsius,
        );
        emit(newSettingsState);
      },
    );
  }
}
