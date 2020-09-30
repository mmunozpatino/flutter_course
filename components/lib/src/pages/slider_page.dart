import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sliders'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _createSlider(),
              _createCheckbox(),
              _createSwitch(),
              Expanded(child: _crearImagen()),
            ],
          ),
        ));
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.deepPurpleAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valueSlider,
      min: 0.0,
      max: 400.0,
      onChanged: _bloquearCheck
          ? null
          : (value) {
              setState(() {
                _valueSlider = value;
              });
            },
    );
  }

  Widget _createCheckbox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (value){
    //     setState(() {
    //       _bloquearCheck = value;
    //     });
    //   },
    //   activeColor: Colors.deepPurpleAccent,
    // );
    return CheckboxListTile(
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
      activeColor: Colors.deepPurpleAccent,
      title: Text('Bloquear Slider'),
      subtitle: Text('No vas a poder cambiar el tamaño de la imagen'),
    );
  }

  Widget _createSwitch(){
    return SwitchListTile(
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
      activeColor: Colors.deepPurpleAccent,
      title: Text('Bloquear Slider'),
      subtitle: Text('No vas a poder cambiar el tamaño de la imagen'),
    );
  }
  
  Widget _crearImagen() {
    return Image(
        image: NetworkImage(
            'https://applauss.com/wp-content/uploads/2018/06/Wallpaper-04-770x513.jpg'),
        width: _valueSlider,
        fit: BoxFit.contain);
  }
}
