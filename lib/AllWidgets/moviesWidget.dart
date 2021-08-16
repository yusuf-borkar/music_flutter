import 'package:flutter/material.dart';
import 'package:music_app/models/movies.dart';

String avatarURL = "https://gravatar.com/avatar/4837a1f4c966b2e8fef270b932582c02?s=200&d=robohash&r=x";

class MoviesWidget extends StatelessWidget {
  final List<Movie> movies;
  MoviesWidget({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
      itemBuilder: (context, index){

          final movie = movies[index];

          return ListTile(
            title: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: ClipRRect(
                    child: Image.network(movie.poster),
                    borderRadius: BorderRadius.circular(8),
                  )
                ),
                Flexible(

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title,style: TextStyle(color: Colors.white),),
                        Text(movie.year,style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                )
              ],
            )
          );
      },
    );

  }
}
