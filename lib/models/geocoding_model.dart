class Geocoding {
  final String name;
  final double lat;
  final double lon;
  final String country;

  Geocoding({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  factory Geocoding.fromJson(var json) => Geocoding(
        name: json[0]["name"],
        lat: json[0]["lat"],
        lon: json[0]["lon"],
        country: json[0]["country"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lat": lat,
        "lon": lon,
        "country": country,
      };
}
