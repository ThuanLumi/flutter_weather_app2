import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:flutter_template_weather_app3/services/api_service.dart';
import 'package:flutter_template_weather_app3/models/geocoding_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherCityClickedSearch>(
      (event, emit) async {
        emit(WeatherFetchLoading());
        try {
          final Geocoding geocoding =
              await APIService.instance.getGeocoding(city: event.city);

          final List<Object> getAPIObject = await APIService.instance
              .getGeocoding(city: event.city)
              .then((value) async {
            final results = await Future.wait([
              APIService.instance.getOneCall(
                lat: value.lat.toString(),
                lon: value.lon.toString(),
              ),
            ]);
            return results;
          });

          emit(
            WeatherFetchSuccess(
              geocoding: geocoding,
              oneCall: getAPIObject[0] as OneCall,
            ),
          );
        } catch (e) {
          emit(WeatherFetchFailure());
        }
      },
    );

    on<WeatherCityRefreshed>(
      (event, emit) async {
        emit(WeatherFetchLoading());
        try {
          final Geocoding geocoding =
              await APIService.instance.getGeocoding(city: event.city);

          final List<Object> getAPIObject = await APIService.instance
              .getGeocoding(city: event.city)
              .then((value) async {
            final results = await Future.wait([
              APIService.instance.getOneCall(
                lat: value.lat.toString(),
                lon: value.lon.toString(),
              ),
            ]);
            return results;
          });

          emit(
            WeatherFetchSuccess(
              geocoding: geocoding,
              oneCall: getAPIObject[0] as OneCall,
            ),
          );
        } catch (e) {
          emit(WeatherFetchFailure());
        }
      },
    );

    on<WeatherForecastListItemChosen>(
      (event, emit) async {
        emit(
          WeatherForecastListItemChooseFinish(),
        );
      },
    );
  }
}
