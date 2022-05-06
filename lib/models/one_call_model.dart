// // To parse this JSON data, do
// //
// //     final geoCoding = geoCodingFromJson(jsonString);

// import 'dart:convert';

// GeoCoding geoCodingFromJson(String str) => GeoCoding.fromJson(json.decode(str));

// String geoCodingToJson(GeoCoding data) => json.encode(data.toJson());

class OneCall {
  final double lat;
  final double lon;
  final Current current;
  final List<Current> hourly;
  final List<Daily> daily;

  OneCall({
    required this.lat,
    required this.lon,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory OneCall.fromJson(Map<String, dynamic> json) => OneCall(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        current: Current.fromJson(json["current"]),
        hourly:
            List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "lat": lat,
  //       "lon": lon,
  //       "current": current.toJson(),
  //       "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
  //       "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
  //     };
}

class Current {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final List<Weather> weather;

  Current({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "dt": dt,
  //       "temp": temp,
  //       "feels_like": feelsLike,
  //       "pressure": pressure,
  //       "humidity": humidity,
  //       "uvi": uvi,
  //       "clouds": clouds,
  //       "visibility": visibility,
  //       "wind_speed": windSpeed,
  //       "wind_deg": windDeg,
  //       "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
  //     };
}

class Weather {
  final int id;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        description: json["description"],
        icon: json["icon"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "description": description,
  //       "icon": icon,
  //     };
}

class Hourly {
  final List<Current> hourly;
  final double pop;

  Hourly({
    required this.hourly,
    required this.pop,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        hourly:
            List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        pop: json["hourly"]["pop"],
      );

  // Map<String, dynamic> toJson() => {
  //       "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
  //       "pop": pop,
  //     };
}

class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;
  final int clouds;
  final double pop;
  final double uvi;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        uvi: json["uvi"].toDouble(),
      );

  // Map<String, dynamic> toJson() => {
  //       "dt": dt,
  //       "sunrise": sunrise,
  //       "sunset": sunset,
  //       "temp": temp.toJson(),
  //       "feels_like": feelsLike.toJson(),
  //       "pressure": pressure,
  //       "humidity": humidity,
  //       "wind_speed": windSpeed,
  //       "wind_deg": windDeg,
  //       "wind_gust": windGust,
  //       "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
  //       "clouds": clouds,
  //       "pop": pop,
  //       "uvi": uvi,
  //     };
}

class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  // Map<String, dynamic> toJson() => {
  //       "day": day,
  //       "min": min,
  //       "max": max,
  //       "night": night,
  //       "eve": eve,
  //       "morn": morn,
  //     };
}

class FeelsLike {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  // Map<String, dynamic> toJson() => {
  //       "day": day,
  //       "night": night,
  //       "eve": eve,
  //       "morn": morn,
  //     };
}
