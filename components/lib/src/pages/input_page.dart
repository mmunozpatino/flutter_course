import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _pass = '';
  String _fecha = '';
  TextEditingController _inputFieldDate = TextEditingController();
  List<String> _poderes = ['Volar', 'Rayos X', 'Invisible', "Super Fuerza"];
  String _selectedOption = 'Volar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Inputs')),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          children: <Widget>[
            _createInput(),
            Divider(),
            _createEmail(),
            Divider(),
            _createPass(),
            Divider(),
            _createFecha(context),
            Divider(),
            _createDropDown(),
            Divider(),
            _createPerson(),
          ],
        ));
  }

  Widget _createInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Sólo es el nombre',
          suffixIcon: Icon(Icons.pets),
          icon: Icon(Icons.account_circle),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      onChanged: _handleName,
    );
  }

  void _handleName(String value) {
    setState(() {
      _nombre = value;
    });
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('El nombre es $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_selectedOption),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'E-mail',
          labelText: 'E-mail',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      // obscureText: true,
      decoration: InputDecoration(
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.perm_contact_calendar),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      controller: _inputFieldDate,
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDate.text = _fecha;
      });
    }
  }

  Widget _createPass() {
    return TextField(
      // keyboardType: TextInputType.,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      onChanged: (value) {
        setState(() {
          _pass = value;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropDown() {
    List<DropdownMenuItem<String>> list = List();

    _poderes.forEach((poder) => {
          list.add(
              DropdownMenuItem(child: Text(poder.toString()), value: poder))
        });

    return list;
  }

  Widget _createDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _selectedOption,
          items: getOptionsDropDown(),
          onChanged: (opt) {
            setState(() {
              _selectedOption = opt;
            });
          },
        )
      ],
    );
  }
}
