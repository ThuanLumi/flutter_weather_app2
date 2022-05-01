import 'package:flutter_template_weather_app3/models/geocoding_model.dart';
import 'package:flutter_template_weather_app3/models/one_call_model.dart';
import 'package:flutter_template_weather_app3/utils/api_key.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  APIService._instance();

  static final APIService instance = APIService._instance();

  final String _baseUrl = 'api.openweathermap.org';

  // get geocoding
  Future<Geocoding> getGeocoding({required String city}) async {
    Map<String, String> parameters = {
      'q': city,
      'appid': apiKey,
    };

    Uri uri = Uri.https(_baseUrl, '/geo/1.0/direct', parameters);
    // print(uri);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    try {
      var response = await http.get(uri, headers: headers);

      var data = json.decode(response.body);
      // print(data);

      Geocoding geoCoding = Geocoding.fromJson(data);
      // print(geoCoding);

      return geoCoding;
    } catch (err) {
      throw err.toString();
    }
  }

  // get one call
  Future<OneCall> getOneCall({required String lat, required String lon}) async {
    Map<String, String> parameters = {
      'lat': lat,
      'lon': lon,
      'exclude': 'minutely',
      'units': 'metric',
      'appid': apiKey,
    };

    Uri uri = Uri.https(_baseUrl, '/data/2.5/onecall', parameters);
    // print(uri);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    try {
      var response = await http.get(uri, headers: headers);

      Map<String, dynamic> data = json.decode(response.body);
      // print(data);

      OneCall oneCall = OneCall.fromJson(data);
      // print(oneCall);

      return oneCall;
    } catch (err) {
      throw err.toString();
    }
  }
}
