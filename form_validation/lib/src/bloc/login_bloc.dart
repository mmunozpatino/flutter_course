import 'dart:async';

import 'package:form_validation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{
  final _emailCrl = BehaviorSubject<String>.seeded(''); //sin el broadcast SÓLO puede escuchar uno solo!
  final _passCtrl = BehaviorSubject<String>.seeded('');

  // Recuperar los datos del stream 
  Stream<String> get emailStream => _emailCrl.stream.transform( validateEmail );
  Stream<String> get passStream => _passCtrl.stream.transform( validatePass );

  Stream<bool> get isValidForm => 
      Observable.combineLatest2(emailStream, passStream, (e, p) => true);

  // Metemos valores
  Function (String) get changeEmail => _emailCrl.sink.add; //la manda como ref, no pone () para no ejecutarla
  Function (String) get changePass => _passCtrl.sink.add; 

  // ultimo valor de los streams
  String get email => _emailCrl.value;
  String get pass => _passCtrl.value;


  dispose() {
    _emailCrl?.close();
    _passCtrl?.close();
  }

}