import 'package:movie_curation/utilities/index.dart';

class TmdbMovieDetailGenreModel {
  final int id;
  final String name;

  TmdbMovieDetailGenreModel({required this.id, required this.name});

  factory TmdbMovieDetailGenreModel.fromResponse(MovieGenreResponse response) {
    return TmdbMovieDetailGenreModel(id: response.id, name: response.name);
  }
}
