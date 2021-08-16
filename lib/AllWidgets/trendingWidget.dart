import 'package:flutter/material.dart';
import 'package:music_app/models/movies.dart';

String avatarURL = "https://gravatar.com/avatar/4837a1f4c966b2e8fef270b932582c02?s=200&d=robohash&r=x";
class TrendingWidget extends StatelessWidget {
  final List<Movie> movies;
  TrendingWidget({this.movies});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("NEW",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold,))),
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    itemCount: movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Container(
                        height: 250,
                        width: 135,
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          child: Image.network(movie.poster,width: 100,height: 100,fit: BoxFit.cover,),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 40.0,),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("POPULAR",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold,))),
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    itemCount: movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Container(
                        height: 250,
                        width: 135,
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          child: Image.network(movie.poster,width: 100,height: 100,fit: BoxFit.cover,),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 40.0,),

                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("MUST WATCH",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold,))),
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    itemCount: movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Container(
                        height: 250,//100
                        width: 135,//130
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          child: Image.network(movie.poster,width: 130,height: 100,fit: BoxFit.cover,),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

