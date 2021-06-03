

import 'dart:async';

class Validators {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if(regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('No es un mail válido');
      }
    }
  );

  final validatePass = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink){
      if(pass.length >= 6) {
        sink.add(pass);
      } else {
        sink.addError('No es un pass válido!');
      }
    }
  );
}