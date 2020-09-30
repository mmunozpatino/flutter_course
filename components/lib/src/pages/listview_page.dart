import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scroll = ScrollController();

  List<int> _numerosList = new List();
  int _lastItem = 0;

  bool _isLoading = false;

  //hot reload
  @override
  void initState() {
    super.initState();

    _add10images();

    _scroll.addListener(() {
      if (_scroll.position.pixels == _scroll.position.maxScrollExtent) {
        // _add10images();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[
            _createList(),
            _createLoading()
          ],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getPage1 ,
          child: ListView.builder(
        controller: _scroll,
        itemCount: _numerosList.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _numerosList[index];

          return FadeInImage.assetNetwork(
            image: 'https://picsum.photos/id/$imagen/500/300',
            placeholder: 'assets/jar-loading.gif',
            fit: BoxFit.cover,
            height: 300.0,
          );
        },
      ),
    );
  }

  Future<void> _getPage1() async{
    final duration = Duration(seconds: 2);

    Timer(duration, (){

      _numerosList.clear();
      _lastItem ++;
      _add10images();

    });

    return Future.delayed(duration);
  }

  Widget _add10images() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _numerosList.add(_lastItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    Timer(Duration(seconds: 2), _respHttp);
  }

  void _respHttp() {
    _isLoading = false;
    // setState(() {});
    _scroll.animateTo(
      _scroll.position.pixels +100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _add10images();
  }

  Widget _createLoading(){
    if(_isLoading){
      // return CircularProgressIndicator();
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
        );
    }else{
      return Container();
    }
  }
}
