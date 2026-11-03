import 'package:flutter/material.dart';
import 'package:postcodes/models/search_response.dart';
import 'package:postcodes/screens/place_detail_screen.dart';
import 'package:postcodes/services/serch_service.dart';
import 'package:postcodes/styles/app_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  bool hasSearched = false;

  final TextEditingController searchController = TextEditingController();
  late Future<SearchResponse> data;

  @override
  void initState() {
    super.initState();
    data = Future.value(SearchResponse(results: [], generationtimeMs: 0.0));
  }

  void clearSearch() {
    searchController.clear();
    query = '';
    hasSearched = false;
    data = Future.value(SearchResponse(results: [], generationtimeMs: 0.0));
    setState(() {});
  }

  void openPlaceDetail(Result place) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlaceDetailScreen(place: place)),
    );
  }

  Future<SearchResponse> loadData(String query) async {
    try {
      SearchResponse result = await SearchService().getBody(query);
      return (result);
    } catch (e) {
      debugPrint('Error in load data: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CODIS POSTALS'),
        titleTextStyle: AppStyles.appBarTitle,
      ),
      body: Column(
        children: [
          Padding(
            padding: AppStyles.headingPadding.padding,
            child: Form(
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  query = value;
                },
                onSubmitted: (value) {
                  data = loadData(query.toString());
                  hasSearched = true;
                  setState(() {});
                },
                decoration: InputDecoration(
                  labelText: 'Codi postal/municipi',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      clearSearch();
                    },
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          AppStyles.mediumSeparator,

          FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                debugPrint('Error in FutureBuilder: ${snapshot.error}');
                return Text(
                  'Error carregant les dades',
                  style: AppStyles.error,
                );
              } else if (snapshot.hasData) {
                final results = snapshot.data!.results;
                if (results.isEmpty) {
                  return hasSearched
                      ? const Text('No s\'han trobat resultats')
                      : const Text('Introdueix un codi postal, o municipi');
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final Result r = results[index];
                      return Padding(
                        padding: AppStyles.padding.padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => openPlaceDetail(r),
                              child: Text(
                                '${r.name}, ${r.admin2}, ${r.admin1}',
                              ),
                            ),
                            AppStyles.smallSeparator,
                            Text(
                              (r.postcodes?.length ?? 0) == 1
                                  ? 'Codi postal del municipi:'
                                  : 'Codis postals del municipi:',
                            ),
                            Text((r.postcodes ?? []).join(', ')),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox.expand();
            },
          ),
        ],
      ),
    );
  }
}
