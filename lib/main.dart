import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'cocktail_list_page.dart';
import 'all_cocktails_detail_page.dart';

void main() {
  runApp(Tarea6App());
}

class Tarea6App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programación Móvil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    WelcomePage(),
    CocktailListPage(),
    AllCocktailsDetailPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Bienvenida',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_bar),
            label: 'Lista de Cócteles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Todos los detalles de los cócteles',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
