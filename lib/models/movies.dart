class Movie{
  final String imdbID;
  final String poster;
  final String title;
  final String year;

  Movie({this.imdbID, this.poster, this.title, this.year});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      imdbID: json["imdbID"],
      poster: json["Poster"],
      title: json["Title"],
      year: json["Year"]
    );
  }
}