import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_drama_credit_response.dart';
import 'package:movie_curation/domain/models/content/content_cast_model.dart';

class TmdbDramaCreditInfoParentModel {
  final int id;
  final List<ContentCastModel> casts;

  TmdbDramaCreditInfoParentModel(this.id, this.casts);

  factory TmdbDramaCreditInfoParentModel.fromResponse(
      TmdbDramaCreditResponse response) {
    List<ContentCastModel> result = (response.cast)
        .map((e) => ContentCastModel.fromDramaResponse(e))
        .toList();
    return TmdbDramaCreditInfoParentModel(response.id, result);
  }
}
