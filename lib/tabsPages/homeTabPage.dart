import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/AllWidgets/moviesWidget.dart';
import 'package:music_app/models/movies.dart';

/*class HomeTabPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("This is Home Tabs Page",style: TextStyle(color: Colors.white),),
    );
  }
}
*/

class HomeTabPage extends StatefulWidget
{
  @override
  _State createState() => _State();
}

class _State extends State<HomeTabPage>
{
  //check error here
  List<Movie> _movies = <Movie>[];


  @override
  void initState(){
     super.initState();
     _populateAllMovies();
  }

  void _populateAllMovies() async{
    final movies = await _fetchAllMovies();
    setState(() {
      _movies = movies;
    });
  }

  Future<List<Movie>> _fetchAllMovies() async {
    final response = await http.get("http://www.omdbapi.com/?i=tt3896198&apikey=c4033450&s=Movies");

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else{
      throw Exception("Failed to Load Movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies App",

      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Movies"),
        ),
        body: Padding(
          child: MoviesWidget(movies: _movies),
            padding: const EdgeInsets.only(top: 12.0),
        ),

      ),
      debugShowCheckedModeBanner:false
    );
  }
}
