import 'dart:async';

import 'package:qr_scanner/src/providers/db_provider.dart';

class ScanBloc{
  static final ScanBloc _singleton = ScanBloc._();

  factory ScanBloc() {
    return _singleton;
  }

  ScanBloc._(){
    //scans de la DB
    getScans();
  }

  final _scanStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scanStream => _scanStreamController.stream;


  dispose() {
    _scanStreamController?.close(); //funciona como el ? de kotlin
  }

  addScan(ScanModel scan) async{
    await DbProvider.instance.newScan(scan);
    getScans();
  }

  getScans() async {
    _scanStreamController.sink.add(await DbProvider.instance.getAllScan());
  }

  deleteScan(int id) async{
    await DbProvider.instance.deleteScan(id);
    getScans(); //update the list
  }

  deleteAllScans() async{
    await DbProvider.instance.deleteAll();
    getScans(); //update the list
  }
}