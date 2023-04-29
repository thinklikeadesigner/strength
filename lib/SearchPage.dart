import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> exercises = [
    'Squats',
    'Deadlifts',
    'Bench Press',
    'Pull-ups',
    'Push-ups'
  ];
  List<String> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _buildSearchResults();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // perform search logic here
  }

  ListView _buildSearchResults() {
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_searchResults[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // build your UI here
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search...',
            ),
          ),
        ),
        body: _buildSearchResults());
  }
}
