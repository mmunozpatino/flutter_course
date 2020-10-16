import 'package:flutter/material.dart';
import 'package:qr_scanner/src/pages/directions_page.dart';
import 'package:qr_scanner/src/pages/maps_page.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_scanner/src/providers/db_provider.dart';

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
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _renderPage(_currentIndex),
      bottomNavigationBar: _renderBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _scanQr,
        child: Icon(Icons.filter_center_focus),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQr() async {

    //TODO: https://fernando-herrera.com
    String futureString = 'https://fernando-herrera.com';

    // try{
    //   futureString = (await BarcodeScanner.scan()).rawContent;
    // } catch( e ) {
    //   futureString = e.toString();
    // }

    if(futureString != null) {
      final scan = ScanModel(value: futureString);
      DbProvider.instance.newScan(scan);
    }
    
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