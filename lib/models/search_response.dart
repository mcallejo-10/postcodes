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
    results: List<Result>.from(
      (json["results"] ?? []).map((x) => Result.fromJson(x)),
    ),
    generationtimeMs: json["generationtime_ms"]?.toDouble() ?? 0.0,
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
  final double? elevation;
  final String? featureCode;
  final String? countryCode;
  final int? admin1Id;
  final int? admin2Id;
  final int? admin3Id;
  final String? timezone;
  final int? population;
  final List<String>? postcodes;
  final int? countryId;
  final String? country;
  final String? admin1;
  final String? admin2;
  final String? admin3;

  Result({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.elevation,
    this.featureCode,
    this.countryCode,
    this.admin1Id,
    this.admin2Id,
    this.admin3Id,
    this.timezone,
    this.population,
    this.postcodes,
    this.countryId,
    this.country,
    this.admin1,
    this.admin2,
    this.admin3,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] as int,
    name: json["name"],
    latitude: (json["latitude"] as num).toDouble(),
    longitude: (json["longitude"] as num).toDouble(),
    elevation: (json["elevation"] as num?)?.toDouble(),
    featureCode: json["feature_code"],
    countryCode: json["country_code"],
    admin1Id: json["admin1_id"],
    admin2Id: json["admin2_id"],
    admin3Id: json["admin3_id"],
    timezone: json["timezone"],
    population: json["population"],
    postcodes: json["postcodes"] == null
        ? null
        : List<String>.from(json["postcodes"].map((x) => x)),
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
    "postcodes": postcodes == null
        ? null
        : List<dynamic>.from(postcodes!.map((x) => x)),
    "country_id": countryId,
    "country": country,
    "admin1": admin1,
    "admin2": admin2,
    "admin3": admin3,
  };
}
