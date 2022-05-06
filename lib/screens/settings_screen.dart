import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/settings_bloc/settings_bloc.dart';
import 'package:flutter_template_weather_app3/constants/text_style_constants.dart';
import 'package:flutter_template_weather_app3/constants/enums.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text('Settings'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          return ListTile(
            title: const Text(
              'Temperature Unit',
              style: textHeader,
            ),
            isThreeLine: true,
            subtitle: Text(
              settingsState.temperatureUnit == TemperatureUnit.celsius
                  ? 'Celcius'
                  : 'Fahrenheit',
              style: textContent,
            ),
            trailing: Switch(
              value: settingsState.temperatureUnit == TemperatureUnit.celsius,
              onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(
                SettingsEventToggleUnit(),
              ),
            ),
          );
        },
      ),
    );
  }
}
