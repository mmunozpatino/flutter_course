import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/search/search_delegat.dart';

import 'package:movies/src/widgets/card_swiper_widget.dart';
import 'package:movies/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {

    moviesProvider.getPopulars();

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Películas en Cines'),
          // backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context, 
                  delegate: MovieSearch()
                );
              },
            )
          ],
        ),
        body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperCards(),
            _footer(context)],
        )));
  }


  Widget _swiperCards() {

    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return CardSwiper( movies: snapshot.data );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
        
      },
    );
  }
  
  Widget _footer(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 1.0),
          Container(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead,)),
          SizedBox(height: 5.0,),
          StreamBuilder(
            stream: moviesProvider.popularsStream,
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return MovieHorizontal(
                  movieList: snapshot.data,
                  nextPage: moviesProvider.getPopulars,
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),

        ],
      ),
    );
  }
}
