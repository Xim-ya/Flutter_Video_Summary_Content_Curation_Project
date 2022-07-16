import 'package:movie_curation/domain/useCase/api/youtube_load_search_list_use_case.dart';
import 'package:movie_curation/utilities/index.dart';

abstract class DomainModules {
  DomainModules._();

  static void dependencies() {
    /* Home */
    Get.lazyPut(() => LoadPopularMoviesUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TmdbLoadMovieTrailerKeyUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TmdbLoadMovieCastsUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => TmdbLoadDramaCastsUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => YoutubeLoadSearchListUseCase(Get.find()), fenix: true);
  }
}
