import 'package:movie_curation/utilities/index.dart';

class ContentCastModel {
  final int id;
  final String role;
  final String name;
  final String? profileUrl;

  ContentCastModel(
      {required this.id,
      required this.role,
      required this.name,
      required this.profileUrl});

  factory ContentCastModel.fromMovieResponse(
          TmdbCastInfoItemResponse response) =>
      ContentCastModel(
          id: response.id,
          role: response.known_for_department,
          name: response.name,
          profileUrl: response.profile_path);

  factory ContentCastModel.fromDramaResponse(
          TmdbCastInfoItemResponse response) =>
      ContentCastModel(
          id: response.id,
          role: response.known_for_department,
          name: response.name,
          profileUrl: response.profile_path);
}
