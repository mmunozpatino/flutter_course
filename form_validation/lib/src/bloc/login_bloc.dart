import 'dart:async';

class LoginBloc {
  final _emailCrl = StreamController<String>.broadcast(); //sin el broadcast SÓLO puede escuchar uno solo!
  final _passCtrl = StreamController<String>.broadcast();

  // Recuperar los datos del stream 
  Stream<String> get emailStream => _emailCrl.stream;
  Stream<String> get passStream => _passCtrl.stream;


  // Metemos valores
  Function (String) get changeEmail => _emailCrl.sink.add; //la manda como ref, no pone () para no ejecutarla
  Function (String) get changePass => _passCtrl.sink.add; 

  dispose() {
    _emailCrl?.close();
    _passCtrl?.close();
  }

}