import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cocktail_detail_page.dart';

class CocktailListPage extends StatefulWidget {
  @override
  _CocktailListPageState createState() => _CocktailListPageState();
}

class _CocktailListPageState extends State<CocktailListPage> {
  late Future<List<dynamic>> _cocktails;

  @override
  void initState() {
    super.initState();
    _cocktails = fetchCocktails('margarita');
  }

  Future<List<dynamic>> fetchCocktails(String query) async {
    final response = await http.get(
      Uri.parse(
          'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$query'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['drinks'];
    } else {
      throw Exception('Failed to load cocktails');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cócteles'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _cocktails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final cocktails = snapshot.data;
            return ListView.builder(
              itemCount: cocktails!.length,
              itemBuilder: (context, index) {
                final cocktail = cocktails[index];
                return ListTile(
                  title: Text(cocktail['strDrink']),
                  subtitle: Text(cocktail['strCategory']),
                  leading: Image.network(cocktail['strDrinkThumb']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CocktailDetailPage(cocktail: cocktail),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}