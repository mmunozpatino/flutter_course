import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterPageState();
}

// the _ make it private
class _CounterPageState extends State<CounterPage> {
  final _textStyle = TextStyle(fontSize: 25);

  int _count = 0;

  void _add() {
    setState(() => _count++);
  }

  void _subtract(){
    setState(()=> _count--);
  }

  void _reset(){
    setState(() => _count= 0);
  }

  Widget _createButtons() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
            child: Icon(Icons.exposure_zero),
            onPressed: _reset,
            backgroundColor: Colors.deepPurple),
        Expanded(
            child: SizedBox(
          width: 40.0,
        )),
        FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: _subtract,
            backgroundColor: Colors.deepPurple),
        SizedBox(
          width: 10.0,
        ),
        FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _add,
            backgroundColor: Colors.deepPurple)
      ],
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateFul'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Numero de tabs:', style: _textStyle),
          Text('$_count', style: _textStyle)
        ],
      )),
      floatingActionButton: _createButtons(),
    );
  }
}
