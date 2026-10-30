import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:postcodes/models/search_response.dart';

class SearchService {
  final String baseUrl = "https://geocoding-api.open-meteo.com/v1";

  Future<SearchResponse> getBody(String query) async {
    final http.Response response = await http.get(
      Uri.parse('$baseUrl/search?name=$query&language=ca&countryCode=ES'),
    );
    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode}");
    }
    debugPrint('Response body: ${response.body}');
    return searchResponseFromJson(response.body);
  }
}
