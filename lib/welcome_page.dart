import 'package:flutter/material.dart';
import 'package:tarea6_irissagastume/cocktail_list_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido a Super Cocteles!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CocktailListPage()),
                );
              },
              child: Text('Ver cócteles'),
            ),
          ],
        ),
      ),
    );
  }
}
