import 'package:movie_curation/domain/useCase/tmdb/tmdb_load_movie_video_info_use_case.dart';
import 'package:movie_curation/domain/useCase/tmdb/tmdb_load_popular_movies_use_case.dart';
import 'package:movie_curation/ui/screens/home/home_view_model.dart';

import '../../../utilities/index.dart';

abstract class DomainModules {
  DomainModules._();

  static void dependencies() {
    /* Home */
    Get.lazyPut(() => LoadPopularMoviesUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => LoadTmdbLoadMovieTrailerKey(Get.find()), fenix: true);
  }
}
