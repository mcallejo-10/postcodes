import 'package:flutter/material.dart';
import 'package:postcodes/models/search_response.dart';
import 'package:postcodes/services/serch_service.dart';
import 'package:postcodes/styles/app_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String query = '';
  String searchControllerText() {
    return ('search?name=$query&language=ca&countryCode=ES');
  }

  late Future<SearchResponse> data;

  @override
  void initState() {
    super.initState();
    data = Future.value(SearchResponse(results: [], generationtimeMs: 0.0));
  }

  void clearSearch() {
    searchController.clear();
    query = '';
    setState(() {});
  }

  Future<SearchResponse> loadData(String query) async {
    try {
      SearchResponse result = await SearchService().getBody(query);
      debugPrint(
        'RESULT: ${result.results.isNotEmpty ? result.results[0].admin1 : 'No results'}',
      );
      debugPrint('query: $query');
      return (result);
    } catch (e) {
      debugPrint('Error in load data: $e');
    }
    return SearchResponse(results: [], generationtimeMs: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CODIS POSTALS'),
        titleTextStyle: AppStyles.heading,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  query = value;
                },
                onSubmitted: (value) {
                  data = loadData(query.toString());
                  setState(() {});
                },
                decoration: InputDecoration(
                  labelText: 'Codi postal',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      clearSearch();
                    },
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: TextField(
                decoration: const InputDecoration(labelText: 'Municipi'),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          SizedBox(height: 48),
          FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error-: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final results = snapshot.data!.results;
                if (results.isEmpty) {
                  return const Text('Introdueix un codi postal, o municipi');
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final Result r = results[index];
                      return ListTile(
                        title: Text(r.name),
                        subtitle: Text((r.postcodes ?? []).join(', ')),
                      );
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
