import 'package:movie_curation/utilities/index.dart';

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
