class Drama {
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String overview;
  final num voteAverage;

  Drama(
      {this.backDropUrl,
      this.posterUrl,
      required this.id,
      required this.title,
      required this.overview,
      required this.voteAverage});

  factory Drama.fromJson(Map<String, dynamic> json) => Drama(
        backDropUrl: json["backdrop_path"],
        posterUrl: json["poster_path"],
        id: json["id"],
        title: json["name"], //  -> name
        overview: json["overview"],
        voteAverage: json["vote_average"],
      );
}

class MovieTemp {
  final bool adult;
  final String? backDropUrl;
  final String? posterUrl;
  final num id;
  final String title;
  final String overview;
  final String releaseDate;
  final num voteAverage;

  MovieTemp(
      {required this.adult,
      this.backDropUrl,
      this.posterUrl,
      required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});

  factory MovieTemp.fromJson(Map<String, dynamic> json) => MovieTemp(
        adult: json['adult'], //
        backDropUrl: json["backdrop_path"],
        posterUrl: json["poster_path"],
        id: json["id"],
        title: json["title"], //  -> name
        overview: json["overview"],
        releaseDate: json["release_date"], //
        voteAverage: json["vote_average"],
      );
}
