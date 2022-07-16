import 'dart:math';

import 'package:movie_curation/utilities/index.dart';

class TmdbLoadMovieTrailerKeyUseCase extends BaseUseCase<int, String?> {
  TmdbLoadMovieTrailerKeyUseCase(this._repository);
  final TmdbRepository _repository;

  // Random으로 영화 Trailer Key를 호출
  Random random = Random();

  @override
  Future<String?> call(int request) {
    final videoInfoList = _repository.loadMovieVideoInfo(request);
    final trailerKey = videoInfoList.then(
      (value) => value.fold(
        onSuccess: (data) {
          if (data.isEmpty) {
            return null;
          } else {
            int randomNum = random.nextInt(data.length);
            return data[randomNum].trailerKey;
          }
        },
        onFailure: (err) {
          print(err);
        },
      ),
    );
    return trailerKey;
  }
}
