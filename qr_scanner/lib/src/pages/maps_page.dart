import 'package:flutter/material.dart';
import 'package:qr_scanner/src/bloc/scan_bloc.dart';
import 'package:qr_scanner/src/models/scan_model.dart';

class MapsPage extends StatelessWidget {

  final ScanBloc scanBloc = ScanBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ScanModel>>(
        stream: scanBloc.scanStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final scans = snapshot.data;

          if (scans.length == 0) {
            return Center(
              child: Text('No hay información'),
            );
          }

          return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, i) => Dismissible(
              key: UniqueKey(),
              child: ListTile(
                leading: Icon(Icons.cloud_queue,
                    color: Theme.of(context).primaryColor),
                title: Text(scans[i].value),
                subtitle: Text(' ID ${scans[i].id}'),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              ),
              background: Container(
                color: Colors.red,
                child: Icon(Icons.remove_circle_outline),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15.0),
              ),
              secondaryBackground: Container(
                color: Colors.green,
                child: Icon(Icons.check_circle_outline),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(15.0),
              ),
              onDismissed: (DismissDirection direction) {
                if(direction == DismissDirection.startToEnd) {
                  scanBloc.deleteScan(scans[i].id);
                }
              },
            ),
          );
        });
  }
}
