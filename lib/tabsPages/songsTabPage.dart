import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/AllWidgets/trendingWidget.dart';
import 'package:music_app/models/movies.dart';

class SongsTabPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SongsTabPage>
{
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

  Widget build(BuildContext context)
  {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            child: TrendingWidget(movies: _movies),
               padding: const EdgeInsets.only(bottom: 5.0),
          /*SingleChildScrollView(
            child: TrendingWidget(movies: _movies),
          ),
          */
        ),
        ),
        debugShowCheckedModeBanner:false
    );
  }
}
/// This is the stateless widget that the main application instantiates.
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("This is Songs's Tabs Page",style: TextStyle(color: Colors.white));
  }
}