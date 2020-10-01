import 'package:flutter/material.dart';
import 'package:qr_scanner/src/pages/directions_page.dart';
import 'package:qr_scanner/src/pages/maps_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _renderPage(_currentIndex),
      bottomNavigationBar: _renderBottomNavBar(),
    );
  }

  Widget _renderBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex, //elementSelected
      onTap: (i) {
        setState(() {
          _currentIndex = i;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('mapa')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('direcciones')
        ),
      ]
    );
  }

  Widget _renderPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return MapsPage();
      case 1:
        return DirectionsPage();
      default:
        return MapsPage();
    }
  }
}