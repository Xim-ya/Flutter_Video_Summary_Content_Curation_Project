import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_credit_response.dart';
import 'package:movie_curation/domain/models/content/content_cast_model.dart';

class TmdbMovieCreditInfoParentModel {
  final int id;
  final List<ContentCastModel> casts;

  TmdbMovieCreditInfoParentModel(this.id, this.casts);

  factory TmdbMovieCreditInfoParentModel.fromResponse(
      TmdbMovieCreditResponse response) {
    List<ContentCastModel> result = (response.cast)
        .map((e) => ContentCastModel.fromMovieResponse(e))
        .toList();
    return TmdbMovieCreditInfoParentModel(response.id, result);
  }
}
