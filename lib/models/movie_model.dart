import 'package:movie_curation/utilities/index.dart';

class MovieCore {
  List<Movie> movies = [];
  List<Genres> movieGenre = [];
  List<Actor> actors = [];

  late final Movie movie;

  void setSelectedMovie(int index) {
    movie = movies[index];
  }
}

/* Movie 포맷 */
class Movie {
  final bool adult;
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String overview;
  final String releaseDate;
  final num voteAverage;

  Movie(
      {required this.adult,
      this.backDropUrl,
      this.posterUrl,
      required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json['adult'],
        backDropUrl: json["backdrop_path"],
        posterUrl: json["poster_path"],
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"],
      );
}
