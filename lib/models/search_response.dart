// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  final List<Result> results;
  final double generationtimeMs;

  SearchResponse({required this.results, required this.generationtimeMs});

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    generationtimeMs: json["generationtime_ms"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "generationtime_ms": generationtimeMs,
  };
}

class Result {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final int elevation;
  final String featureCode;
  final String countryCode;
  final int admin1Id;
  final int admin2Id;
  final int admin3Id;
  final String timezone;
  final int population;
  final List<String> postcodes;
  final int countryId;
  final String country;
  final String admin1;
  final String admin2;
  final String admin3;

  Result({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.admin1Id,
    required this.admin2Id,
    required this.admin3Id,
    required this.timezone,
    required this.population,
    required this.postcodes,
    required this.countryId,
    required this.country,
    required this.admin1,
    required this.admin2,
    required this.admin3,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    elevation: json["elevation"],
    featureCode: json["feature_code"],
    countryCode: json["country_code"],
    admin1Id: json["admin1_id"],
    admin2Id: json["admin2_id"],
    admin3Id: json["admin3_id"],
    timezone: json["timezone"],
    population: json["population"],
    postcodes: List<String>.from(json["postcodes"].map((x) => x)),
    countryId: json["country_id"],
    country: json["country"],
    admin1: json["admin1"],
    admin2: json["admin2"],
    admin3: json["admin3"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "elevation": elevation,
    "feature_code": featureCode,
    "country_code": countryCode,
    "admin1_id": admin1Id,
    "admin2_id": admin2Id,
    "admin3_id": admin3Id,
    "timezone": timezone,
    "population": population,
    "postcodes": List<dynamic>.from(postcodes.map((x) => x)),
    "country_id": countryId,
    "country": country,
    "admin1": admin1,
    "admin2": admin2,
    "admin3": admin3,
  };
}
