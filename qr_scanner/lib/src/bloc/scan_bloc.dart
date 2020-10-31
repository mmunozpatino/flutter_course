import 'dart:async';

import 'package:qr_scanner/src/bloc/validator.dart';
import 'package:qr_scanner/src/providers/db_provider.dart';

class ScanBloc extends Validators{
  static final ScanBloc _singleton = ScanBloc._();

  factory ScanBloc() {
    //factory es un constructor que no necesariamente genera una instancia nueva!
    return _singleton;
  }

  ScanBloc._(){
    //scans de la DB
    getScans();
  }

  final _scanStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scanStream => _scanStreamController.stream.transform(validateGeo);
  Stream<List<ScanModel>> get scanStreamHttp => _scanStreamController.stream.transform(validateHttp);


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

  getScansByType() {

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