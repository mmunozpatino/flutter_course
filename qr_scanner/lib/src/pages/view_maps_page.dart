import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:latlong/latlong.dart';

class ViewMapsPage extends StatefulWidget {

  @override
  _ViewMapsPageState createState() => _ViewMapsPageState();
}

class _ViewMapsPageState extends State<ViewMapsPage> {
  final MapController mapCtrl = MapController();

  String mapType = 'streets';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location), 
            onPressed: () {
              mapCtrl.move(scan.getLatLng(), 15);
            }
          )
        ],
      ),
      body: _renderMap(scan),
      floatingActionButton: _renderFloatingActionButton(context)
    );
  }

  Widget _renderMap(ScanModel scan) {

    return FlutterMap(
      mapController: mapCtrl,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15
      ),
      layers: [
        _render(),
        _renderPin(scan)  
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
            'id': 'mapbox/$mapType-v11'
        }
    );
  }

  _renderPin(ScanModel scan) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (BuildContext context) => Container(
            child: Icon(
              Icons.location_on, 
              size: 45.0,
              color: Theme.of(context).primaryColor
            )
          )
        )
      ]
    );
  }

  Widget _renderFloatingActionButton(BuildContext context) {

    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {

        // if(mapType == 'streets') {
        //     mapType = 'dark';
        // } else if (mapType == 'dark') {
        //     mapType = "streets";
        // }

        // setState(() {
          
        // });
      },
    );
  }
}

