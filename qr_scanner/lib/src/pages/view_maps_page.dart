import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:latlong/latlong.dart';

class ViewMapsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location), 
            onPressed: () {}
          )
        ],
      ),
      body: _renderMap(scan),
    );
  }

  Widget _renderMap(ScanModel scan) {

    return FlutterMap(
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15
      ),
      layers: [
        _render()
      ],
    );
  }

  _render() {

    return TileLayerOptions(
        urlTemplate:
            'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}',
        additionalOptions: {
            'accessToken':
            'pk.eyJ1IjoibW11bm96YXRpbm8iLCJhIjoiY2tnbGhhMTdoMDRsajJwcDlqNG9kdnRqaCJ9.yXguYnypegk_6czcnG2-pA',
            'id': 'mapbox/streets-v11'
        }
    );
  }
}

