import 'package:flutter/material.dart';
import 'package:qr_scanner/src/bloc/scan_bloc.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:qr_scanner/src/pages/directions_page.dart';
import 'package:qr_scanner/src/pages/maps_page.dart';

import 'package:qr_scanner/src/widgets/custom_navigationBar.dart';
import 'package:qr_scanner/src/widgets/scan_button.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final ScanBloc scanBloc = ScanBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete_forever), onPressed: scanBloc.deleteAllScans)
        ],
      ),
      body: _renderPage(_currentIndex),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScanButton(),
    );
  }

  _scanQr() async {

    //TODO: https://fernando-herrera.com
    //TODO geo:40.724233047051705,-74.00731459101564
    String futureString = 'https://fernando-herrera.com';

    // try{
    //   futureString = (await BarcodeScanner.scan()).rawContent;
    // } catch( e ) {
    //   futureString = e.toString();
    // }

    if(futureString != null) {
      final scan = ScanModel(value: futureString);
      scanBloc.addScan(scan);

      final scan2 = ScanModel(value: 'geo:40.724233047051705,-74.00731459101564');
      scanBloc.addScan(scan2);
    }


    
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