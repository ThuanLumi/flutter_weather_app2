import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/settings_bloc/settings_bloc.dart';
import 'package:flutter_template_weather_app3/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_template_weather_app3/routes/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Weather App',
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
