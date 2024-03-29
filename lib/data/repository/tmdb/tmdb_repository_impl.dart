import 'package:movie_curation/utilities/index.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  TmdbRepositoryImpl(this._dataSource);

  final TmdbRemoteDataSource _dataSource;

  /* TMDB - 인기 영화 리스트 */
  @override
  Future<Result<List<ContentModel>>> loadPopularMovie() async {
    try {
      final response = await _dataSource.loadPopularMovie().then((value) =>
          value.results.map(ContentModel.fromMovieResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* TMDB - 인기 드라마 리스트 */
  @override
  Future<Result<List<ContentModel>>> loadPopularDrama() async {
    try {
      final response = await _dataSource.loadPopularDrama().then((value) =>
          value.results.map(ContentModel.fromDramaResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* TMDB - 영화 비디오 정보 */
  @override
  Future<Result<List<TmdbMovieVideoInfoModel>>> loadMovieVideoInfo(
      contentId) async {
    try {
      final response = await _dataSource.loadTmdbMovieVideoInfo(contentId).then(
          (value) =>
              value.results.map(TmdbMovieVideoInfoModel.fromResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* TMDB - 드라마 크래딧 리스트 */
  @override
  Future<Result<List<ContentCastModel>>> loadDramaCastInfo(int dramaId) async {
    try {
      final response = await _dataSource.loadTmdbMovieCredit(dramaId).then(
          (value) =>
              value.cast.map(ContentCastModel.fromDramaResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* TMDB - 영화 크래딧 리스트 */
  @override
  Future<Result<List<ContentCastModel>>> loadMovieCastInfo(int movieId) async {
    try {
      final response = await _dataSource.loadTmdbMovieCredit(movieId).then(
          (value) =>
              value.cast.map(ContentCastModel.fromMovieResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* TMDB - 영화 상세 정보 */
  @override
  Future<TmdbMovieDetailInfoResponse> loadMovieDetailInfo(int movieId) {
    return _dataSource.loadTmdbMovieDetailInfo(movieId);
  }

  @override
  Future<Result<List<ContentModel>>> loadMovieListByGenre(
      {required int genreId, required int page}) async {
    try {
      final response = await _dataSource
          .loadMovieListByGenre(genreId: genreId, page: page)
          .then((value) => value.results
              .map(ContentModel.fromGenreMovieListResponse)
              .toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* TMDB - 검색 결과 영화 리스트 */
  @override
  Future<Result<List<ContentModel>>> loadMovieSearchList(String query) async {
    try {
      final response = await _dataSource.loadMovieSearchList(query).then(
          (value) =>
              value.results.map(ContentModel.fromMovieResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  /* TMDB - 선택된 컨텐츠와 유사한 영화 리스트 */
  @override
  Future<Result<List<ContentModel>>> loadSimilarMovieList(int movieId) async {
    try {
      final response = await _dataSource.loadSimilarMovieList(movieId).then(
          (value) =>
              value.results.map(ContentModel.fromMovieResponse).toList());
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
