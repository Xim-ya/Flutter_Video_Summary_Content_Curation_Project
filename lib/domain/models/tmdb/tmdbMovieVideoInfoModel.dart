import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/response/tmdb_movie_video_info_item.dart';

class TmdbMovieVideoInfoParentModel {
  final int id;
  final List<TmdbMovieVideoInfoModel> results;

  TmdbMovieVideoInfoParentModel({required this.id, required this.results});

  factory TmdbMovieVideoInfoParentModel.fromResponse(
      TmdbMovieVideoInfoResponse response) {
    List<TmdbMovieVideoInfoModel> result = (response.results)
        .map((e) => TmdbMovieVideoInfoModel.fromResponse(e))
        .toList();
    return TmdbMovieVideoInfoParentModel(id: response.id, results: result);
  }
}

class TmdbMovieVideoInfoModel {
  final String title;
  final String site;
  final String trailerKey;

  TmdbMovieVideoInfoModel(
      {required this.title, required this.site, required this.trailerKey});

  factory TmdbMovieVideoInfoModel.fromResponse(
          TmdbMovieVideoInfoItemResponse response) =>
      TmdbMovieVideoInfoModel(
          title: response.name, site: response.site, trailerKey: response.key);
}
