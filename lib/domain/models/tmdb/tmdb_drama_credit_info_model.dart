import 'package:movie_curation/utilities/index.dart';

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
