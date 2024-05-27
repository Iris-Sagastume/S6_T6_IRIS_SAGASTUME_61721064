import 'package:flutter/material.dart';

class CocktailDetailPage extends StatelessWidget {
  final dynamic cocktail;

  CocktailDetailPage({@required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail['strDrink']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Image.network(cocktail['strDrinkThumb']),
            ),
            SizedBox(height: 16),
            Text(
              'Name: ${cocktail['strDrink'] ?? 'N/A'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Category: ${cocktail['strCategory'] ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              cocktail['strInstructions'] ?? 'N/A',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            for (int i = 1; i <= 15; i++)
              if (cocktail['strIngredient$i'] != null &&
                  cocktail['strIngredient$i'].isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    '${cocktail['strIngredient$i']}: ${cocktail['strMeasure$i'] ?? ''}',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
